import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/MyListingsService/myListingsService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/vehicleService.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Services/PromotionService/promotionService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:logger/Logger.dart';
import 'package:shimmer/shimmer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListingsDetailPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const ListingsDetailPage({
    super.key,
    required this.allJson,
  });

  @override
  State<ListingsDetailPage> createState() => _ListingsDetailPageState();
}

class _ListingsDetailPageState extends State<ListingsDetailPage> {
  late final Map<String, dynamic> listing;
  final logger = Logger();
  int selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  double _appBarHeight = 300;
  double _imageOpacity = 1.0;
  bool _isDeleting = false;
  bool _isMarkingAsSold = false;
  bool _isSold = false;
  bool _isPromoted = false;
  bool _isActivatingPromotion = false;
  
  // New variable to control promotion flow
  bool canPromote = false; // Set to false initially to test payment flow

  @override
  void initState() {
    super.initState();
    // Safe initialization of listing data
    try {
      listing = widget.allJson['listing'] as Map<String, dynamic>? ?? {};
      _isSold = listing['status'] == 'sold';
      _isPromoted = listing['is_promoted'] == true;
      logger.w('listing data: $listing');
    } catch (e) {
      logger.e('Error initializing listing: $e');
      listing = {};
    }
    
    _scrollController.addListener(() {
      if (mounted) {
        setState(() {
          final scrollOffset = _scrollController.offset;
          _imageOpacity = (1.0 - (scrollOffset / _appBarHeight)).clamp(0.0, 1.0);
          
          if (scrollOffset > 0) {
            _appBarHeight = (300 - scrollOffset).clamp(100.0, 300.0);
          } else {
            _appBarHeight = 300.0;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // ========== PROMOTION FLOW METHODS ==========

  Future<void> _navigateToPromotionsPageForPromotion() async {
    logger.i("🔄 Starting promotion flow - payment required");
    
    try {
      // Store promotion data for later (similar to vehicle upload flow)
      await _storePromotionDataForLater();
      
      // Navigate to promotions page with just the type (same pattern as upload)
      final result = await Get.toNamed(
        RouteClass.getPromotionsPage(),
        arguments: {
          'type': 'promotion',
          'listing': listing, // Pass listing data if needed by promotions page
        },
      );
      
      // Handle payment result if needed
      if (result == true && mounted) {
        logger.i("✅ Payment completed for promotion");
        // The actual promotion activation will happen in WebViewPaymentPage
      }
    } catch (e, stackTrace) {
      logger.e("❌ Error navigating to promotions page: $e");
      logger.e("❌ Stack trace: $stackTrace");
      _showErrorSnackBar('Failed to start promotion process');
    }
  }

  Future<void> _storePromotionDataForLater() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Store promotion data (following the same pattern as vehicle upload)
      final promotionData = {
        'item_id': listing['id']?.toString(),
        'listing_name': getListingName(),
        'listing_id': listing['id']?.toString(),
        // Add any other data needed for promotion activation after payment
      };
      
      await prefs.setString('pending_promotion_data', json.encode(promotionData));
      await prefs.setBool('pending_promotion', true);
      
      logger.i("✅ Promotion data stored for later activation:");
      logger.i("   - Item ID: ${listing['id']}");
      logger.i("   - Listing Name: ${getListingName()}");
      
    } catch (e, stackTrace) {
      logger.e("❌ Error storing promotion data: $e");
      logger.e("❌ Stack trace: $stackTrace");
      rethrow;
    }
  }

  Future<void> _activatePromotionDirectly() async {
    if (_isActivatingPromotion) return;

    setState(() => _isActivatingPromotion = true);

    try {
      final listingId = listing['id']?.toString();
      if (listingId == null || listingId.isEmpty) {
        throw Exception('Invalid listing ID');
      }

      // Calculate promotion dates (7 days as default)
      final dates = PromotionService.calculatePromotionDates(7);
      
      logger.i("🎯 Activating promotion directly for listing: $listingId");
      
      // Activate promotion using the service
      final result = await PromotionService.activatePromotion(
        itemId: listingId,
        startAt: dates['start_at']!,
        endAt: dates['end_at']!,
        status: 'active',
      );

      if (result['success'] == true) {
        logger.i("✅ Promotion activated successfully");
        
        // Show success dialog with navigation to MyListingPage
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Promotion Activated!',
          desc: 'Your listing is now being promoted and will receive more visibility.',
          btnOkText: 'View My Listings',
          btnOkOnPress: () {
            // ✅ FIXED: Navigate to MyListingPage after successful promotion
            _navigateToMyListingPage();
          },
          autoHide: Duration(seconds: 4),
        ).show();

        // Update UI state
        if (mounted) {
          setState(() {
            _isPromoted = true;
          });
        }

      } else {
        logger.e("❌ Failed to activate promotion: ${result['message']}");
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Promotion Failed',
          desc: result['message'] ?? 'Failed to activate promotion',
          btnOkText: 'OK',
          btnOkOnPress: () {},
        ).show();
      }
    } catch (e, stackTrace) {
      logger.e("❌ Error activating promotion: $e");
      logger.e("❌ Stack trace: $stackTrace");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Failed to activate promotion: ${e.toString()}',
        btnOkText: 'OK',
        btnOkOnPress: () {},
      ).show();
    } finally {
      if (mounted) {
        setState(() => _isActivatingPromotion = false);
      }
    }
  }

  void _navigateToMyListingPage() {
    logger.i("🔄 Navigating to MyListingPage");
    Get.offAllNamed(RouteClass.myListingPage);
  }

  void _handlePromoteButton() {
    if (_isSold) {
      _showErrorSnackBar('Cannot promote sold listings');
      return;
    }

    if (_isPromoted) {
      _showErrorSnackBar('This listing is already promoted');
      return;
    }

    if (canPromote) {
      // Direct promotion - no payment required
      logger.i("🎯 Direct promotion flow - no payment required");
      _showDirectPromotionConfirmation();
    } else {
      // Payment required - navigate to promotions page
      logger.i("💰 Payment promotion flow - navigating to packages");
      _navigateToPromotionsPageForPromotion();
    }
  }

  void _showDirectPromotionConfirmation() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.bottomSlide,
      title: 'Activate Promotion?',
      desc: 'Do you want to activate promotion for this listing? This will increase your listing visibility.',
      btnCancelText: 'Cancel',
      btnOkText: 'Yes, Activate',
      btnCancelOnPress: () {},
      btnOkOnPress: _activatePromotionDirectly,
      btnOkColor: Colors.blue,
    ).show();
  }

