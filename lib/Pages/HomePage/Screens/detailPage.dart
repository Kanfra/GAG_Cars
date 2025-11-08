import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/similarItemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/userDetailsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoryProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getSimilarItemsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getUserDetailsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistManager.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistToggleProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const DetailPage({
    super.key, 
    required this.allJson,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ScrollController _scrollController = ScrollController();
  final _similarItemsScrollThreshold = 200.0;
  double _appBarHeight = 300;
  double _imageOpacity = 1.0;
  int selectedIndex = 0;

  late final Map<String, dynamic> item;
  late final Map<String, dynamic>? product;
  late final String? type;
  
  late int _currentItemCategoryId;
  late String _currentItemId;
  String? _currentUserId;
  late Map<String, dynamic> user;
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    item = widget.allJson['item'] as Map<String, dynamic>;
    product = widget.allJson['product'] as Map<String, dynamic>;
    logger.e('This is the user: ${product?['user']}');

    type = widget.allJson['type'] as String?;
    
    _currentItemCategoryId = item['category_id'] ?? _extractCategoryId(item['category']) ?? 0;
    _currentItemId = item['id']?.toString() ?? '';
    
    // Handle user object properly
    final dynamic userObj = item['user'];
    user = _convertUserToMap(userObj);
    
    logger.e('Posted User is: $user');
    
    // Extract user ID safely
    _currentUserId = _extractUserId(userObj)?.toString();
    
    logger.w('🔍 [DETAIL PAGE] Extracted user ID: $_currentUserId');
    logger.w('🔍 [DETAIL PAGE] Item user data: $user');
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadCategoryDetails();
      _loadSimilarItems();
      _fetchUserDetails();
    });
    
    _scrollController.addListener(_onScroll);
  }

  // Enhanced Helper method to safely convert user object to Map
  Map<String, dynamic> _convertUserToMap(dynamic userObj) {
    if (userObj == null) return {};
    
    if (userObj is Map<String, dynamic>) {
      return userObj;
    }
    
    // Handle Freezed object case - use toJson() method first
    try {
      if (userObj is dynamic && userObj.toJson != null) {
        final jsonResult = userObj.toJson();
        if (jsonResult is Map<String, dynamic>) {
          logger.w('🔍 [USER CONVERSION] Using toJson() result: $jsonResult');
          return jsonResult;
        }
      }
    } catch (e) {
      logger.e('Error using toJson() on user object: $e');
    }
    
    // Fallback to reflection-based approach
    try {
      final Map<String, dynamic> result = {};
      
      // Try common user properties with both camelCase and snake_case
      if (_hasProperty(userObj, 'id')) result['id'] = userObj.id;
      if (_hasProperty(userObj, 'name')) result['name'] = userObj.name;
      if (_hasProperty(userObj, 'username')) result['username'] = userObj.username;
      if (_hasProperty(userObj, 'email')) result['email'] = userObj.email;
      
      // Handle profile photo with both camelCase and snake_case
      if (_hasProperty(userObj, 'profilePhoto')) {
        result['profilePhoto'] = userObj.profilePhoto;
        result['profile_photo'] = userObj.profilePhoto; // Set both keys
      }
      if (_hasProperty(userObj, 'profile_photo')) {
        result['profile_photo'] = userObj.profile_photo;
        result['profilePhoto'] = userObj.profile_photo; // Set both keys
      }
      
      // Handle created date with both camelCase and snake_case
      if (_hasProperty(userObj, 'createdAt')) {
        result['createdAt'] = userObj.createdAt;
        result['created_at'] = userObj.createdAt; // Set both keys
      }
      if (_hasProperty(userObj, 'created_at')) {
        result['created_at'] = userObj.created_at;
        result['createdAt'] = userObj.created_at; // Set both keys
      }
      
      // Handle phone with both camelCase and snake_case
      if (_hasProperty(userObj, 'phone')) {
        result['phone'] = userObj.phone;
        result['phone_number'] = userObj.phone; // Set both keys
      }
      if (_hasProperty(userObj, 'phone_number')) {
        result['phone_number'] = userObj.phone_number;
        result['phone'] = userObj.phone_number; // Set both keys
      }
      
      logger.w('🔍 [USER CONVERSION] Converted user object: $result');
      
      return result;
    } catch (e) {
      logger.e('Error converting user object to map: $e');
      return {};
    }
  }

  // Enhanced method to get user created date
  String? _getUserCreatedAt() {
    // First try the converted user map which has both keys
    if (user.containsKey('createdAt') && user['createdAt'] != null) {
      return user['createdAt']?.toString();
    }
    if (user.containsKey('created_at') && user['created_at'] != null) {
      return user['created_at']?.toString();
    }
    
    // Fallback to direct object access
    final dynamic userObj = item['user'];
    if (userObj is Map<String, dynamic>) {
      return userObj['createdAt']?.toString() ?? userObj['created_at']?.toString();
    } else {
      try {
        return userObj.createdAt?.toString() ?? userObj.created_at?.toString();
      } catch (e) {
        return null;
      }
    }
  }

  String? _extractUserId(dynamic userObj) {
    if (userObj == null) return null;
    
    if (userObj is Map<String, dynamic>) {
      return userObj['id']?.toString();
    }
    
    // Try to access id property on object
    try {
      return userObj.id?.toString();
    } catch (e) {
      return null;
    }
  }

  bool _hasProperty(dynamic obj, String propertyName) {
    try {
      final value = _getProperty(obj, propertyName);
      return value != null;
    } catch (e) {
      return false;
    }
  }

  dynamic _getProperty(dynamic obj, String propertyName) {
    try {
      // Try direct property access for both camelCase and snake_case
      switch (propertyName) {
        case 'id': return obj.id;
        case 'name': return obj.name;
        case 'username': return obj.username;
        case 'email': return obj.email;
        case 'profilePhoto': return obj.profilePhoto;
        case 'profile_photo': return obj.profile_photo;
        case 'phone': return obj.phone;
        case 'phone_number': return obj.phone_number;
        case 'createdAt': return obj.createdAt;
        case 'created_at': return obj.created_at;
        default: return null;
      }
    } catch (e) {
      return null;
    }
  }

  void _onScroll() {
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

    // Check for lazy loading
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    
    if (maxScroll - currentScroll <= _similarItemsScrollThreshold) {
      _loadMoreSimilarItems();
    }
  }

  void _preloadCategoryDetails() {
    if (!mounted) return;
    
    final categoryId = item['category_id'] ?? _extractCategoryId(item['category']);
    if (categoryId != null) {
      final categoryDetailProvider = Provider.of<CategoryDetailProvider>(context, listen: false);
      if (!categoryDetailProvider.categoryDetails.containsKey(categoryId)) {
        categoryDetailProvider.fetchCategoryDetail(categoryId);
      }
    }
  }

  void _loadSimilarItems() {
    if (!mounted || _currentItemCategoryId == 0 || _currentItemId.isEmpty) return;
    
    final similarItemsProvider = Provider.of<SimilarItemsProvider>(context, listen: false);
    similarItemsProvider.loadInitialItems(_currentItemCategoryId, _currentItemId);
  }

  Future<void> _loadMoreSimilarItems() async {
    if (!mounted) return;
    
    final similarItemsProvider = Provider.of<SimilarItemsProvider>(context, listen: false);
    if (similarItemsProvider.hasMore && !similarItemsProvider.isLoadingMore) {
      await similarItemsProvider.loadMoreItems();
    }
  }

  void _fetchUserDetails() {
    if (!mounted || _currentUserId == null || _currentUserId!.isEmpty) return;
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userDetailsProvider = Provider.of<UserDetailsProvider>(context, listen: false);
      
      final logger = Logger();
      logger.w('🔍 [DETAIL PAGE FETCH] Fetching details for user ID: $_currentUserId');
      
      if (!userDetailsProvider.hasUserDetails(_currentUserId!)) {
        userDetailsProvider.fetchUserDetails(_currentUserId!);
      }
    });
  }

  int? _extractCategoryId(dynamic category) {
    if (category == null) return null;
    
    if (category is Map<String, dynamic>) {
      return category['id'] as int?;
    } else if (category is num) {
      return category.toInt();
    } else {
      try {
        return category.id as int?;
      } catch (e) {
        return null;
      }
    }
    
    return null;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // ========== ENHANCED BUTTON UI METHODS ==========

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

  // Enhanced User Profile Image with better error handling
  Widget _buildUserProfileImage() {
    final dynamic userObj = item['user'];
    String? profilePhoto;
    
    // Try to get profile photo from converted user map first
    if (user.containsKey('profilePhoto') && user['profilePhoto'] != null) {
      profilePhoto = user['profilePhoto'];
    } else if (user.containsKey('profile_photo') && user['profile_photo'] != null) {
      profilePhoto = user['profile_photo'];
    } else {
      // Fallback to direct access
      if (userObj is Map<String, dynamic>) {
        profilePhoto = userObj['profilePhoto'] ?? userObj['profile_photo'];
      } else {
        try {
          profilePhoto = userObj.profilePhoto ?? userObj.profile_photo;
        } catch (e) {
          profilePhoto = null;
        }
      }
    }
    
    logger.w('🔍 [PROFILE PHOTO] Final profile photo: $profilePhoto');
    
    if (profilePhoto != null && profilePhoto.isNotEmpty) {
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: ClipOval(
          child: _buildSafeImage(
            getImageUrl(profilePhoto, null),
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return _buildDefaultProfileAvatar(size: 60);
    }
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
              final userId = _extractUserId(item['user']);
              final userName = _getUserName();
              final userProfilePhoto = _getUserProfilePhoto();
              final userPhone = _getUserPhoneNumber();
              
              if (userId != null) {
                logger.e("User id for detailPage is: $userId");
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
    final hasContact = _getUserPhoneNumber() != null;
    
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

  // ========== EXISTING METHODS (KEEPING ALL FUNCTIONALITY) ==========

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

  Widget _buildCustomErrorWidget(double? width, double? height, ThemeData theme) {
    return Container(
      width: width,
      height: height,
      color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[300],
      child: Center(
        child: Icon(
          Icons.broken_image,
          size: (width ?? 45) * 0.4,
          color: theme.brightness == Brightness.dark ? Colors.grey[500] : Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildSafeImage(String imagePath, {double? width, double? height, BoxFit fit = BoxFit.cover}) {
    final theme = Theme.of(context);
    try {
      if (imagePath.isNotEmpty) {
        return Image.network(
          getImageUrl(imagePath, null),
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => _buildCustomErrorWidget(width, height, theme),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildShimmerPlaceholder(width, height, theme);
          },
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: frame != null ? child : _buildShimmerPlaceholder(width, height, theme),
            );
          },
        );
      }
      else if (imagePath.startsWith('assets/')) {
        return Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => _buildCustomErrorWidget(width, height, theme),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: frame != null ? child : _buildShimmerPlaceholder(width, height, theme),
            );
          },
        );
      } else {
        return _buildCustomErrorWidget(width, height, theme);
      }
    } catch (e) {
      return _buildCustomErrorWidget(width, height, theme);
    }
  }

  List<dynamic> getItemImages() {
    try {
      final images = item['images'];
      if (images is List && images.isNotEmpty) {
        return images.whereType<String>().toList();
      }
    } catch (e) {
      // Fall through to default
    }
    return ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'];
  }

  // Enhanced User Phone Number getter
  String? _getUserPhoneNumber() {
    try {
      // First try the converted user map
      if (user.containsKey('phone') && user['phone'] != null) {
        return user['phone']?.toString();
      }
      if (user.containsKey('phone_number') && user['phone_number'] != null) {
        return user['phone_number']?.toString();
      }
      
      final dynamic userObj = item['user'];
      
      // Handle both Map and Object cases
      if (userObj is Map<String, dynamic>) {
        return userObj['phone']?.toString() ?? 
               userObj['phone_number']?.toString() ??
               userObj['contact']?.toString() ??
               userObj['mobile']?.toString();
      } else {
        // Handle object case
        try {
          return userObj.phone?.toString() ?? 
                 userObj.phone_number?.toString() ??
                 userObj.contact?.toString() ??
                 userObj.mobile?.toString();
        } catch (e) {
          // Fall back to item properties
          return item['phone']?.toString() ?? 
                 item['phone_number']?.toString() ??
                 item['contact']?.toString() ??
                 item['mobile']?.toString();
        }
      }
    } catch (e) {
      return null;
    }
  }

  // Enhanced User Profile Photo getter
  String? _getUserProfilePhoto() {
    // First try the converted user map
    if (user.containsKey('profilePhoto') && user['profilePhoto'] != null) {
      return user['profilePhoto'];
    }
    if (user.containsKey('profile_photo') && user['profile_photo'] != null) {
      return user['profile_photo'];
    }
    
    final dynamic userObj = item['user'];
    if (userObj is Map<String, dynamic>) {
      return userObj['profilePhoto'] ?? userObj['profile_photo'];
    } else {
      try {
        return userObj.profilePhoto ?? userObj.profile_photo;
      } catch (e) {
        return null;
      }
    }
  }

  // Enhanced User Name getter
  String _getUserName() {
    // First try the converted user map
    if (user.containsKey('name') && user['name'] != null) {
      return user['name']!.toString();
    }
    if (user.containsKey('username') && user['username'] != null) {
      return user['username']!.toString();
    }
    
    try {
      final dynamic userObj = item['user'];
      if (userObj is Map<String, dynamic>) {
        return userObj['name']?.toString() ?? 
               userObj['username']?.toString() ??
               'Seller';
      }
      
      // Handle object case
      try {
        return userObj.name?.toString() ?? 
               userObj.username?.toString() ??
               'Seller';
      } catch (e) {
        return 'Seller';
      }
    } catch (e) {
      return 'Seller';
    }
  }

  // Enhanced Contact Dialog with Call Functionality
  void _showContactDialog() {
    final phoneNumber = _getUserPhoneNumber();
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
                
                // Seller name
                Text(
                  "Seller: $userName",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Phone number
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
              // Full screen image with zoom capability
              Container(
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
              
              // Close button
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
              
              // Image counter
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

  // Enhanced Gallery Item with View Button
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
                Container(
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

  void _showComingSoonMessage() {
    Get.snackbar(
      'Coming Soon',
      'Price drop notifications feature will be available soon!',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }

  List<Widget> _buildVerificationBadges() {
    final List<Widget> badges = [];
    final theme = Theme.of(context);
    
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    
    if (userProvider.isVerifiedDealer) {
      badges.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
            color: theme.brightness == Brightness.dark ? Colors.blue[900]! : Colors.lightBlue[100]!,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Verified Dealer",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: theme.brightness == Brightness.dark ? Colors.blue[100] : Colors.blue[800],
                ),
              ),
              const SizedBox(width: 4),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.blue,
                child: Icon(Icons.check, size: 12, color: Colors.white),
              )
            ],
          ),
        ),
      );
    }
    
    if (userProvider.isFullyVerified) {
      badges.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
            color: theme.brightness == Brightness.dark ? Colors.green[900]! : Colors.green[100]!,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Verified",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: theme.brightness == Brightness.dark ? Colors.green[100] : Colors.green[800],
                ),
              ),
              const SizedBox(width: 4),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.green,
                child: Icon(Icons.verified, size: 12, color: Colors.white),
              )
            ],
          ),
        ),
      );
    }
    
    return badges;
  }

  List<Map<String, String>> getHighlights() {
    final categoryId = item['category_id'] ?? _extractCategoryId(item['category']);
    if (categoryId == null) {
      return _getDefaultHighlights();
    }
    
    final categoryDetailProvider = Provider.of<CategoryDetailProvider>(context, listen: true);
    return categoryDetailProvider.buildHighlights(categoryId, item);
  }

  List<Map<String, String>> getSpecifications() {
    final categoryId = item['category_id'] ?? _extractCategoryId(item['category']);
    if (categoryId == null) {
      return _getDefaultSpecifications();
    }
    
    final categoryDetailProvider = Provider.of<CategoryDetailProvider>(context, listen: true);
    return categoryDetailProvider.buildSpecifications(categoryId, item);
  }

  String? _safeGetString(dynamic obj, String key) {
    if (obj == null) return null;
    
    if (obj is Map<String, dynamic>) {
      final value = obj[key];
      return value?.toString();
    }
    
    // Handle object case
    try {
      switch (key) {
        case 'id': return obj.id?.toString();
        case 'name': return obj.name?.toString();
        case 'username': return obj.username?.toString();
        case 'email': return obj.email?.toString();
        case 'profilePhoto': return obj.profilePhoto?.toString();
        case 'profile_photo': return obj.profile_photo?.toString();
        case 'phoneNumber': return obj.phoneNumber?.toString();
        case 'phone_number': return obj.phone_number?.toString();
        case 'createdAt': return obj.createdAt?.toString();
        case 'created_at': return obj.created_at?.toString();
        case 'label': return obj.label?.toString();
        default: 
          try {
            final dynamic value = _getProperty(obj, key);
            return value?.toString();
          } catch (e) {
            return obj.toString();
          }
      }
    } catch (e) {
      return obj.toString();
    }
  }

  List<Map<String, String>> _getDefaultHighlights() {
    final List<Map<String, String>> highlights = [];
    
    if (item['year'] != null) {
      highlights.add({'title': 'Model Year', 'value': item['year'].toString()});
    }
    if (item['mileage'] != null) {
      highlights.add({'title': 'Mileage', 'value': '${item['mileage']} km'});
    }
    if (item['engine_capacity'] != null) {
      highlights.add({'title': 'Engine', 'value': '${item['engine_capacity']} L'});
    }
    if (item['condition'] != null) {
      highlights.add({'title': 'Condition', 'value': item['condition'].toString()});
    }
    
    return highlights.isNotEmpty ? highlights : [
      {'title': 'Model Year', 'value': 'N/A'},
      {'title': 'Mileage', 'value': 'N/A'},
      {'title': 'Engine', 'value': 'N/A'},
    ];
  }

  List<Map<String, String>> _getDefaultSpecifications() {
    final List<Map<String, String>> specifications = [];
    
    final categoryName = _safeGetString(item['category'], 'name') ?? 
                        _safeGetString(item['brand'], 'name');
    if (categoryName != null) {
      specifications.add({'title': 'Make', 'value': categoryName});
    }
    
    final modelName = _safeGetString(item['brand_model'], 'name');
    if (modelName != null) {
      specifications.add({'title': 'Model', 'value': modelName});
    }
    
    if (item['color'] != null) {
      specifications.add({'title': 'Color', 'value': item['color'].toString()});
    }
    
    if (item['number_of_passengers'] != null) {
      specifications.add({'title': 'Seats', 'value': '${item['number_of_passengers']} seats'});
    }
    
    if (item['transmission'] != null) {
      specifications.add({'title': 'Transmission', 'value': item['transmission'].toString()});
    }
    
    return specifications.isNotEmpty ? specifications : [
      {'title': 'Make', 'value': 'N/A'},
      {'title': 'Model', 'value': 'N/A'},
      {'title': 'Color', 'value': 'N/A'},
    ];
  }

  Widget _buildInfoItem(String title, String value, {bool isSpecification = false}) {
    final theme = Theme.of(context);
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              color: isSpecification ? theme.textTheme.bodyMedium?.color : theme.textTheme.titleLarge?.color,
              fontWeight: isSpecification ? FontWeight.normal : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: isSpecification ? FontWeight.w600 : FontWeight.normal,
              color: theme.textTheme.titleLarge?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: theme.textTheme.titleLarge?.color,
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: theme.iconTheme.color, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String text, Color color) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark ? color.withOpacity(0.3) : color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
          color: theme.brightness == Brightness.dark ? Colors.white70 : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSimilarItem(SimilarItem similarItem, Size screenSize) {
    return _SimilarItemWidget(
      item: similarItem,
      screenSize: screenSize,
    );
  }

  // OPTIMIZED: Use SliverGrid instead of GridView.builder for smooth scrolling
  Widget _buildSimilarItemsSection(SimilarItemsProvider similarItemsProvider) {
    final theme = Theme.of(context);
    
    if (similarItemsProvider.isLoading && similarItemsProvider.items.isEmpty) {
      return _buildSimilarItemsShimmer();
    }

    if (similarItemsProvider.items.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Text(
              'No similar items found',
              style: TextStyle(
                color: theme.textTheme.bodyMedium?.color,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.72,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index >= similarItemsProvider.items.length) {
              return _buildLoadingMoreGridItem();
            }
            
            final similarItem = similarItemsProvider.items[index];
            
            return GestureDetector(
              onTap: () {
                logger.e('🔍 [SIMILAR ITEM TAP] User data: ${similarItem.user?.toJson()}');
                logger.e('🔍 [SIMILAR ITEM TAP] Profile photo: ${similarItem.user?.profilePhoto}');
                logger.e('🔍 [SIMILAR ITEM TAP] Created at: ${similarItem.user?.createdAt}');
                
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      allJson: {
                        'product': similarItem.toJson(),
                        'item': similarItem.toJson(),
                        'type': 'details',
                      },
                    ),
                  ),
                );
              },
              child: _buildSimilarItem(similarItem, MediaQuery.of(context).size),
            );
          },
          childCount: similarItemsProvider.items.length + (similarItemsProvider.isLoadingMore ? 1 : 0),
        ),
      ),
    );
  }

  Widget _buildSimilarItemsShimmer() {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Text(
              'Similar Items',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.titleLarge?.color,
              ),
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: theme.brightness == Brightness.dark ? Colors.grey[700]! : Colors.grey[300]!,
                highlightColor: theme.brightness == Brightness.dark ? Colors.grey[600]! : Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingMoreGridItem() {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
        ),
      ),
    );
  }

  Widget _buildLoadingMoreIndicator() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
        ),
      ),
    );
  }

  Widget _buildAdsCount() {
    return Consumer<UserDetailsProvider>(
      builder: (context, userDetailsProvider, child) {
        final formattedAdsCount = userDetailsProvider.formattedAdsCount;
        
        return GestureDetector(
          onTap: (){
            Get.toNamed(
              RouteClass.getAdsPage(),
              arguments: {
                'user': user,
                'phoneNumber': _getUserPhoneNumber(),
                'type': 'adsPage' 
              }
            );
          },
          child: Text(
            formattedAdsCount.toString(),
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: ColorGlobalVariables.greenColor,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final images = getItemImages();
    final currentImage = images.isNotEmpty && selectedIndex < images.length 
        ? images[selectedIndex] 
        : '${ImageStringGlobalVariables.imagePath}car_placeholder.png';

    final highlights = getHighlights();
    final specifications = getSpecifications();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Consumer2<SimilarItemsProvider, UserDetailsProvider>(
        builder: (context, similarItemsProvider, userDetailsProvider, child) {
          return CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                    item['name'] ?? 'Item Details',
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
                          getImageUrl(currentImage, null),
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
                                item['name'] ?? 'Unnamed Item',
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
                                'GH₵ ${formatNumber(shortenerRequired: false, number: int.parse(item['price']?.toString() ?? '0'))}',
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
                child: Container(
                  color: theme.scaffoldBackgroundColor,
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
                              child: _buildGalleryItem(image, index, theme),
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
                            color: theme.textTheme.bodyMedium?.color,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
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
                              item['name'] ?? 'Unnamed Item',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: theme.textTheme.titleLarge?.color,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'GH₵ ${formatNumber(shortenerRequired: false, number: int.parse(item['price']?.toString() ?? '0'))}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: theme.textTheme.titleLarge?.color,
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (item['description'] != null) ...[
                              Text(
                                item['description'],
                                style: TextStyle(
                                  fontSize: 15.0,
                                  height: 1.5,
                                  color: theme.textTheme.bodyLarge?.color,
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                            if (item['location'] != null) ...[
                              _buildInfoRow(Icons.location_on_outlined, item['location']),
                              const SizedBox(height: 8),
                            ],
                            _buildInfoRow(Icons.refresh_outlined, formatTimeAgo(item['created_at'] ?? '')),
                            const SizedBox(height: 16),
                            
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: _buildVerificationBadges(),
                            ),
                            
                            const SizedBox(height: 16),
                            
                            const SizedBox(height: 20),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                if(item["warranty"] != null)
                                _buildTag(
                                  "Warranty", 
                                  theme.brightness == Brightness.dark ? Colors.grey[700]! : Colors.grey[300]!),
                              ],
                            ),
                            const SizedBox(height: 20),
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
                                      Row(
                                        children: [
                                          Text(
                                            _getUserName(),
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: theme.textTheme.titleLarge?.color,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          if (Provider.of<UserProvider>(context, listen: false).isFullyVerified)
                                            CustomImage(
                                              imagePath: '${ImageStringGlobalVariables.iconPath}check.png',
                                              imageWidth: 16,
                                              imageHeight: 16,
                                              fit: BoxFit.cover, 
                                              isAssetImage: true, 
                                              isImageBorderRadiusRequired: false,
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "Joined: ${formatTimeAgo(_getUserCreatedAt() ?? '')}",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: theme.textTheme.bodyMedium?.color,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      _buildAdsCount(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            
                            // ENHANCED ACTION BUTTONS SECTION
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
                      
                      // Similar Items Title
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                        child: Text(
                          'Similar Items',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.titleLarge?.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // OPTIMIZED: Use SliverGrid for similar items instead of GridView.builder
              _buildSimilarItemsSection(similarItemsProvider),
              
              // Loading more indicator
              if (similarItemsProvider.isLoadingMore)
                SliverToBoxAdapter(
                  child: _buildLoadingMoreIndicator(),
                ),
              
              // No more items indicator
              if (!similarItemsProvider.hasMore && similarItemsProvider.items.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'No more similar items',
                        style: TextStyle(
                          color: theme.textTheme.bodyMedium?.color,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              
              // Bottom padding
              const SliverToBoxAdapter(
                child: SizedBox(height: 40),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Keep the existing _SimilarItemWidget class exactly as it is
class _SimilarItemWidget extends StatefulWidget {
  final SimilarItem item;
  final Size screenSize;

  const _SimilarItemWidget({
    required this.item,
    required this.screenSize,
  });

  @override
  __SimilarItemWidgetState createState() => __SimilarItemWidgetState();
}

class __SimilarItemWidgetState extends State<_SimilarItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;
  
  bool _isLiked = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _colorAnimation = ColorTween(
      begin: Colors.grey[400],
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _initializeLikeStatus();
  }

  void _initializeLikeStatus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkWishlistStatus();
    });
  }

  void _checkWishlistStatus() {
    try {
      final wishlistManager = Provider.of<WishlistManager>(context, listen: false);
      final isInWishlist = wishlistManager.isLiked(widget.item.id);
      
      setState(() {
        _isLiked = isInWishlist;
        if (_isLiked) {
          _animationController.value = 1.0;
        }
      });
    } catch (e) {
      print('Error checking wishlist status: $e');
    }
  }

  Future<void> _toggleLike() async {
    if (_isLoading) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      if (_isLiked) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }

      final wishlistProvider = Provider.of<WishlistToggleProvider>(context, listen: false);
      final wishlistManager = Provider.of<WishlistManager>(context, listen: false);
      
      final result = await wishlistProvider.toggleWishlistItem(
        itemId: widget.item.id, 
        context: context,
      );

      if (result) {
        setState(() {
          _isLiked = !_isLiked;
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isLiked ? 'Added to wishlist!' : 'Removed from wishlist',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: _isLiked ? Colors.green : Colors.orange,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      } else {
        if (_isLiked) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Failed to update wishlist',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print('Wishlist error: $e');
      if (_isLiked) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: ${e.toString()}',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firstImage = widget.item.images?.isNotEmpty == true
        ? widget.item.images!.first
        : "${ImageStringGlobalVariables.imagePath}car_placeholder.png";

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[100],
                  child: _buildItemImage(firstImage, theme),
                ),
              ),
              
              if (widget.item.condition != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.item.condition!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              
              Positioned(
                bottom: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    if (_isLoading) return;
                    _toggleLike();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: _isLoading
                            ? SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.grey,
                                  ),
                                ),
                              )
                            : AnimatedBuilder(
                                animation: _colorAnimation,
                                builder: (context, child) {
                                  return Icon(
                                    _isLiked ? Icons.favorite : Icons.favorite_border,
                                    size: 18,
                                    color: _isLiked 
                                        ? _colorAnimation.value 
                                        : theme.iconTheme.color,
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
    
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.name ?? 'Unnamed Item',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: theme.textTheme.titleLarge?.color,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      widget.item.year ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                  ],
                ),
    
                const SizedBox(height: 8),
    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'GH₵ ${formatNumber(shortenerRequired: true, number: int.tryParse(widget.item.price ?? '0') ?? 0)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    if (widget.item.mileage != null)
                      Row(
                        children: [
                          Icon(Icons.speed, size: 14, color: theme.iconTheme.color),
                          const SizedBox(width: 4),
                          Text(
                            "${formatNumber(shortenerRequired: true, number: int.tryParse(widget.item.mileage!) ?? 0)} km",
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
    
                const SizedBox(height: 12),
    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 24),
                    
                    if (widget.item.transmission != null)
                      Row(
                        children: [
                          Icon(Icons.settings, size: 14, color: theme.iconTheme.color),
                          const SizedBox(width: 4),
                          Text(
                            widget.item.transmission!,
                            style: TextStyle(
                              fontSize: 11,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                          ),
                        ],
                      ),
                    
                    if (widget.item.location != null)
                      Flexible(
                        child: Row(
                          children: [
                            Icon(Icons.location_on, size: 14, color: theme.iconTheme.color),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                widget.item.location!,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: theme.textTheme.bodyMedium?.color,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemImage(String imageUrl, ThemeData theme) {
    final bool isAssetImage = imageUrl == "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
    
    if (isAssetImage) {
      return Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildImageErrorPlaceholder(theme);
        },
      );
    } else {
      final String fullImageUrl = getImageUrl(imageUrl, null);
      
      return CachedNetworkImage(
        imageUrl: fullImageUrl,
        fit: BoxFit.cover,
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
          return _buildImageErrorPlaceholder(theme);
        },
      );
    }
  }

  Widget _buildImageErrorPlaceholder(ThemeData theme) {
    return Container(
      color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_not_supported, size: 32, color: theme.iconTheme.color),
            const SizedBox(height: 4),
            Text(
              'No Image',
              style: TextStyle(
                fontSize: 10, 
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}