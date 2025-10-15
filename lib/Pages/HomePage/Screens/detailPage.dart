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
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoryProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getSimilarItemsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistManager.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistToggleProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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
  double _appBarHeight = 300;
  double _imageOpacity = 1.0;
  int selectedIndex = 0;

  late final Map<String, dynamic> item;
  late final Map<String, dynamic>? product;
  late final String? type;
  
  late int _currentItemCategoryId;
  late String _currentItemId;

  @override
  void initState() {
    super.initState();
    item = widget.allJson['item'] as Map<String, dynamic>;
    product = widget.allJson['product'] as Map<String, dynamic>;
    type = widget.allJson['type'] as String?;
    
    _currentItemCategoryId = item['category_id'] ?? _extractCategoryId(item['category']) ?? 0;
    _currentItemId = item['id']?.toString() ?? '';
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadCategoryDetails();
      _loadSimilarItems();
    });
    
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

      _checkLazyLoading();
    });
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

  void _checkLazyLoading() {
    final similarItemsProvider = Provider.of<SimilarItemsProvider>(context, listen: false);
    
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500 &&
        !similarItemsProvider.isLoadingMore &&
        similarItemsProvider.hasMore) {
      
      _loadMoreSimilarItems();
    }
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
      if (imagePath.isNotEmpty) {
        return Image.network(
          getImageUrl(imagePath, null),
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
      }
      else if (imagePath.startsWith('assets/')) {
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
      return _buildCustomErrorWidget(width, height);
    }
  }

  List<dynamic> getItemImages() {
    try {
      final images = item['images'];
      if (images is List && images.isNotEmpty) {
        return images.whereType<String>().toList();
      }
    } catch (e) {
    }
    return ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'];
  }

  String? _getUserPhoneNumber() {
    try {
      final user = item['user'];
      if (user is Map<String, dynamic>) {
        return user['phoneNumber']?.toString() ?? 
               user['phone_number']?.toString() ??
               user['contact']?.toString() ??
               user['mobile']?.toString();
      }
      
      return item['phoneNumber']?.toString() ?? 
             item['phone_number']?.toString() ??
             item['contact']?.toString() ??
             item['mobile']?.toString();
    } catch (e) {
      return null;
    }
  }

  String _getUserName() {
    try {
      final user = item['user'];
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
                
                Text(
                  "Seller: $userName",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                
                const SizedBox(height: 16),
                
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
          ]),
        ),
      );
    },
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
    
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    
    if (userProvider.isVerifiedDealer) {
      badges.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.lightBlue[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Verified Dealer",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4),
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
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Verified",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4),
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
    
    try {
      switch (key) {
        case 'name':
          return obj.name?.toString();
        case 'id':
          return obj.id?.toString();
        case 'label':
          return obj.label?.toString();
        case 'createdAt':
          return obj.createdAt?.toString();
        case 'profilePhoto':
          return obj.profilePhoto?.toString();
        default:
          return obj.toString();
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
    final user = item['user'];
    final profilePhoto = _safeGetString(user, 'profilePhoto');
    
    if (profilePhoto != null && profilePhoto.isNotEmpty) {
      return CustomImage(
        imagePath: getImageUrl(profilePhoto, null), 
        isAssetImage: false,
        imageBackgroundColor: Colors.transparent,
        useShimmerEffect: true,
        imageWidth: 60,
        imageHeight: 60,
        imageBorderRadius: 30,
        fit: BoxFit.cover, 
        isImageBorderRadiusRequired: true
      );
    } else {
      return _buildDefaultProfileAvatar(size: 60);
    }
  }

  Widget _buildSimilarItem(SimilarItem similarItem, Size screenSize) {
    return _SimilarItemWidget(
      item: similarItem,
      screenSize: screenSize,
    );
  }

  RecommendedItem _convertToRecommendedItem(SimilarItem similarItem) {
    return RecommendedItem(
      id: similarItem.id,
      name: similarItem.name,
      price: similarItem.price,
      year: similarItem.year,
      images: similarItem.images,
      mileage: similarItem.mileage,
      transmission: similarItem.transmission,
      location: similarItem.location,
      condition: similarItem.condition,
      description: similarItem.description,
      userId: similarItem.userId,
      countryId: similarItem.countryId,
      brandModelId: similarItem.brandModelId,
      brandId: similarItem.brandId,
      categoryId: similarItem.categoryId,
      slug: similarItem.slug,
      serialNumber: similarItem.serialNumber,
      steerPosition: similarItem.steerPosition,
      engineCapacity: similarItem.engineCapacity,
      color: similarItem.color,
      buildType: similarItem.buildType,
      numberOfPassengers: similarItem.numberOfPassengers,
      features: similarItem.features,
      status: similarItem.status,
      warranty: similarItem.warranty,
      warrantyExpiration: similarItem.warrantyExpiration != null 
          ? DateTime.tryParse(similarItem.warrantyExpiration!) 
          : null,
      deletedAt: similarItem.deletedAt != null 
          ? DateTime.tryParse(similarItem.deletedAt!) 
          : null,
      createdAt: DateTime.tryParse(similarItem.createdAt) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(similarItem.updatedAt) ?? DateTime.now(),
      height: similarItem.height,
      vin: similarItem.vin,
      isPromoted: false,
      brand: null,
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
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Consumer<SimilarItemsProvider>(
        builder: (context, similarItemsProvider, child) {
          return CustomScrollView(
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
                        child: buildSafeImage(
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
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.share, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
              
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
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'GH₵ ${formatNumber(shortenerRequired: false, number: int.parse(item['price']?.toString() ?? '0'))}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (item['description'] != null) ...[
                              Text(
                                item['description'],
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  height: 1.5,
                                  color: Colors.black87,
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
                            
                            Links(
                              linkTextType: 'Notify price drops', 
                              linkTextColor: ColorGlobalVariables.blackColor, 
                              isTextSmall: true, 
                              textDecorationColor: ColorGlobalVariables.blackColor,
                              isIconWidgetRequiredAtEnd: false, 
                              isIconWidgetRequiredAtFront: true, 
                              iconData: Icons.notifications_outlined,
                              iconColor: ColorGlobalVariables.blackColor,
                              onClickFunction: _showComingSoonMessage,
                            ),
                            
                            const SizedBox(height: 20),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                if(item["warranty"] != null)
                                _buildTag(
                                  "Warranty", 
                                  Colors.grey[300]!),
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
                            
                            const Divider(
                              color: ColorGlobalVariables.fadedBlackColor,
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
                                            item["user"] == null ? "User name" : _safeGetString(item["user"], 'name') ?? "User name",
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
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
                                        item["user"] == null ? "No date" : "Joined: ${formatTimeAgo(_safeGetString(item['user'], 'createdAt') ?? '')}",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '34 Ads',
                                        style: const TextStyle(
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
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextButton(
                                    buttonTextType: 'Chat', 
                                    textTypeColor: ColorGlobalVariables.redColor, 
                                    borderColor: ColorGlobalVariables.fadedBlackColor,
                                    isFullButtonWidthRequired: false, 
                                    buttonBackgroundColor: Colors.transparent, 
                                    onClickFunction: (){
                                      Get.toNamed(
                                        RouteClass.getChatPage()
                                      );
                                    }
                                  ),
                                ),
                                const SizedBox(width: 12),
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
                  
                  if (similarItemsProvider.isLoading && similarItemsProvider.items.isEmpty) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                        ),
                      ),
                    ),
                  ] else if (similarItemsProvider.items.isNotEmpty) ...[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 12),
                      child: Text(
                        'Similar Items',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      itemCount: similarItemsProvider.items.length + (similarItemsProvider.isLoadingMore ? 1 : 0),
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        if (index >= similarItemsProvider.items.length) {
                          return const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                            ),
                          );
                        }
                        
                        final similarItem = similarItemsProvider.items[index];
                        return GestureDetector(
                          onTap: () {
                            final logger = Logger();
                            logger.w("Similar items detailpage data: $similarItem");
                            print("Similar items detailpage data: $similarItem");
                            Navigator.of(context).pushReplacement(  // Use Navigator instead of GetX
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
                            // Get.offNamed(
                            //   RouteClass.getDetailPage(),
                            //   arguments: {
                            //     'product': similarItem.toJson(),
                            //     // _convertToRecommendedItem(widget.item).toJson(),
                            //     'item': similarItem.toJson(),
                            //     // _convertToRecommendedItem(widget.item).toJson(),
                            //     'type': 'details',
                            //     'uniqueKey': similarItem.id,
                            //   },
                            // );
                          },
                          child: _buildSimilarItem(similarItem, screenSize)
                          );
                      },
                    ),
                    
                    if (!similarItemsProvider.hasMore && similarItemsProvider.items.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            'No more similar items',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                  ] else if (!similarItemsProvider.isLoading && similarItemsProvider.items.isEmpty) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          'No similar items found',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      );
    },
  ),
);
  }
}

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
            duration: Duration(seconds: 2),
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
    final firstImage = widget.item.images.isNotEmpty
        ? widget.item.images.first
        : "${ImageStringGlobalVariables.imagePath}car_placeholder.png";

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                  color: Colors.grey[100],
                  child: _buildItemImage(firstImage),
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
                          color: Colors.white,
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
                                        : Colors.grey[600],
                                  );
                                },
                              ),
                    ),
                  ),
                ),
              ),
          )],
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
                        widget.item.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      widget.item.year,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
    
                const SizedBox(height: 8),
    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'GH₵ ${formatNumber(shortenerRequired: true, number: int.parse(widget.item.price))}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    if (widget.item.mileage != null)
                      Row(
                        children: [
                          Icon(Icons.speed, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            "${formatNumber(shortenerRequired: true, number: int.parse(widget.item.mileage!))} km",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
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
                          Icon(Icons.settings, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            widget.item.transmission!,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    
                    if (widget.item.location != null)
                      Flexible(
                        child: Row(
                          children: [
                            Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                widget.item.location!,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600],
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

  Widget _buildItemImage(String imageUrl) {
    final bool isAssetImage = imageUrl == "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
    
    if (isAssetImage) {
      return Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildImageErrorPlaceholder();
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
          return _buildImageErrorPlaceholder();
        },
      );
    }
  }

  Widget _buildImageErrorPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_not_supported, size: 32, color: Colors.grey[400]),
            const SizedBox(height: 4),
            Text(
              'No Image',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RecommendedItem _convertToRecommendedItem(SimilarItem similarItem) {
    return RecommendedItem(
      id: similarItem.id,
      name: similarItem.name,
      price: similarItem.price,
      year: similarItem.year,
      images: similarItem.images,
      mileage: similarItem.mileage,
      transmission: similarItem.transmission,
      location: similarItem.location,
      condition: similarItem.condition,
      description: similarItem.description,
      userId: similarItem.userId,
      countryId: similarItem.countryId,
      brandModelId: similarItem.brandModelId,
      brandId: similarItem.brandId,
      categoryId: similarItem.categoryId,
      slug: similarItem.slug,
      serialNumber: similarItem.serialNumber,
      steerPosition: similarItem.steerPosition,
      engineCapacity: similarItem.engineCapacity,
      color: similarItem.color,
      buildType: similarItem.buildType,
      numberOfPassengers: similarItem.numberOfPassengers,
      features: similarItem.features,
      status: similarItem.status,
      warranty: similarItem.warranty,
      warrantyExpiration: similarItem.warrantyExpiration != null 
          ? DateTime.tryParse(similarItem.warrantyExpiration!) 
          : null,
      deletedAt: similarItem.deletedAt != null 
          ? DateTime.tryParse(similarItem.deletedAt!) 
          : null,
      createdAt: DateTime.tryParse(similarItem.createdAt) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(similarItem.updatedAt) ?? DateTime.now(),
      height: similarItem.height,
      vin: similarItem.vin,
      isPromoted: false,
      brand: null,
    );
  }
}