  void _showErrorSnackBar(String message) {
    showCustomSnackBar(
      backgroundColor: ColorGlobalVariables.redColor,
      title: "Error",
      message: message
    );
  }

  // ========== EXISTING METHODS (Keep all your existing functionality) ==========

  // Safe data access methods
  String getListingName() {
    try {
      final name = listing['name'];
      if (name is String && name.isNotEmpty) return name;
    } catch (e) {
      logger.e('Error getting listing name: $e');
    }
    return 'Vehicle Listing';
  }

  String getListingPrice() {
    try {
      final price = listing['price'];
      if (price is String && price.isNotEmpty) {
        return 'GH₵ ${formatNumber(shortenerRequired: false, number: int.parse(price))}';
      } else if (price is num) {
        return 'GH₵ ${formatNumber(shortenerRequired: false, number: price.toInt())}';
      }
    } catch (e) {
      logger.e('Error getting listing price: $e');
    }
    return 'GH₵ 0';
  }

  String getListingDescription() {
    try {
      final description = listing['description'];
      if (description is String && description.isNotEmpty) return description;
    } catch (e) {
      logger.e('Error getting listing description: $e');
    }
    return 'No description available for this vehicle.';
  }

  List<dynamic> getListingImages() {
    try {
      final images = listing['images'];
      if (images is List && images.isNotEmpty) {
        return images.whereType<String>().toList();
      }
    } catch (e) {
      logger.e('Error getting listing images: $e');
    }
    return ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'];
  }

  String getListingLocation() {
    try {
      final location = listing['location'];
      if (location is String && location.isNotEmpty) return location;
    } catch (e) {
      logger.e('Error getting listing location: $e');
    }
    return 'Location not available';
  }

