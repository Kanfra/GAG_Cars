import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Links/links.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textLarge.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/specialOfferModel.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class SpecialOfferDetailPage extends StatefulWidget {
  final SpecialOffer specialOffer; // CHANGED: Now takes SpecialOffer object
  const SpecialOfferDetailPage({
    super.key, 
    required this.specialOffer, // CHANGED: parameter name
  });

  @override
  State<SpecialOfferDetailPage> createState() => _SpecialOfferDetailPageState();
}

class _SpecialOfferDetailPageState extends State<SpecialOfferDetailPage> {
  final ScrollController _scrollController = ScrollController();
  double _appBarHeight = 300;
  double _imageOpacity = 1.0;
  int selectedIndex = 0;

  late SpecialOffer _specialOffer;
  late Item _item;
  late Brand? _brand;

  @override
  void initState() {
    super.initState();
    
    // SIMPLE INITIALIZATION - No JSON parsing needed
    _specialOffer = widget.specialOffer;
    _item = _specialOffer.item ?? _createFallbackItem();
    _brand = _item.brand;
    
    print('✅ Special Offer Detail Initialized Successfully');
    print('Special Offer ID: ${_specialOffer.id}');
    print('Item Name: ${_item.name}');
    print('Item Images: ${_item.images}');
    print('Brand: ${_brand?.name}');
    
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

  Item _createFallbackItem() {
    return Item(
      id: 'fallback-item',
      name: 'Special Offer Vehicle',
      price: '0',
      year: '2023',
      condition: 'used',
      location: 'Accra',
      description: 'This is a special offer vehicle',
      images: ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'],
      brand: Brand(
        id: 1,
        name: 'Brand',
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Price formatting and calculations
  String _formatPrice(String price) {
    try {
      final number = int.parse(price);
      return NumberFormat.currency(
        symbol: 'GH₵ ',
        decimalDigits: 0,
      ).format(number);
    } catch (e) {
      return 'GH₵ $price';
    }
  }

  String _calculateDiscountedPrice() {
    try {
      final originalPrice = int.parse(_item.price ?? '0');
      final discount = _specialOffer.discount;
      final discountedPrice = originalPrice - (originalPrice * discount ~/ 100);
      return _formatPrice(discountedPrice.toString());
    } catch (e) {
      return 'Price unavailable';
    }
  }

  String _getSavingsAmount() {
    try {
      final originalPrice = int.parse(_item.price ?? '0');
      final discount = _specialOffer.discount;
      return (originalPrice * discount ~/ 100).toString();
    } catch (e) {
      return '0';
    }
  }

  // Date formatting
  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM dd, yyyy - hh:mm a').format(date);
    } catch (e) {
      return dateString;
    }
  }

  // Offer status
  bool _isOfferActive() {
    try {
      final now = DateTime.now();
      final start = DateTime.parse(_specialOffer.startAt);
      final end = DateTime.parse(_specialOffer.endAt);
      return now.isAfter(start) && now.isBefore(end);
    } catch (e) {
      return false;
    }
  }

  String _getTimeRemaining() {
    try {
      final now = DateTime.now();
      final end = DateTime.parse(_specialOffer.endAt);
      final difference = end.difference(now);
      
      if (difference.isNegative) {
        return 'Offer expired';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} days left';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hours left';
      } else {
        return 'Ending soon';
      }
    } catch (e) {
      return 'Limited time';
    }
  }

  // Image handling
  Widget _buildShimmerPlaceholder(double? width, double? height) {
    final safeWidth = width ?? 100.0;
    final safeHeight = height ?? 100.0;
    
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: safeWidth,
        height: safeHeight,
        color: Colors.white,
      ),
    );
  }

  Widget _buildCustomErrorWidget(double? width, double? height) {
    final safeWidth = width ?? 100.0;
    final safeHeight = height ?? 100.0;
    final iconSize = (safeWidth * 0.4).clamp(16.0, 48.0);
    
    return Container(
      width: safeWidth,
      height: safeHeight,
      color: Colors.grey[300],
      child: Center(
        child: Icon(
          Icons.broken_image,
          size: iconSize,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget buildSafeImage(String imagePath, {double? width, double? height, BoxFit fit = BoxFit.cover}) {
    try {
      if (imagePath.isEmpty) {
        return _buildCustomErrorWidget(width, height);
      }

      final imageUrl = getImageUrl(imagePath, '${ImageStringGlobalVariables.imagePath}car_placeholder.png');
      
      return Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _buildCustomErrorWidget(width, height);
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildShimmerPlaceholder(width, height);
        },
      );
    } catch (e) {
      return _buildCustomErrorWidget(width, height);
    }
  }

  List<String> getItemImages() {
    try {
      final images = _item.images;
      if (images != null && images.isNotEmpty) {
        return images.where((image) => image != null && image.isNotEmpty).toList();
      }
    } catch (e) {
      print('Error getting item images: $e');
    }
    return ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'];
  }

  // Safe time ago formatting
  String safeFormatTimeAgo(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return 'Recently';
    }
    try {
      return formatTimeAgo(dateString);
    } catch (e) {
      return 'Recently';
    }
  }

  // Contact methods
  String? _getUserPhoneNumber() {
    try {
      final user = _item.user;
      if (user is Map<String, dynamic>) {
        return user['phoneNumber']?.toString() ?? 
               user['phone_number']?.toString() ??
               user['contact']?.toString() ??
               user['mobile']?.toString();
      }
      return _item.userId?.toString();
    } catch (e) {
      return null;
    }
  }

  String _getUserName() {
    try {
      final user = _item.user;
      if (user is Map<String, dynamic>) {
        return user['name']?.toString() ?? 
               user['username']?.toString() ??
               'Seller';
      }
      return 'Seller';
    } catch (e) {
      return 'Seller';
    }
  }

  void _showContactDialog() {
    final phoneNumber = _getUserPhoneNumber();
    final userName = _getUserName();

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
                // Header
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.contact_phone,
                        color: Colors.blue[700],
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "Contact Information",
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
                
                // Seller name
                Text(
                  "Seller: $userName",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Phone number
                if (phoneNumber != null && phoneNumber.isNotEmpty) ...[
                  const Text(
                    "Phone Number:",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      phoneNumber,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "You can call or message this number to contact the seller.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ] else ...[
                  Column(
                    children: [
                      const Icon(
                        Icons.contact_phone_outlined,
                        size: 48,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "No contact information available",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "The seller hasn't provided contact details",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
                
                const SizedBox(height: 24),
                
                // Buttons
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
                          "Close",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    if (phoneNumber != null && phoneNumber.isNotEmpty) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Get.snackbar(
                              'Call',
                              'Calling $phoneNumber',
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Call",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper widgets
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(String title, String value, {bool isSpecification = false}) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              color: isSpecification ? Colors.black54 : Colors.black87,
              fontWeight: isSpecification ? FontWeight.normal : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: isSpecification ? FontWeight.w600 : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Get highlights based on special offer data
  List<Map<String, String>> getHighlights() {
    final List<Map<String, String>> highlights = [];
    
    // Special offer highlights
    highlights.add({
      'title': 'Discount', 
      'value': '${_specialOffer.discount}% ${_specialOffer.discountType}'
    });
    
    if (_item.year != null) {
      highlights.add({'title': 'Model Year', 'value': _item.year!});
    }
    if (_item.mileage != null) {
      highlights.add({'title': 'Mileage', 'value': '${_item.mileage} km'});
    }
    if (_item.engineCapacity != null) {
      highlights.add({'title': 'Engine', 'value': '${_item.engineCapacity} L'});
    }
    if (_item.condition != null) {
      highlights.add({'title': 'Condition', 'value': _item.condition!});
    }
    
    return highlights;
  }

  // Get specifications based on special offer data
  List<Map<String, String>> getSpecifications() {
    final List<Map<String, String>> specifications = [];
    
    if (_brand?.name != null) {
      specifications.add({'title': 'Brand', 'value': _brand!.name!});
    }
    
    if (_item.brandModel?.name != null) {
      specifications.add({'title': 'Model', 'value': _item.brandModel!.name!});
    }
    
    if (_item.color != null) {
      specifications.add({'title': 'Color', 'value': _item.color!});
    }
    
    if (_item.numberOfPassengers != null) {
      specifications.add({'title': 'Seats', 'value': '${_item.numberOfPassengers} seats'});
    }
    
    if (_item.transmission != null) {
      specifications.add({'title': 'Transmission', 'value': _item.transmission!});
    }
    
    if (_item.location != null) {
      specifications.add({'title': 'Location', 'value': _item.location!});
    }
    
    return specifications;
  }

  // Build special offer badge
  Widget _buildSpecialOfferBadge() {
    final isActive = _isOfferActive();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isActive
              ? [ColorGlobalVariables.redColor, Colors.orange]
              : [Colors.grey, Colors.grey[600]!],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isActive ? Icons.local_offer : Icons.timer_off,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            isActive ? '${_specialOffer.discount}% OFF' : 'Offer Ended',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = getItemImages();
    final currentImage = images.isNotEmpty && selectedIndex < images.length 
        ? images[selectedIndex] 
        : '${ImageStringGlobalVariables.imagePath}car_placeholder.png';

    final highlights = getHighlights();
    final specifications = getSpecifications();
    final isActive = _isOfferActive();

    return Scaffold(
      backgroundColor: Colors.grey[50],
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
                _item.name ?? 'Special Offer',
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
                    left: 20,
                    bottom: 80,
                    child: AnimatedOpacity(
                      opacity: _imageOpacity,
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _item.name ?? 'Special Offer Vehicle',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          // Special Offer Price Display
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _calculateDiscountedPrice(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    _formatPrice(_item.price ?? '0'),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16.0,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Save GH₵ ${formatNumber(shortenerRequired: true, number: int.parse(_getSavingsAmount()))}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Special Offer Badge
                  Positioned(
                    top: 80,
                    left: 20,
                    child: AnimatedOpacity(
                      opacity: _imageOpacity,
                      duration: const Duration(milliseconds: 200),
                      child: _buildSpecialOfferBadge(),
                    ),
                  ),

                  Positioned(
                    top: 16,
                    right: 16,
                    child: AnimatedOpacity(
                      opacity: _imageOpacity,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${selectedIndex + 1}/${images.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              // IconButton(
              //   onPressed: () {
              //     // Share functionality
              //     Get.snackbar(
              //       'Share',
              //       'Special offer shared!',
              //       backgroundColor: Colors.blue,
              //       colorText: Colors.white,
              //     );
              //   },
              //   icon: Container(
              //     padding: const EdgeInsets.all(6),
              //     decoration: BoxDecoration(
              //       color: Colors.black54,
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: const Icon(Icons.share, color: Colors.white, size: 18),
              //   ),
              // ),
            ],
          ),
          
          // Gallery Section
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 8),
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: index == selectedIndex 
                                    ? ColorGlobalVariables.redColor 
                                    : Colors.transparent,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: [
                                  buildSafeImage(
                                    image,
                                    width: 100,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  if (index == selectedIndex)
                                    Container(
                                      color: Colors.black.withOpacity(0.3),
                                      child: const Center(
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                          size: 20,
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
          
          // Main Content Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Vehicle name and brand
                        Row(
                          children: [
                            if (_brand?.image != null)
                              Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.only(right: 12),
                                child: CustomImage(
                                  imagePath: getImageUrl(_brand!.image!, null),
                                  isAssetImage: false,
                                  isImageBorderRadiusRequired: false,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _item.name ?? 'Special Offer Vehicle',
                                    style: const TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${_brand?.name ?? ''} • ${_item.year ?? ''} • ${_item.condition?.toUpperCase() ?? ''}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Special Offer Time Info
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isActive ? Colors.green[50] : Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isActive ? Colors.green[100]! : Colors.grey[300]!,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isActive ? Icons.timer : Icons.timer_off,
                                color: isActive ? Colors.green : Colors.grey,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      isActive ? 'Special Offer Active' : 'Offer Ended',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isActive ? Colors.green[700] : Colors.grey[700],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _getTimeRemaining(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isActive ? Colors.green[600] : Colors.grey[600],
                                      ),
                                    ),
                                    if (isActive) ...[
                                      const SizedBox(height: 8),
                                      Text(
                                        'Valid: ${_formatDate(_specialOffer.startAt)} - ${_formatDate(_specialOffer.endAt)}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Price Comparison
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: ColorGlobalVariables.redColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ColorGlobalVariables.redColor.withOpacity(0.2)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Discounted Price',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        _calculateDiscountedPrice(),
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: ColorGlobalVariables.redColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Original Price',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        _formatPrice(_item.price ?? '0'),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[500],
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: ColorGlobalVariables.redColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.savings, color: ColorGlobalVariables.redColor, size: 16),
                                    const SizedBox(width: 8),
                                    Text(
                                      'You save GH₵ ${formatNumber(shortenerRequired: true, number: int.parse(_getSavingsAmount()))}',
                                      style: TextStyle(
                                        color: ColorGlobalVariables.redColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Description
                        if (_item.description != null && _item.description!.isNotEmpty) ...[
                          Text(
                            _item.description!,
                            style: const TextStyle(
                              fontSize: 15.0,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],

                        // Location and date info
                        if (_item.location != null) ...[
                          _buildInfoRow(Icons.location_on_outlined, _item.location!),
                          const SizedBox(height: 8),
                        ],
                        _buildInfoRow(Icons.refresh_outlined, safeFormatTimeAgo(_item.createdAt)),
                        const SizedBox(height: 16),
                        
                        // Special Offer Description
                        if (_specialOffer.description != null && _specialOffer.description!.isNotEmpty) ...[
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue[100]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Special Offer Details',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[800],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _specialOffer.description!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                        
                        // Tags section
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildTag(
                              "${_specialOffer.discount}% OFF", 
                              ColorGlobalVariables.redColor.withOpacity(0.9)
                            ),
                            if(_item.warranty != null && _item.warranty! > 0)
                              _buildTag(
                                "Warranty", 
                                Colors.green
                              ),
                            if(_item.condition != null)
                              _buildTag(
                                _item.condition!.toUpperCase(), 
                                Colors.orange
                              ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        
                        // Highlights section
                        _buildSectionTitle("Highlights"),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 20.0,
                          runSpacing: 12.0,
                          children: highlights.map((highlight) {
                            return _buildInfoItem(
                              highlight['title'] ?? 'N/A',
                              highlight['value'] ?? 'N/A',
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        
                        // Specifications section
                        _buildSectionTitle("Specifications"),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 20.0,
                          runSpacing: 12.0,
                          children: specifications.map((spec) {
                            return _buildInfoItem(
                              spec['title'] ?? 'N/A',
                              spec['value'] ?? 'N/A',
                              isSpecification: true,
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                        
                        const Divider(
                          color: ColorGlobalVariables.fadedBlackColor,
                          height: 12,
                          thickness: 0.5,
                        ),
                        const SizedBox(height: 16),
                        
                        // Features section
                        if (_item.features != null && _item.features!.isNotEmpty) ...[
                          _buildSectionTitle("Features"),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _item.features!.map((feature) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue[100]!),
                                ),
                                child: Text(
                                  feature,
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                        ],
                        
                        // Seller information section
                        Row(
                          children: [
                            // User image
                            CustomImage(
                              imagePath: '${ImageStringGlobalVariables.imagePath}user_profile_temporary.png', 
                              isAssetImage: true,
                              imageBackgroundColor: Colors.transparent,
                              useShimmerEffect: true,
                              imageWidth: 60,
                              imageHeight: 60,
                              imageBorderRadius: 30,
                              fit: BoxFit.contain, 
                              isImageBorderRadiusRequired: true
                            ),
                            const SizedBox(width: 12),
                            // User details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _getUserName(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Joined: ${safeFormatTimeAgo(_item.createdAt)}",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    '34 Ads',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorGlobalVariables.greenColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        
                        // Action buttons
                        Row(
                          children: [
                            // Chat button
                            Expanded(
                              child: CustomTextButton(
                                buttonTextType: 'Chat', 
                                textTypeColor: ColorGlobalVariables.redColor, 
                                borderColor: ColorGlobalVariables.fadedBlackColor,
                                isFullButtonWidthRequired: false, 
                                buttonBackgroundColor: Colors.transparent, 
                                onClickFunction: (){
                                  Get.toNamed(
                                    RouteClass.getChatPage(),
                                  );
                                }
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Show contact button
                            Expanded(
                              child: CustomTextButton(
                                buttonTextType: 'Show contact', 
                                borderColor: ColorGlobalVariables.fadedBlackColor,
                                textTypeColor: ColorGlobalVariables.redColor, 
                                isFullButtonWidthRequired: false, 
                                buttonBackgroundColor: Colors.transparent, 
                                onClickFunction: _showContactDialog
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}