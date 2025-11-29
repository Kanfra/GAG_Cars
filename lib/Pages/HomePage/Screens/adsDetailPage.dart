import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/userListingsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getUserListingsProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:get/get.dart';
import 'package:logger/Logger.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AdsDetailPage extends StatefulWidget {
  final Map<String, dynamic> allJson;

  const AdsDetailPage({
    super.key,
    required this.allJson,
  });

  @override
  State<AdsDetailPage> createState() => _AdsDetailPageState();
}

class _AdsDetailPageState extends State<AdsDetailPage> with SingleTickerProviderStateMixin {
  late final Listing listing;
  late final Map<String, dynamic> user;
  final logger = Logger();
  int selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  double _appBarHeight = 300;
  double _imageOpacity = 1.0;
  bool _isSold = false;
  bool _isPromoted = false;
  
  // Profile image animation controllers
  late AnimationController _profileImageController;
  late Animation<double> _profileImageScaleAnimation;
  late Animation<double> _profileImageFadeAnimation;
  bool _showProfilePopup = false;

  @override
  void initState() {
    super.initState();
    
    // Initialize listing and user from arguments
    try {
      listing = widget.allJson['listing'] as Listing;
      user = widget.allJson['user'] as Map<String, dynamic>;
      
      _isSold = listing.status == 'sold';
      _isPromoted = listing.isPromoted == true;
      
      logger.i('AdsDetailPage - Listing loaded: ${listing.name}');
      logger.i('AdsDetailPage - User loaded: ${_getUserName()}');
    } catch (e) {
      logger.e('Error initializing AdsDetailPage: $e');
      listing = const Listing();
      user = {};
    }
    
    // Initialize profile image animation controller
    _profileImageController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    
    _profileImageScaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.1), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
      parent: _profileImageController,
      curve: Curves.easeInOut,
    ));
    
    _profileImageFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _profileImageController,
      curve: Curves.easeInOut,
    ));
    
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
    _profileImageController.dispose();
    super.dispose();
  }

  // ========== PROFILE IMAGE POPUP ANIMATION METHODS ==========

  void _openProfilePopup() {
    logger.i('Opening profile popup');
    setState(() {
      _showProfilePopup = true;
    });
    _profileImageController.forward();
  }

  void _closeProfilePopup() {
    logger.i('Closing profile popup');
    _profileImageController.reverse().then((_) {
      if (mounted) {
        setState(() {
          _showProfilePopup = false;
        });
      }
    });
  }

  Widget _buildProfilePopup() {
    if (!_showProfilePopup) return const SizedBox.shrink();

    final profilePhoto = _getUserProfilePhoto();
    final userName = _getUserName();
    final hasProfilePhoto = profilePhoto != null;
    
    logger.i('Building profile popup - Has photo: $hasProfilePhoto');

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Backdrop - click to close
          GestureDetector(
            onTap: _closeProfilePopup,
            child: AnimatedBuilder(
              animation: _profileImageFadeAnimation,
              builder: (context, child) {
                return Container(
                  color: Colors.black.withOpacity(0.9 * _profileImageFadeAnimation.value),
                );
              },
            ),
          ),
          
          // Profile image content
          Center(
            child: AnimatedBuilder(
              animation: _profileImageScaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _profileImageScaleAnimation.value,
                  child: child,
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Profile image container
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: hasProfilePhoto
                            ? _buildSafeNetworkImage(
                                profilePhoto,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                            : _buildDefaultProfileAvatar(size: 200),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // User name
                    Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // User info
                    Text(
                      'Vehicle Seller',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),

                    // Info text when no profile photo
                    if (!hasProfilePhoto) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'No profile photo available',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                    
                    const SizedBox(height: 24),
                    
                    // Close button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _closeProfilePopup,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorGlobalVariables.brownColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ========== DATA ACCESS METHODS ==========

  String getListingName() {
    return listing.name ?? 'Vehicle Listing';
  }

  String getListingPrice({required BuildContext context}) {
    final userProvider = Provider.of<UserProvider>(context);
    final price = listing.price;
    if (price != null && price.isNotEmpty) {
      return '${userProvider.user?.countryCurrencySymbol ?? ''} ${formatNumber(shortenerRequired: false, number: int.tryParse(price) ?? 0)}';
    }
    return '${userProvider.user?.countryCurrencySymbol ?? ''} 0';
  }

  String getListingDescription() {
    return listing.description ?? 'No description available for this vehicle.';
  }

  List<String> getListingImages() {
    try {
      final images = listing.images;
      if (images == null || images.isEmpty) {
        return ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'];
      }
      
      final validImages = images.where((image) => 
        image.toString().isNotEmpty
      ).map((image) {
        String imageUrl = image.toString();
        
        if (imageUrl.startsWith('http')) {
          return imageUrl;
        }
        
        if (!imageUrl.contains('/') && !imageUrl.startsWith('assets/')) {
          return 'https://dashboard.gagcars.com/storage/$imageUrl';
        }
        
        return imageUrl;
      }).toList();
      
      return validImages.isNotEmpty ? validImages : ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'];
    } catch (e) {
      logger.e('Error getting listing images: $e');
      return ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'];
    }
  }

  String getListingLocation() {
    return listing.location ?? 'Location not available';
  }

  String getListingCondition() {
    final condition = listing.condition;
    if (condition is String && condition.isNotEmpty) return condition;
    return 'Used';
  }

  String getListingTransmission() {
    final transmission = listing.transmission;
    if (transmission is String && transmission.isNotEmpty) return transmission;
    return 'Manual';
  }

  String getListingMileage() {
    final mileage = listing.mileage;
    if (mileage is String && mileage.isNotEmpty) return '$mileage km';
    if (mileage is num) return '${mileage.toString()} km';
    return 'N/A';
  }

  String getListingYear() {
    return listing.year ?? 'N/A';
  }

  String getListingEngineCapacity() {
    final engine = listing.engineCapacity;
    if (engine is String && engine.isNotEmpty) return '$engine L';
    if (engine is num) return '${engine.toString()} L';
    return 'N/A';
  }

  String getListingColor() {
    final color = listing.color;
    if (color is String && color.isNotEmpty) return color;
    return 'N/A';
  }

  String getListingBodyType() {
    final buildType = listing.buildType;
    if (buildType is String && buildType.isNotEmpty) return buildType;
    return 'N/A';
  }

  String getListingSeats() {
    final seats = listing.numberOfPassengers;
    if (seats is String && seats.isNotEmpty) return '$seats seats';
    if (seats is num) return '${seats.toString()} seats';
    return 'N/A';
  }

  bool get hasWarranty {
    final warranty = listing.warranty;
    if (warranty is bool) return warranty;
    if (warranty is String) return warranty.toLowerCase() == 'true' || warranty.isNotEmpty;
    if (warranty is num) return warranty > 0;
    return false;
  }

  String getWarrantyDetails() {
    if (!hasWarranty) return '';
    
    final warranty = listing.warranty;
    if (warranty is String && warranty.isNotEmpty) return warranty;
    return 'Warranty Included';
  }

  // User information methods
  String _getUserName() {
    return user['name']?.toString() ?? 
           user['username']?.toString() ??
           'Seller';
  }

  String? _getUserProfilePhoto() {
    final profilePhoto = user['profile_photo']?.toString();
    if (profilePhoto != null && profilePhoto.isNotEmpty) {
      if (profilePhoto.startsWith('http')) {
        return profilePhoto;
      }
      return 'https://dashboard.gagcars.com/storage/$profilePhoto';
    }
    return null;
  }

  String? _getUserId() {
    return user['id']?.toString();
  }

  String? _getUserJoinDate() {
    return user['created_at']?.toString();
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
    
    final color = getListingColor();
    if (color != 'N/A') {
      specifications.add({'title': 'Color', 'value': color});
    }
    
    final bodyType = getListingBodyType();
    if (bodyType != 'N/A') {
      specifications.add({'title': 'Body Type', 'value': bodyType});
    }
    
    final seats = getListingSeats();
    if (seats != 'N/A') {
      specifications.add({'title': 'Seating Capacity', 'value': seats});
    }
    
    final steerPosition = listing.steerPosition;
    if (steerPosition != null && steerPosition.isNotEmpty) {
      specifications.add({'title': 'Steering', 'value': steerPosition});
    }
    
    final transmission = getListingTransmission();
    if (transmission != 'N/A' && !specifications.any((spec) => spec['title'] == 'Transmission')) {
      specifications.add({'title': 'Transmission', 'value': transmission});
    }
    
    if (specifications.isEmpty) {
      specifications.addAll([
        {'title': 'Color', 'value': getListingColor()},
        {'title': 'Body Type', 'value': getListingBodyType()},
        {'title': 'Seating Capacity', 'value': getListingSeats()},
      ]);
    }
    
    return specifications;
  }

  // ========== IMAGE HANDLING METHODS ==========

  String _getCorrectImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty || imagePath == "null") {
      return "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
    }

    if (imagePath.startsWith("http")) {
      return imagePath;
    }

    try {
      String baseUrl = "https://dashboard.gagcars.com";
      
      String cleanImagePath;
      if (imagePath.startsWith('/storage/')) {
        cleanImagePath = imagePath;
      } else if (imagePath.startsWith('storage/')) {
        cleanImagePath = '/$imagePath';
      } else {
        cleanImagePath = '/storage/$imagePath';
      }
      
      final fullUrl = '$baseUrl$cleanImagePath';
      return fullUrl;
    } catch (e) {
      return "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
    }
  }

  Widget _buildImageErrorPlaceholder(double? width, double? height, ThemeData theme) {
    return Container(
      width: width,
      height: height,
      color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported,
              size: (width ?? 45) * 0.4,
              color: theme.brightness == Brightness.dark ? Colors.grey[500] : Colors.grey[400],
            ),
            const SizedBox(height: 4),
            Text(
              'No Image',
              style: TextStyle(
                fontSize: 10,
                color: theme.brightness == Brightness.dark ? Colors.grey[400] : Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerPlaceholder(double? width, double? height, ThemeData theme) {
    return Shimmer.fromColors(
      baseColor: theme.brightness == Brightness.dark ? Colors.grey[700]! : Colors.grey[300]!,
      highlightColor: theme.brightness == Brightness.dark ? Colors.grey[600]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        color: theme.cardColor,
      ),
    );
  }

  Widget _buildSafeNetworkImage(String imagePath, {double? width, double? height, BoxFit fit = BoxFit.cover}) {
    final theme = Theme.of(context);
    final String imageUrl = _getCorrectImageUrl(imagePath);
    
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return _buildImageErrorPlaceholder(width, height, theme);
      },
    );
  }

  Widget _buildSafeImage(String imagePath, {double? width, double? height, BoxFit fit = BoxFit.cover}) {
    final theme = Theme.of(context);
    final String imageUrl = _getCorrectImageUrl(imagePath);
    
    final bool isAssetImage = imageUrl.contains('assets/') || 
                             imageUrl.endsWith('car_placeholder.png');
    
    if (isAssetImage) {
      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _buildImageErrorPlaceholder(width, height, theme);
        },
      );
    } else {
      return _buildSafeNetworkImage(imagePath, width: width, height: height, fit: fit);
    }
  }

  // Image Zoom Dialog
  void _showFullScreenImage(String imageUrl, int imageIndex) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black87,
      barrierDismissible: true,
      barrierLabel: 'Close',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding: EdgeInsets.zero,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: InteractiveViewer(
                  panEnabled: true,
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: _buildSafeImage(
                    imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              
              Positioned(
                top: 50,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
              
              Positioned(
                top: 50,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${imageIndex + 1}/${getListingImages().length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  // ========== GALLERY ITEM ==========

  Widget _buildGalleryItem(String image, int index, ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDarkMode ? const Color(0xFF424242) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                border: Border.all(
                  color: index == selectedIndex 
                      ? ColorGlobalVariables.brownColor
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Stack(
                  children: [
                    _buildSafeImage(
                      image,
                      width: double.infinity,
                      height: double.infinity,
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
          ),
          
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Image ${index + 1}',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                SizedBox(
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () {
                      _showFullScreenImage(image, index);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorGlobalVariables.brownColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.visibility, size: 12),
                        SizedBox(width: 4),
                        Text(
                          'View',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ========== ENHANCED USER PROFILE IMAGE WITH ANIMATION ==========

  Widget _buildDefaultProfileAvatar({double size = 60}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade400,
            Colors.purple.shade400,
          ],
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.person,
          size: size * 0.5,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildUserProfileImage() {
    final profilePhoto = _getUserProfilePhoto();
    
    return GestureDetector(
      onTap: _openProfilePopup,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipOval(
            child: profilePhoto != null 
                ? _buildSafeNetworkImage(
                    profilePhoto,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                : _buildDefaultProfileAvatar(size: 60),
          ),
        ),
      ),
    );
  }

  // ========== CONTACT & CHAT FUNCTIONALITY ==========

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        Get.snackbar(
          'Error',
          'Could not launch phone app',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to make phone call: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _showContactDialog() {
    final phoneNumber = widget.allJson['phoneNumber'];
    final userName = _getUserName();
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
          surfaceTintColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
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
                    Expanded(
                      child: Text(
                        "Contact Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                Text(
                  "Seller: $userName",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                if (phoneNumber != null && phoneNumber.isNotEmpty) ...[
                  Column(
                    children: [
                      Text(
                        "Phone Number:",
                        style: TextStyle(
                          fontSize: 14,
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: isDarkMode ? const Color(0xFF616161) : Colors.grey[300]!),
                        ),
                        child: Text(
                          phoneNumber,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "You can call or message this number to contact the seller.",
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkMode ? Colors.white60 : Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ] else ...[
                  Column(
                    children: [
                      Icon(
                        Icons.contact_phone_outlined,
                        size: 48,
                        color: isDarkMode ? Colors.grey[400] : Colors.grey,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "No contact information available",
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode ? Colors.white70 : Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "The seller hasn't provided contact details",
                        style: TextStyle(
                          fontSize: 14,
                          color: isDarkMode ? Colors.white60 : Colors.grey[500],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
                
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
                          side: BorderSide(color: isDarkMode ? const Color(0xFF616161) : Colors.grey[300]!),
                        ),
                        child: Text(
                          "Close",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode ? Colors.white70 : Colors.black54,
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
                            _makePhoneCall(phoneNumber);
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
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, size: 20),
                              SizedBox(width: 8),
                              Text(
                                "Call",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
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

  // ========== UI COMPONENTS ==========

  Widget _buildChatButton() {
    return Expanded(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorGlobalVariables.redColor.withOpacity(0.9),
              ColorGlobalVariables.redColor.withOpacity(0.7),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ColorGlobalVariables.redColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              final userId = _getUserId();
              final userName = _getUserName();
              final userProfilePhoto = _getUserProfilePhoto();
              final userPhone = widget.allJson['phoneNumber'];
              
              if (userId != null) {
                Get.toNamed(
                  RouteClass.getChatPage(),
                  arguments: {
                    'contactId': userId,
                    'contactName': userName,
                    'contactImage': userProfilePhoto,
                    'contactPhone': userPhone,
                  }
                );
              } else {
                Get.snackbar(
                  'Error',
                  'Unable to start chat. Seller information not available.',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Chat',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShowContactButton() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final hasContact = widget.allJson['phoneNumber'] != null;
    
    return Expanded(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDarkMode ? Colors.grey[600]! : Colors.grey[300]!,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _showContactDialog,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: (isDarkMode ? Colors.grey[700] : Colors.grey[100])!.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.contact_phone_outlined,
                      color: hasContact ? ColorGlobalVariables.greenColor : Colors.grey,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      Text(
                        hasContact ? 'Show details' : 'No contact',
                        style: TextStyle(
                          fontSize: 12,
                          color: hasContact ? 
                            (isDarkMode ? Colors.green[300] : ColorGlobalVariables.greenColor) : 
                            (isDarkMode ? Colors.grey[400] : Colors.grey[500]),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTags(BuildContext context) {
    final List<Widget> tags = [];
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    if (hasWarranty) {
      tags.add(_buildTag(
        "Warranty", 
        isDarkMode ? Colors.grey[700]! : ColorGlobalVariables.greyColor
      ));
    }
    
    if (_isPromoted && !_isSold) {
      tags.add(_buildPromotedTag(isDarkMode));
    }
    
    final categoryName = listing.category?.name;
    if (categoryName != null && categoryName.isNotEmpty) {
      tags.add(_buildTag(
        categoryName,
        isDarkMode ? Colors.blue[800]! : Colors.blue[100]!
      ));
    }
    
    return tags;
  }

  Widget _buildTag(String text, Color color) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: theme.brightness == Brightness.dark ? Colors.white70 : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildPromotedTag(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.amber[800]!.withOpacity(0.3) : Colors.amber[100],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: isDarkMode ? Colors.amber[300] : Colors.amber[700], size: 16),
          const SizedBox(width: 6),
          Text(
            "Promoted",
            style: TextStyle(
              color: isDarkMode ? Colors.amber[300] : Colors.amber[800],
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, bool isDarkMode) {
    return Row(
      children: [
        Icon(icon, color: isDarkMode ? Colors.white70 : Colors.grey[600], size: 20),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            color: isDarkMode ? Colors.white70 : Colors.grey[700],
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, bool isDarkMode) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? Colors.white : Colors.black87,
      ),
    );
  }

  Widget _buildWrapItems(List<Map<String, String>> items, bool isDarkMode, {bool isSpecification = false}) {
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
                  color: isDarkMode 
                    ? (isSpecification ? Colors.white60 : Colors.white70)
                    : (isSpecification ? Colors.black54 : Colors.black87),
                  fontWeight: isSpecification ? FontWeight.normal : FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item["value"] ?? "N/A",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: isSpecification ? FontWeight.w600 : FontWeight.normal,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ========== MAIN BUILD METHOD ==========

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final carHighlights = getHighlights();
    final carSpecifications = getSpecifications();
    final images = getListingImages();
    final currentImage = images.isNotEmpty && selectedIndex < images.length 
        ? images[selectedIndex] 
        : '${ImageStringGlobalVariables.imagePath}car_placeholder.png';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              // ========== SLIVER APP BAR ==========
              SliverAppBar(
                expandedHeight: 350,
                floating: false,
                pinned: true,
                backgroundColor: Colors.black,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
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
                        child: _buildSafeImage(
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
                                getListingName(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                getListingPrice(context: context),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
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
              ),
              
              // ========== IMAGE GALLERY ==========
              SliverToBoxAdapter(
                child: Container(
                  color: theme.scaffoldBackgroundColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 140,
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
                              child: _buildGalleryItem(image, index, theme),
                            );
                          },
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          "Tap image to set as main display • Tap 'View' to see full size",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: theme.textTheme.bodyMedium?.color,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // ========== ITEM DETAILS ==========
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
                            Text(
                              getListingName(),
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: theme.textTheme.titleLarge?.color,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              getListingPrice(context: context),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: theme.textTheme.titleLarge?.color,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              getListingDescription(),
                              style: TextStyle(
                                fontSize: 15.0,
                                height: 1.5,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildInfoRow(Icons.location_on_outlined, getListingLocation(), isDarkMode),
                            const SizedBox(height: 8),
                            _buildInfoRow(Icons.refresh_outlined, formatTimeAgo(listing.createdAt?.toString() ?? ''), isDarkMode),
                            const SizedBox(height: 16),
                            
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: _buildTags(context),
                            ),
                            
                            const SizedBox(height: 28),
                            _buildSectionTitle("Highlights", isDarkMode),
                            const SizedBox(height: 16),
                            _buildWrapItems(carHighlights, isDarkMode),
                            const SizedBox(height: 28),
                            _buildSectionTitle("Specifications", isDarkMode),
                            const SizedBox(height: 16),
                            _buildWrapItems(carSpecifications, isDarkMode, isSpecification: true),
                            const SizedBox(height: 16),
                            
                            Divider(
                              color: theme.dividerColor,
                              height: 12,
                              thickness: 0.5,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                _buildUserProfileImage(),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _getUserName(),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: theme.textTheme.titleLarge?.color,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      if (_getUserJoinDate() != null) 
                                        Text(
                                          "Joined: ${formatTimeAgo(_getUserJoinDate()!)}",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            color: theme.textTheme.bodyMedium?.color,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            
                            Row(
                              children: [
                                _buildChatButton(),
                                const SizedBox(width: 16),
                                _buildShowContactButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // ========== PROFILE IMAGE POPUP OVERLAY ==========
          if (_showProfilePopup)
            Positioned.fill(
              child: _buildProfilePopup(),
            ),
        ],
      ),
    );
  }
}