  String getListingCondition() {
    try {
      final condition = listing['condition'];
      if (condition is String && condition.isNotEmpty) return condition;
    } catch (e) {
      logger.e('Error getting listing condition: $e');
    }
    return 'Used';
  }

  String getListingTransmission() {
    try {
      final transmission = listing['transmission'];
      if (transmission is String && transmission.isNotEmpty) return transmission;
    } catch (e) {
      logger.e('Error getting listing transmission: $e');
    }
    return 'Manual';
  }

  String getListingMileage() {
    try {
      final mileage = listing['mileage'];
      if (mileage is String && mileage.isNotEmpty) return '$mileage km';
      if (mileage is num) return '${mileage.toString()} km';
    } catch (e) {
      logger.e('Error getting listing mileage: $e');
    }
    return 'N/A';
  }

  String getListingYear() {
    try {
      final year = listing['year'];
      if (year is String && year.isNotEmpty) return year;
      if (year is num) return year.toString();
    } catch (e) {
      logger.e('Error getting listing year: $e');
    }
    return 'N/A';
  }

  String getListingFuelType() {
    try {
      final fuelType = listing['fuel_type'];
      if (fuelType is String && fuelType.isNotEmpty) return fuelType;
    } catch (e) {
      logger.e('Error getting listing fuel type: $e');
    }
    return 'N/A';
  }

  String getListingEngineCapacity() {
    try {
      final engine = listing['engine_capacity'];
      if (engine is String && engine.isNotEmpty) return '$engine L';
      if (engine is num) return '${engine.toString()} L';
    } catch (e) {
      logger.e('Error getting listing engine capacity: $e');
    }
    return 'N/A';
  }

  String getListingColor() {
    try {
      final color = listing['color'];
      if (color is String && color.isNotEmpty) return color;
    } catch (e) {
      logger.e('Error getting listing color: $e');
    }
    return 'N/A';
  }

  String getListingBodyType() {
    try {
      final bodyType = listing['body_type'];
      if (bodyType is String && bodyType.isNotEmpty) return bodyType;
    } catch (e) {
      logger.e('Error getting listing body type: $e');
    }
    return 'N/A';
  }

  String getListingDriveType() {
    try {
      final driveType = listing['drive_type'];
      if (driveType is String && driveType.isNotEmpty) return driveType;
    } catch (e) {
      logger.e('Error getting listing drive type: $e');
    }
    return 'N/A';
  }

  String getListingSeats() {
    try {
      final seats = listing['number_of_passengers'];
      if (seats is String && seats.isNotEmpty) return '$seats seats';
      if (seats is num) return '${seats.toString()} seats';
    } catch (e) {
      logger.e('Error getting listing seats: $e');
    }
    return 'N/A';
  }

  String getListingBrand() {
    try {
      final brand = listing['brand'];
      if (brand is Map<String, dynamic>) {
        return brand['name']?.toString() ?? 'N/A';
      } else if (brand is String && brand.isNotEmpty) {
        return brand;
      }
    } catch (e) {
      logger.e('Error getting listing brand: $e');
    }
    return 'N/A';
  }

  String getListingModel() {
    try {
      final model = listing['brand_model'];
      if (model is Map<String, dynamic>) {
        return model['name']?.toString() ?? 'N/A';
      } else if (model is String && model.isNotEmpty) {
        return model;
      }
    } catch (e) {
      logger.e('Error getting listing model: $e');
    }
    return 'N/A';
  }

  bool get hasWarranty {
    try {
      final warranty = listing['warranty'];
      if (warranty is bool) return warranty;
      if (warranty is String) return warranty.toLowerCase() == 'true' || warranty.isNotEmpty;
      if (warranty is num) return warranty > 0;
      if (warranty is Map) return warranty.isNotEmpty;
      return false;
    } catch (e) {
      logger.e('Error checking warranty: $e');
      return false;
    }
  }

