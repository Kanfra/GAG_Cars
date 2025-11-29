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
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Utils/special_offer_deep_link_handler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/Logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecialOfferDetailPage extends StatefulWidget {
  final SpecialOffer specialOffer;
  const SpecialOfferDetailPage({
    super.key, 
    required this.specialOffer,
  });

  @override
  State<SpecialOfferDetailPage> createState() => _SpecialOfferDetailPageState();
}

class _SpecialOfferDetailPageState extends State<SpecialOfferDetailPage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  double _appBarHeight = 300;
  double _imageOpacity = 1.0;
  int selectedIndex = 0;

  final logger = Logger();

  late SpecialOffer _specialOffer;
  late Item _item;
  late Brand? _brand;
  late User?  _user;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  // Profile image animation controllers
  late AnimationController _profileImageController;
  late Animation<double> _profileImageScaleAnimation;
  late Animation<double> _profileImageFadeAnimation;
  bool _showProfilePopup = false;

  @override
  void initState() {
    super.initState();
    
    _specialOffer = widget.specialOffer;
    _item = _specialOffer.item ?? _createFallbackItem();
    _brand = _item.brand;
    _user = _item.user;
    
    // Main animation setup
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );
    
    // Profile image animation setup
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
    
    _animationController.forward();
    
    logger.i('✅ Special Offer Detail Initialized Successfully');
    
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
    _animationController.dispose();
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
    final hasProfilePhoto = profilePhoto.isNotEmpty;
    
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
                            ? _buildSafeImage(
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
            child: profilePhoto.isNotEmpty
                ? _buildSafeImage(
                    getImageUrl(profilePhoto, null),
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

  // ========== EXISTING METHODS (KEEPING ALL FUNCTIONALITY) ==========

  // Share functionality
  Future<void> _shareSpecialOffer() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final String offerId = _specialOffer.id.toString();
      final String itemId = _specialOffer.itemId;
      final String offerName = _item.name ?? 'Amazing Special Offer';
      final String discount = '${_specialOffer.discount}%';
      final String originalPrice = '${userProvider.user?.countryCurrencySymbol ?? ''} ${formatNumber(shortenerRequired: false, number: int.parse(_item.price?.toString() ?? '0'))}';
      final String discountedPrice = _calculateDiscountedPrice(context);
      final String itemLocation = _item.location ?? 'Location not specified';
      
      if (offerId.isEmpty) {
        _showErrorSnackbar('Cannot share: Offer ID missing');
        return;
      }
      
      final String shareableLink = SpecialOfferDeepLinkHandler.generateSpecialOfferShareableLink(
        offerId,
        itemId,
        offerName,
        _specialOffer.discount,
      );
      
      final String shareText = '''
🔥 SPECIAL OFFER! 🔥

🚗 $offerName
💰 Original Price: $originalPrice
💥 Discounted Price: $discountedPrice
🎁 Discount: $discount OFF
📍 Location: $itemLocation

🔗 Get this exclusive deal: $shareableLink

Download GAGcars app for more amazing deals!''';

      logger.i("📝 Generated special offer share link: $shareableLink");
      
      final box = context.findRenderObject() as RenderBox?;
      
      final result = await Share.share(
        shareText,
        subject: '🔥 Special Offer: $offerName - $discount OFF!',
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
      
      if (result.status == ShareResultStatus.success) {
        logger.i("✅ Special offer share completed successfully");
        _showSuccessSnackbar('Special offer shared successfully!');
      } else {
        logger.w("⚠️ Share dialog was dismissed");
      }
      
    } catch (e, stackTrace) {
      logger.e("❌ Error sharing special offer: $e");
      logger.e("❌ Stack trace: $stackTrace");
      _showErrorSnackbar('Failed to share special offer');
    }
  }

  /// Show success snackbar
  void _showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success!',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  /// Show error snackbar
  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }

  // Enhanced Chat Button
  Widget _buildChatButton() {
    final theme = Theme.of(context);
    
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
              final userPhone = _getUserPhoneNumber();
              
               if (userId != 'unknown_user') {
                logger.e('User id in Special offers is: $userId');
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

  // Enhanced Show Contact Button
  Widget _buildShowContactButton() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final hasContact = _getUserPhoneNumber() != null && _getUserPhoneNumber()!.isNotEmpty;
    
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

  // Phone Call Functionality
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

  // Get user information for chat
  String _getUserId() {
    return _user?.id ?? 'Unknown User';
  }

  String _getUserName() {
    if (_user != null && _user!.name.isNotEmpty) {
      return _user!.name;
    }
    return 'Seller';
  }

  String _getUserProfilePhoto() {
    if (_user != null) {
      return _user!.profilePhoto ?? _user!.avatar ?? '';
    }
    return '';
  }

  String? _getUserPhoneNumber() {
    if (_user != null) {
      return _user!.phone;
    }
    return null;
  }

  // Price formatting and calculations
  String _formatPrice(String price, BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    try {
      final number = int.parse(price);
      return NumberFormat.currency(
        symbol: '${userProvider.user?.countryCurrencySymbol ?? ''} ',
        decimalDigits: 0,
      ).format(number);
    } catch (e) {
      return '${userProvider.user?.countryCurrencySymbol ?? ''} $price';
    }
  }

  String _calculateDiscountedPrice(BuildContext context) {
    try {
      final originalPrice = int.parse(_item.price ?? '0');
      final discount = _specialOffer.discount;
      final discountedPrice = originalPrice - (originalPrice * discount ~/ 100);
      return _formatPrice(discountedPrice.toString(), context);
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

  Widget _buildSafeImage(String imagePath, {double? width, double? height, BoxFit fit = BoxFit.cover}) {
    try {
      if (imagePath.isEmpty) {
        return _buildCustomErrorWidget(width, height);
      }

      // Check if it's an asset image
      if (imagePath.contains('assets/') || imagePath.endsWith('car_placeholder.png')) {
        return Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return _buildCustomErrorWidget(width, height);
          },
        );
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
        return images.where((image) => image.isNotEmpty).toList();
      }
    } catch (e) {
      print('Error getting item images: $e');
    }
    return ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'];
  }

  // Safe time ago formatting - FIXED: Use special offer createdAt instead of item createdAt
  String safeFormatTimeAgo() {
    try {
      // Use special offer's createdAt instead of item's createdAt
      return formatTimeAgo(_specialOffer.createdAt);
    } catch (e) {
      return 'Recently';
    }
  }

  // Safe time ago for user join date
  String safeFormatUserJoinTimeAgo() {
    try {
      if (_user?.createdAt != null && _user!.createdAt!.isNotEmpty) {
        return formatTimeAgo(_user!.createdAt!);
      }
      return 'Recently';
    } catch (e) {
      return 'Recently';
    }
  }

  void _showContactDialog() {
    final phoneNumber = _getUserPhoneNumber();
    final userName = _getUserName();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final isDarkMode = themeProvider.isDarkMode;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
          surfaceTintColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with animation
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  child: Row(
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
                ),
                
                const SizedBox(height: 20),
                
                // Seller name
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    "Seller: $userName",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Phone number
                if (phoneNumber != null && phoneNumber.isNotEmpty) ...[
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 600),
                    child: Column(
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
                  ),
                ] else ...[
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 600),
                    child: Column(
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
                  ),
                ],
                
                const SizedBox(height: 24),
                
                // Buttons with animation
                AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  child: Row(
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Image Zoom Dialog with smooth animation
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
              // Full screen image with zoom capability
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
              
              // Close button with animation
              Positioned(
                top: 50,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
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
              
              // Image counter with fade animation
              Positioned(
                top: 50,
                left: 20,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${imageIndex + 1}/${getItemImages().length}',
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

  // Helper widgets with animations
  Widget _buildSectionTitle(String title, bool isDarkMode) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, bool isDarkMode) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Row(
        children: [
          Icon(icon, color: isDarkMode ? Colors.white70 : Colors.grey[600], size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.grey[700],
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String title, String value, bool isDarkMode, {bool isSpecification = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
                color: isDarkMode ? Colors.white60 : (isSpecification ? Colors.black54 : Colors.black87),
                fontWeight: isSpecification ? FontWeight.normal : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: isSpecification ? FontWeight.w600 : FontWeight.normal,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
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
          color: Colors.white,
        ),
      ),
    );
  }

  // Build gallery item with view button
  Widget _buildGalleryItem(String image, int index, bool isDarkMode) {
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
          // Image container
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
          
          // View button section
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
                // View button
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

  // ========== FIXED FILTERED HIGHLIGHTS AND SPECIFICATIONS ==========

  // Get highlights based on special offer data - FILTERED VERSION
  List<Map<String, String>> getHighlights() {
    final List<Map<String, String>> highlights = [];
    
    // Special offer highlights - always show discount
    highlights.add({
      'title': 'Discount', 
      'value': '${_specialOffer.discount}%'
    });
    
    // Only add highlights that have valid, non-empty data
    // Handle year (String type)
    if (_item.year != null && _item.year!.isNotEmpty && _item.year!.toLowerCase() != 'null') {
      highlights.add({'title': 'Model Year', 'value': _item.year!});
    }
    
    // Handle mileage (could be String or int)
    if (_item.mileage != null) {
      final mileageValue = _item.mileage.toString();
      if (mileageValue.isNotEmpty && mileageValue.toLowerCase() != 'null') {
        highlights.add({'title': 'Mileage', 'value': '${_item.mileage} km'});
      }
    }
    
    // Handle engine capacity (could be String or int/double)
    if (_item.engineCapacity != null) {
      final engineValue = _item.engineCapacity.toString();
      if (engineValue.isNotEmpty && engineValue.toLowerCase() != 'null') {
        highlights.add({'title': 'Engine', 'value': '${_item.engineCapacity} L'});
      }
    }
    
    // Handle condition (String type)
    if (_item.condition != null && _item.condition!.isNotEmpty && _item.condition!.toLowerCase() != 'null') {
      highlights.add({'title': 'Condition', 'value': _item.condition!});
    }
    
    return highlights; // Return only non-empty highlights
  }

  // Get specifications based on special offer data - FILTERED VERSION
  List<Map<String, String>> getSpecifications() {
    final List<Map<String, String>> specifications = [];
    
    // Only add specifications that have valid, non-empty data
    // Handle brand name (String type)
    if (_brand?.name != null && _brand!.name.isNotEmpty && _brand!.name.toLowerCase() != 'null') {
      specifications.add({'title': 'Brand', 'value': _brand!.name});
    }
    
    // Handle model name (String type)
    if (_item.brandModel?.name != null && _item.brandModel!.name.isNotEmpty && _item.brandModel!.name.toLowerCase() != 'null') {
      specifications.add({'title': 'Model', 'value': _item.brandModel!.name});
    }
    
    // Handle color (String type)
    if (_item.color != null && _item.color!.isNotEmpty && _item.color!.toLowerCase() != 'null') {
      specifications.add({'title': 'Color', 'value': _item.color!});
    }
    
    // Handle numberOfPassengers (int type)
    if (_item.numberOfPassengers != null) {
      final passengersValue = _item.numberOfPassengers.toString();
      if (passengersValue.isNotEmpty && passengersValue.toLowerCase() != 'null') {
        specifications.add({'title': 'Seats', 'value': '${_item.numberOfPassengers} seats'});
      }
    }
    
    // Handle transmission (String type)
    if (_item.transmission != null && _item.transmission!.isNotEmpty && _item.transmission!.toLowerCase() != 'null') {
      specifications.add({'title': 'Transmission', 'value': _item.transmission!});
    }
    
    // Handle location (String type)
    if (_item.location != null && _item.location!.isNotEmpty && _item.location!.toLowerCase() != 'null') {
      specifications.add({'title': 'Location', 'value': _item.location!});
    }
    
    return specifications; // Return only non-empty specifications
  }

  // Build special offer badge with animation
  Widget _buildSpecialOfferBadge() {
    final isActive = _isOfferActive();
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
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
    final userProvider = Provider.of<UserProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    
    final images = getItemImages();
    final currentImage = images.isNotEmpty && selectedIndex < images.length 
        ? images[selectedIndex] 
        : '${ImageStringGlobalVariables.imagePath}car_placeholder.png';

    final highlights = getHighlights();
    final specifications = getSpecifications();
    final isActive = _isOfferActive();

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 350,
                        floating: false,
                        pinned: true,
                        backgroundColor: isDarkMode ? Colors.black : Colors.black,
                        leading: IconButton(
                          icon: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
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
                        actions: [
                          // Share button in app bar ONLY (removed from bottom)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: IconButton(
                              onPressed: _shareSpecialOffer,
                              icon: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(Icons.share, color: Colors.white, size: 20),
                              ),
                            ),
                          ),
                        ],
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
                              // Main image
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
                                            _calculateDiscountedPrice(context),
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
                                                _formatPrice(_item.price ?? '0', context),
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 16.0,
                                                  decoration: TextDecoration.lineThrough,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              AnimatedContainer(
                                                duration: const Duration(milliseconds: 300),
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  'Save ${userProvider.user?.countryCurrencySymbol ?? ''} ${formatNumber(shortenerRequired: true, number: int.parse(_getSavingsAmount()))}',
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
                      ),
                      
                      // Enhanced Gallery Section with View Buttons
                      SliverToBoxAdapter(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          color: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Gallery with view buttons
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
                                      child: _buildGalleryItem(image, index, isDarkMode),
                                    );
                                  },
                                ),
                              ),
                              
                              // Instructions
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Text(
                                  "Tap image to set as main display • Tap 'View' to see full size",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: isDarkMode ? Colors.white60 : Colors.grey[600],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      // Main Content Section
                      SliverToBoxAdapter(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
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
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 400),
                                        child: Row(
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
                                                    style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight: FontWeight.bold,
                                                      color: isDarkMode ? Colors.white : Colors.black87,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    '${_brand?.name ?? ''} • ${_item.year ?? ''} • ${_item.condition?.toUpperCase() ?? ''}',
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: isDarkMode ? Colors.white60 : Colors.grey[600],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      // Special Offer Time Info with animation
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 500),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: isActive 
                                              ? (isDarkMode ? Colors.green[900]!.withOpacity(0.3) : Colors.green[50]) 
                                              : (isDarkMode ? Colors.grey[800]! : Colors.grey[100]),
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: isActive 
                                                ? (isDarkMode ? Colors.green[700]! : Colors.green[100]!)
                                                : (isDarkMode ? Colors.grey[600]! : Colors.grey[300]!),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              isActive ? Icons.timer : Icons.timer_off,
                                              color: isActive ? Colors.green : (isDarkMode ? Colors.grey[400] : Colors.grey),
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
                                                      color: isActive 
                                                          ? (isDarkMode ? Colors.green[300] : Colors.green[700])
                                                          : (isDarkMode ? Colors.grey[400] : Colors.grey[700]),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    _getTimeRemaining(),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: isActive 
                                                          ? (isDarkMode ? Colors.green[300] : Colors.green[600])
                                                          : (isDarkMode ? Colors.grey[500] : Colors.grey[600]),
                                                    ),
                                                  ),
                                                  if (isActive) ...[
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      'Valid: ${_formatDate(_specialOffer.startAt)} - ${_formatDate(_specialOffer.endAt)}',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: isDarkMode ? Colors.white60 : Colors.grey,
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

                                      // Price Comparison with animation
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 600),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: isDarkMode 
                                              ? ColorGlobalVariables.redColor.withOpacity(0.1)
                                              : ColorGlobalVariables.redColor.withOpacity(0.05),
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: isDarkMode
                                                ? ColorGlobalVariables.redColor.withOpacity(0.3)
                                                : ColorGlobalVariables.redColor.withOpacity(0.2)
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Discounted Price',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: isDarkMode ? Colors.white70 : Colors.grey,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      _calculateDiscountedPrice(context),
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
                                                    Text(
                                                      'Original Price',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: isDarkMode ? Colors.white70 : Colors.grey,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      _formatPrice(_item.price ?? '0', context),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w600,
                                                        color: isDarkMode ? Colors.white60 : Colors.grey[500],
                                                        decoration: TextDecoration.lineThrough,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            AnimatedContainer(
                                              duration: const Duration(milliseconds: 400),
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: isDarkMode
                                                    ? ColorGlobalVariables.redColor.withOpacity(0.2)
                                                    : ColorGlobalVariables.redColor.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.savings, color: ColorGlobalVariables.redColor, size: 16),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    'You save ${userProvider.user?.countryCurrencySymbol ?? ''} ${formatNumber(shortenerRequired: true, number: int.parse(_getSavingsAmount()))}',
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

                                      // Description with fade animation
                                      if (_item.description != null && _item.description!.isNotEmpty) ...[
                                        AnimatedOpacity(
                                          opacity: 1.0,
                                          duration: const Duration(milliseconds: 500),
                                          child: Text(
                                            _item.description!,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              height: 1.5,
                                              color: isDarkMode ? Colors.white : Colors.black87,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                      ],

                                      // Location and date info with animations
                                      if (_item.location != null) ...[
                                        _buildInfoRow(Icons.location_on_outlined, _item.location!, isDarkMode),
                                        const SizedBox(height: 8),
                                      ],
                                      // FIXED: Use special offer's createdAt instead of item's createdAt
                                      _buildInfoRow(Icons.refresh_outlined, safeFormatTimeAgo(), isDarkMode),
                                      const SizedBox(height: 16),
                                      
                                      // Special Offer Description with animation
                                      if (_specialOffer.description != null && _specialOffer.description!.isNotEmpty) ...[
                                        AnimatedContainer(
                                          duration: const Duration(milliseconds: 500),
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: isDarkMode ? Colors.blue[900]!.withOpacity(0.3) : Colors.blue[50],
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                              color: isDarkMode ? Colors.blue[700]! : Colors.blue[100]!
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Special Offer Details',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: isDarkMode ? Colors.blue[200] : Colors.blue[800],
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                _specialOffer.description!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: isDarkMode ? Colors.white : Colors.black87,
                                                  height: 1.4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                      ],
                                      
                                      // Tags section with staggered animation
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
                                      
                                      // ========== HIGHLIGHTS SECTION (CONDITIONAL) ==========
                                      if (highlights.isNotEmpty) ...[
                                        const SizedBox(height: 20),
                                        _buildSectionTitle("Highlights", isDarkMode),
                                        const SizedBox(height: 12),
                                        Wrap(
                                          spacing: 20.0,
                                          runSpacing: 12.0,
                                          children: highlights.asMap().entries.map((entry) {
                                            final index = entry.key;
                                            final highlight = entry.value;
                                            return AnimatedContainer(
                                              duration: Duration(milliseconds: 400 + (index * 100)),
                                              child: _buildInfoItem(
                                                highlight['title'] ?? 'N/A',
                                                highlight['value'] ?? 'N/A',
                                                isDarkMode,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                      
                                      // ========== SPECIFICATIONS SECTION (CONDITIONAL) ==========
                                      if (specifications.isNotEmpty) ...[
                                        const SizedBox(height: 20),
                                        _buildSectionTitle("Specifications", isDarkMode),
                                        const SizedBox(height: 12),
                                        Wrap(
                                          spacing: 20.0,
                                          runSpacing: 12.0,
                                          children: specifications.asMap().entries.map((entry) {
                                            final index = entry.key;
                                            final spec = entry.value;
                                            return AnimatedContainer(
                                              duration: Duration(milliseconds: 400 + (index * 100)),
                                              child: _buildInfoItem(
                                                spec['title'] ?? 'N/A',
                                                spec['value'] ?? 'N/A',
                                                isDarkMode,
                                                isSpecification: true,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                      
                                      const SizedBox(height: 16),
                                      
                                      Divider(
                                        color: isDarkMode ? const Color(0xFF616161) : ColorGlobalVariables.fadedBlackColor,
                                        height: 12,
                                        thickness: 0.5,
                                      ),
                                      const SizedBox(height: 16),
                                      
                                      // Features section with animation
                                      if (_item.features != null && _item.features!.isNotEmpty) ...[
                                        _buildSectionTitle("Features", isDarkMode),
                                        const SizedBox(height: 12),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: _item.features!.asMap().entries.map((entry) {
                                            final index = entry.key;
                                            final feature = entry.value;
                                            return AnimatedContainer(
                                              duration: Duration(milliseconds: 300 + (index * 50)),
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                              decoration: BoxDecoration(
                                                color: isDarkMode ? Colors.blue[900]!.withOpacity(0.3) : Colors.blue[50],
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: isDarkMode ? Colors.blue[700]! : Colors.blue[100]!
                                                ),
                                              ),
                                              child: Text(
                                                feature,
                                                style: TextStyle(
                                                  color: isDarkMode ? Colors.blue[200] : Colors.blue[700],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                        const SizedBox(height: 20),
                                      ],  
                                      // Seller information section with animation
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 500),
                                        child: Row(
                                          children: [
                                            // Professional User Profile Icon with popup functionality
                                            _buildUserProfileImage(),
                                            const SizedBox(width: 12),
                                            // User details
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _getUserName(),
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold,
                                                      color: isDarkMode ? Colors.white : Colors.black87,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                    "Joined: ${safeFormatUserJoinTimeAgo()}",
                                                    style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: isDarkMode ? Colors.white60 : Colors.grey[600],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      
                                      // ACTION BUTTONS SECTION (ONLY CHAT AND CONTACT - NO SHARE BUTTON)
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
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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