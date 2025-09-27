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
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoryProvider.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
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

  @override
  void initState() {
    super.initState();
    item = widget.allJson['item'] as Map<String, dynamic>;
    product = widget.allJson['product'] as Map<String, dynamic>;
    type = widget.allJson['type'] as String?;
    
    // Use WidgetsBinding to ensure build is complete before loading category details
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadCategoryDetails();
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
    });
  }

  void _preloadCategoryDetails() {
    if (!mounted) return;
    
    final categoryId = item['category_id'] ?? _extractCategoryId(item['category']);
    if (categoryId != null) {
      final categoryDetailProvider = Provider.of<CategoryDetailProvider>(context, listen: false);
      // Check if we already have the data to avoid unnecessary API calls
      if (!categoryDetailProvider.categoryDetails.containsKey(categoryId)) {
        categoryDetailProvider.fetchCategoryDetail(categoryId);
      }
    }
  }

  // Helper method to safely extract category ID from various formats
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
      // Handle error
    }
    return ['${ImageStringGlobalVariables.imagePath}car_placeholder.png'];
  }

  // Get highlights data dynamically based on category configuration
  List<Map<String, String>> getHighlights() {
    final categoryId = item['category_id'] ?? _extractCategoryId(item['category']);
    if (categoryId == null) {
      return _getDefaultHighlights();
    }
    
    final categoryDetailProvider = Provider.of<CategoryDetailProvider>(context, listen: true);
    return categoryDetailProvider.buildHighlights(categoryId, item);
  }

  // Get specifications data dynamically based on category configuration
  List<Map<String, String>> getSpecifications() {
    final categoryId = item['category_id'] ?? _extractCategoryId(item['category']);
    if (categoryId == null) {
      return _getDefaultSpecifications();
    }
    
    final categoryDetailProvider = Provider.of<CategoryDetailProvider>(context, listen: true);
    return categoryDetailProvider.buildSpecifications(categoryId, item);
  }

  // Safe method to extract string value from dynamic objects
  String? _safeGetString(dynamic obj, String key) {
    if (obj == null) return null;
    
    if (obj is Map<String, dynamic>) {
      final value = obj[key];
      return value?.toString();
    }
    
    // Try direct property access for custom objects
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
      // Fallback if property doesn't exist
      return obj.toString();
    }
  }

  // Default highlights fallback - SAFELY ACCESSING DATA
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

  // Default specifications fallback - SAFELY ACCESSING DATA
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

  // Helper widget for building highlight/specification items
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

  // Helper widget for building section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Helper widget for building info rows
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

  // Helper widget for building tags
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

  // Build recommended item card matching homepage style
  Widget _buildRecommendedItem(Map<String, dynamic> recommended, Size screenSize) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail page
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Container(
                    height: 110,
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: buildSafeImage(
                      recommended["productImage"],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                // Category Badge
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      recommended["productType"] ?? 'Car',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                // Promoted Badge
                if (recommended["productType"] == "PROMOTION")
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber[700],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 10),
                          SizedBox(width: 2),
                          Text(
                            'FEATURED',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                // Wishlist Button
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: GestureDetector(
                    onTap: () {
                      // Toggle wishlist
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Icon(
                        recommended["isLiked"] ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: recommended["isLiked"] ? ColorGlobalVariables.redColor : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Condition
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          recommended["productName"] ?? 'Unnamed Vehicle',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        recommended["productNature"] ?? 'Used',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Price and Mileage
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'GH₵${recommended["cost"]}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ColorGlobalVariables.redColor,
                        ),
                      ),
                      if (recommended["mileage"] != null)
                        Row(
                          children: [
                            Icon(Icons.speed, size: 12, color: Colors.grey[600]),
                            const SizedBox(width: 2),
                            Text(
                              "${recommended["mileage"]} km",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Brand and Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Brand Logo
                      recommended["productLogo"].toString().isNotEmpty 
                          ? Container(
                              width: 20,
                              height: 20,
                              child: CustomImage(
                                imagePath: recommended["productLogo"],
                                isAssetImage: true,
                                isImageBorderRadiusRequired: false,
                                fit: BoxFit.contain,
                              ),
                            )
                          : const SizedBox(width: 20),
                      
                      // Transmission
                      Row(
                        children: [
                          Icon(Icons.settings, size: 12, color: Colors.grey[600]),
                          const SizedBox(width: 2),
                          Text(
                            recommended["driveType"] ?? 'Automatic',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      
                      // Location
                      Flexible(
                        child: Row(
                          children: [
                            Icon(Icons.location_on, size: 12, color: Colors.grey[600]),
                            const SizedBox(width: 2),
                            Flexible(
                              child: Text(
                                recommended["location"] ?? 'Location',
                                style: TextStyle(
                                  fontSize: 10,
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
    final screenSize = MediaQuery.of(context).size;

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
                        // Vehicle name
                        Text(
                          item['name'] ?? 'Unnamed Item',
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Price
                        Text(
                          'GH₵ ${formatNumber(shortenerRequired: false, number: int.parse(item['price']?.toString() ?? '0'))}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Description
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
                        // Location and date info
                        if (item['location'] != null) ...[
                          _buildInfoRow(Icons.location_on_outlined, item['location']),
                          const SizedBox(height: 8),
                        ],
                        _buildInfoRow(Icons.refresh_outlined, formatTimeAgo(item['created_at'] ?? '')),
                        const SizedBox(height: 16),
                        
                        // Rating, Verified Dealer, and Notify Price Drops row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // verified dealer
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
                            // Stars rating
                            SizedBox(
                              height: 16,
                              child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                primary: false,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(right: 1),
                                  child: CustomIcon(
                                    iconData: Icons.star, 
                                    isFaIcon: false, 
                                    iconSize: 12,
                                    iconColor: ColorGlobalVariables.goldColor
                                  ),
                                ),
                              ),
                            ),
                            // Notify Price Drops button
                            Links(
                              linkTextType: 'Notify price drops', 
                              linkTextColor: ColorGlobalVariables.blackColor, 
                              isTextSmall: true, 
                              textDecorationColor: ColorGlobalVariables.blackColor,
                              isIconWidgetRequiredAtEnd: false, 
                              isIconWidgetRequiredAtFront: true, 
                              iconData: Icons.notifications_outlined,
                              iconColor: ColorGlobalVariables.blackColor,
                              onClickFunction: (){},
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Tags section
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            if(item["warranty"] != null)
                            _buildTag(
                              "Warranty", 
                              Colors.grey[300]!),
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
                                    "Verified",
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
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Highlights section - NOW DYNAMIC
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
                        // Specifications section - NOW DYNAMIC
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
                        // Show more link button
                        Align(
                          alignment: Alignment.centerRight,
                          child: Links(
                            linkTextType: 'Show more', 
                            linkFontWeight: FontWeight.w500,
                            linkTextColor: ColorGlobalVariables.redColor, 
                            isTextSmall: true, 
                            textDecorationColor: ColorGlobalVariables.redColor,
                            isIconWidgetRequiredAtEnd: false, 
                            isIconWidgetRequiredAtFront: false, 
                            onClickFunction: (){}
                          ),
                        ),
                        const Divider(
                          color: ColorGlobalVariables.fadedBlackColor,
                          height: 12,
                          thickness: 0.5,
                        ),
                        const SizedBox(height: 16),
                        // Seller information section
                        Row(
                          children: [
                            // User image
                            CustomImage(
                              imagePath: item['user'] == null ? '${ImageStringGlobalVariables.imagePath}user_profile_temporary.png' : getImageUrl(_safeGetString(item["user"], 'profilePhoto'), null), 
                              isAssetImage: item['user'] == null ? true : false,
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
                                  // Seller name with verification
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
                                  // Joined date
                                  Text(
                                    item["user"] == null ? "No date" : "Joined: ${formatTimeAgo(_safeGetString(item['user'], 'createdAt') ?? '')}",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Number of ads
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
                                onClickFunction: (){}
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
                                onClickFunction: (){}
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Recommended Items Header
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 12),
                    child: Text(
                      'Recommended for You',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  
                  // Recommended items grid view
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    itemCount: recommendeds.length,
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.72,
                    ),
                    itemBuilder: (context, index) {
                      final recommended = recommendeds[index];
                      return _buildRecommendedItem(recommended, screenSize);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> recommendeds = [
    {
      "productImage": "${ImageStringGlobalVariables.imagePath}honda_civic_temporary.png",
      "productType": "FEATURED",
      "productNature": "New",
      "isLiked": false,
      "cost": "400,000",
      "productName": "BMW 8 Series",
      "mileage": 3,
      "productLogo": "${ImageStringGlobalVariables.imagePath}bmw_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"  
    },
    {
      "productImage": "${ImageStringGlobalVariables.imagePath}black_car_temporary.png",
      "productType": "PROMOTION",
      "productNature": "New",
      "isLiked": true,
      "cost": "600,000",
      "productName": "Mercedes Benz GCL 300",
      "mileage": 2,
      "productLogo": "${ImageStringGlobalVariables.imagePath}mercedes_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
  ];
}