  String getWarrantyDetails() {
    if (!hasWarranty) return '';
    
    try {
      final warranty = listing['warranty'];
      if (warranty is String && warranty.isNotEmpty) return warranty;
      if (warranty is Map<String, dynamic>) {
        return warranty['details']?.toString() ?? 
               warranty['duration']?.toString() ?? 
               warranty['type']?.toString() ?? 
               'Warranty Included';
      }
      return 'Warranty Included';
    } catch (e) {
      logger.e('Error getting warranty details: $e');
      return 'Warranty Included';
    }
  }

  List<Map<String, String>> getHighlights() {
    final List<Map<String, String>> highlights = [];
    
    final year = getListingYear();
    if (year != 'N/A') {
      highlights.add({'title': 'Model Year', 'value': year});
    }
    
    final mileage = getListingMileage();
    if (mileage != 'N/A') {
      highlights.add({'title': 'Mileage', 'value': mileage});
    }
    
    final engine = getListingEngineCapacity();
    if (engine != 'N/A') {
      highlights.add({'title': 'Engine Capacity', 'value': engine});
    }
    
    final condition = getListingCondition();
    if (condition != 'N/A') {
      highlights.add({'title': 'Condition', 'value': condition});
    }
    
    final fuelType = getListingFuelType();
    if (fuelType != 'N/A') {
      highlights.add({'title': 'Fuel Type', 'value': fuelType});
    }
    
    final transmission = getListingTransmission();
    if (transmission != 'N/A') {
      highlights.add({'title': 'Transmission', 'value': transmission});
    }
    
    if (hasWarranty) {
      final warrantyDetails = getWarrantyDetails();
      highlights.add({'title': 'Warranty', 'value': warrantyDetails});
    }
    
    if (highlights.isEmpty) {
      highlights.addAll([
        {'title': 'Model Year', 'value': getListingYear()},
        {'title': 'Mileage', 'value': getListingMileage()},
        {'title': 'Condition', 'value': getListingCondition()},
      ]);
    }
    
    return highlights;
  }

  List<Map<String, String>> getSpecifications() {
    final List<Map<String, String>> specifications = [];
    
    final brand = getListingBrand();
    if (brand != 'N/A') {
      specifications.add({'title': 'Make', 'value': brand});
    }
    
    final model = getListingModel();
    if (model != 'N/A') {
      specifications.add({'title': 'Model', 'value': model});
    }
    
    final color = getListingColor();
    if (color != 'N/A') {
      specifications.add({'title': 'Color', 'value': color});
    }
    
    final bodyType = getListingBodyType();
    if (bodyType != 'N/A') {
      specifications.add({'title': 'Body Type', 'value': bodyType});
    }
    
    final driveType = getListingDriveType();
    if (driveType != 'N/A') {
      specifications.add({'title': 'Drive Type', 'value': driveType});
    }
    
    final seats = getListingSeats();
    if (seats != 'N/A') {
      specifications.add({'title': 'Seating Capacity', 'value': seats});
    }
    
    final fuelType = getListingFuelType();
    if (fuelType != 'N/A' && !specifications.any((spec) => spec['title'] == 'Fuel Type')) {
      specifications.add({'title': 'Fuel Type', 'value': fuelType});
    }
    
    final transmission = getListingTransmission();
    if (transmission != 'N/A' && !specifications.any((spec) => spec['title'] == 'Transmission')) {
      specifications.add({'title': 'Transmission', 'value': transmission});
    }
    
    if (specifications.isEmpty) {
      specifications.addAll([
        {'title': 'Make', 'value': getListingBrand()},
        {'title': 'Model', 'value': getListingModel()},
        {'title': 'Color', 'value': getListingColor()},
      ]);
    }
    
    return specifications;
  }

  List<Widget> _buildTags(BuildContext context) {
    final List<Widget> tags = [];
    
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final isPaidSeller = userProvider.isPaidSeller;
    
    if (hasWarranty) {
      tags.add(_buildTag("Warranty", ColorGlobalVariables.greyColor));
    }
    
    if (isPaidSeller) {
      tags.add(_buildVerifiedSellerTag());
    }
    
    if (_isPromoted && !_isSold) {
      tags.add(_buildPromotedTag());
    }
    
    return tags;
  }

  void _showMarkAsSoldConfirmationDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      title: 'Mark as Sold?',
      desc: 'Are you sure you want to mark this item as sold? This action cannot be undone.',
      btnCancelText: 'Cancel',
      btnOkText: 'Yes, Mark as Sold',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        _performMarkAsSold();
      },
      btnOkColor: Colors.green,
    ).show();
  }

  Future<void> _performMarkAsSold() async {
    if (_isMarkingAsSold) return;

    setState(() => _isMarkingAsSold = true);

    try {
      final listingId = listing['id']?.toString();
      if (listingId == null || listingId.isEmpty) {
        throw Exception('Invalid listing ID');
      }

      final result = await VehicleService.markAsSold(listingId);

      if (result['success'] == true) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Success!',
          desc: 'Item has been marked as sold successfully.',
          btnOkText: 'OK',
          btnOkOnPress: () {
            // Navigate back to MyListingPage after successful marking
            _navigateToMyListingPage();
          },
          autoHide: Duration(seconds: 3),
        ).show();

        setState(() {
          _isSold = true;
        });

      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Error',
          desc: result['message'] ?? 'Failed to mark item as sold',
          btnOkText: 'OK',
          btnOkOnPress: () {},
        ).show();
      }
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Failed to mark item as sold: ${e.toString()}',
        btnOkText: 'OK',
        btnOkOnPress: () {},
      ).show();
    } finally {
      if (mounted) {
        setState(() => _isMarkingAsSold = false);
      }
    }
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.orange[700],
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "Delete Listing?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                const Text(
                  "Are you sure you want to delete this car listing? This action cannot be undone and all data will be permanently lost.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                Text(
                  getListingName(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 24),
                
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _performDelete();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _performDelete() async {
    if (_isDeleting) return;

    setState(() => _isDeleting = true);

    try {
      final listingId = listing['id']?.toString();
      if (listingId == null || listingId.isEmpty) {
        throw Exception('Invalid listing ID');
      }

      final result = await MyListingsService.deleteListing(listingId);

      if (result['success'] == true) {
        Get.snackbar(
          'Success',
          result['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
        
        // Navigate to MyListingPage after successful deletion
        await Future.delayed(const Duration(milliseconds: 800));
        if (mounted) {
          _navigateToMyListingPage();
        }
      } else {
        Get.snackbar(
          'Error',
          result['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete listing: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      if (mounted) {
        setState(() => _isDeleting = false);
      }
    }
  }

  Widget _buildShimmerPlaceholder(double? width, double? height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }

  Widget _buildCustomErrorWidget(double? width, double? height) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Center(
        child: Icon(
          Icons.broken_image,
          size: (width ?? 45) * 0.4,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget buildSafeImage(String imagePath, {double? width, double? height, BoxFit fit = BoxFit.cover}) {
    try {
      if (imagePath.startsWith('http')) {
        return Image.network(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => _buildCustomErrorWidget(width, height),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildShimmerPlaceholder(width, height);
          },
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: frame != null ? child : _buildShimmerPlaceholder(width, height),
            );
          },
        );
      } else if (imagePath.startsWith('assets/')) {
        return Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => _buildCustomErrorWidget(width, height),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: frame != null ? child : _buildShimmerPlaceholder(width, height),
            );
          },
        );
      } else {
        return _buildCustomErrorWidget(width, height);
      }
    } catch (e) {
      logger.e('Error loading image: $e');
      return _buildCustomErrorWidget(width, height);
    }
  }

  @override
  Widget build(BuildContext context) {
    final carHighlights = getHighlights();
    final carSpecifications = getSpecifications();
    final images = getListingImages();
    final currentImage = images.isNotEmpty && selectedIndex < images.length 
        ? images[selectedIndex] 
        : '${ImageStringGlobalVariables.imagePath}car_placeholder.png';

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            floating: false,
            pinned: true,
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.arrow_back_ios_new_outlined, 
                    color: Colors.white, size: 18),
              ),
              onPressed: () => Get.back(),
            ),
            title: AnimatedOpacity(
              opacity: _imageOpacity < 0.2 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                getListingName(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Opacity(
                    opacity: _imageOpacity,
                    child: buildSafeImage(
                      currentImage,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                  
                  Positioned(
                    left: 25,
                    bottom: 80,
                    child: AnimatedOpacity(
                      opacity: _imageOpacity,
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getListingName(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            getListingPrice(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (_isSold)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'SOLD',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                  if (_isPromoted && !_isSold)
                    Positioned(
                      top: 16,
                      left: _isSold ? 70 : 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.amber[700],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              'PROMOTED',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  Positioned(
                    top: 16,
                    right: 16,
                    child: AnimatedOpacity(
                      opacity: _imageOpacity,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          '${selectedIndex + 1}/${images.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: _isDeleting ? null : _showDeleteConfirmationDialog,
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _isDeleting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.delete, color: Colors.white, size: 20),
                ),
              ),
              IconButton(
                onPressed: _isSold ? null : () {
                  Get.toNamed(
                    RouteClass.getEditItemPage(),
                    arguments: {
                      'listing': listing
                    }
                  );
                },
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
          
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 12),
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        final image = index < images.length ? images[index] : '${ImageStringGlobalVariables.imagePath}car_placeholder.png';
                        return GestureDetector(
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: index == selectedIndex 
                                    ? ColorGlobalVariables.redColor 
                                    : Colors.transparent,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: Stack(
                                children: [
                                  buildSafeImage(
                                    image,
                                    width: 120,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                  if (index == selectedIndex)
                                    Container(
                                      color: Colors.black.withOpacity(0.3),
                                      child: const Center(
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getListingDescription(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(height: 1),
                  const SizedBox(height: 20),
                  _buildInfoRow(Icons.location_on_outlined, getListingLocation()),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.refresh_outlined, formatTimeAgo(listing['created_at']?.toString() ?? '')),
                  const SizedBox(height: 20),
                  
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _buildTags(context),
                  ),
                  
                  const SizedBox(height: 28),
                  _buildSectionTitle("Highlights"),
                  const SizedBox(height: 16),
                  _buildWrapItems(carHighlights),
                  const SizedBox(height: 28),
                  _buildSectionTitle("Specifications"),
                  const SizedBox(height: 16),
                  _buildWrapItems(carSpecifications, isSpecification: true),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: _isSold 
                          ? _buildSoldButton()
                          : _buildActionButton(
                              "Mark as Sold",
                              Icons.check,
                              Colors.green,
                              onPressed: _showMarkAsSoldConfirmationDialog,
                              isLoading: _isMarkingAsSold,
                            ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _isSold 
                          ? _buildSoldPromoteButton()
                          : _isPromoted 
                            ? _buildPromotedButton()
                            : _buildActionButton(
                                "Promote",
                                FontAwesomeIcons.bullhorn,
                                Colors.blue,
                                onPressed: _handlePromoteButton,
                                isLoading: _isActivatingPromotion,
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildPromotedTag() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.amber[700], size: 16),
          const SizedBox(width: 6),
          Text(
            "Promoted",
            style: TextStyle(
              color: Colors.amber[800],
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifiedSellerTag() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Verified Seller",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 6),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.blue,
            child: Icon(Icons.check, size: 14, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildWrapItems(List<Map<String, String>> items, {bool isSpecification = false}) {
    return Wrap(
      spacing: 24.0,
      runSpacing: 16.0,
      children: items.map((item) {
        return IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item["title"] ?? "N/A",
                style: TextStyle(
                  fontSize: 14.0,
                  color: isSpecification ? Colors.black54 : Colors.black87,
                  fontWeight: isSpecification ? FontWeight.normal : FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item["value"] ?? "N/A",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: isSpecification ? FontWeight.w600 : FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSoldButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, color: Colors.white, size: 20),
          SizedBox(width: 8),
          Text(
            "Sold",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotedButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber[700]!, Colors.orange[700]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.white, size: 20),
          SizedBox(width: 8),
          Text(
            "Promoted",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoldPromoteButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.block, color: Colors.white, size: 20),
          SizedBox(width: 8),
          Text(
            "Cannot Promote",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, Color color, {
    VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(icon, size: 20, color: Colors.white),
              ],
            ),
    );
  }
}