
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/MyListingsService/myListingsService.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/myListingPage.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shimmer/shimmer.dart';

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

  // Default car data as fallback with safe values
  final Map<String, dynamic> defaultCar = {
    "name": "Car Listing",
    "price": "GH₵ 0",
    "info": "No information available",
    "highlights": [
      {"title": "Model Year", "value": "N/A"},
      {"title": "Mileage", "value": "N/A"},
      {"title": "Fuel Type", "value": "N/A"},
    ],
    "specifications": [
      {"title": "Make", "value": "N/A"},
      {"title": "Model", "value": "N/A"},
      {"title": "Color", "value": "N/A"},
    ],
  };

  @override
  void initState() {
    super.initState();
    // Safe initialization of listing data
    try {
      listing = widget.allJson['listing'] as Map<String, dynamic>? ?? {};
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

  // Delete confirmation dialog
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
                // Header with icon
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
                
                // Warning message
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
                          Navigator.of(context).pop(); // Close the dialog
                          _performDelete(); // Then perform deletion
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

  // Actual delete operation using the service
  // Actual delete operation using the service
Future<void> _performDelete() async {
  if (_isDeleting) return;

  setState(() => _isDeleting = true);

  try {
    final listingId = listing['id']?.toString();
    if (listingId == null || listingId.isEmpty) {
      throw Exception('Invalid listing ID');
    }

    // Use the service class for deletion
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
        // This will replace the current stack with MyListingPage
        // When user presses back from MyListingPage, it will go back to SettingsPage
        Get.offUntil(
        GetPageRoute(page: () => MyListingPage()),
        (route) => route.isFirst, // This keeps the very first route (usually home)
      );
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

  // Safe data access methods
  String getListingName() {
    try {
      final name = listing['name'];
      if (name is String && name.isNotEmpty) return name;
    } catch (e) {
      logger.e('Error getting listing name: $e');
    }
    return defaultCar['name'];
  }

  String getListingPrice() {
    try {
      final price = listing['price'];
      if (price is String && price.isNotEmpty) {
        return 'GH₵ ${formatNumber(shortenerRequired: false, number: int.parse(listing['price']))}';
      } else if (price is num) {
        return 'GH₵ ${price.toString()}';
      }
    } catch (e) {
      logger.e('Error getting listing price: $e');
    }
    return defaultCar['price'];
  }

  String getListingInfo() {
    try {
      final info = listing['info'];
      if (info is String && info.isNotEmpty) return info;
      final description = listing['description'];
      if (description is String && description.isNotEmpty) return description;
    } catch (e) {
      logger.e('Error getting listing info: $e');
    }
    return defaultCar['info'];
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
    return ['assets/images/default_car.png'];
  }

  List<Map<String, String>> getHighlights() {
    try {
      final highlights = listing['highlights'];
      if (highlights is List) {
        return highlights.whereType<Map<String, dynamic>>().map((item) {
          return {
            'title': (item['title']?.toString() ?? 'N/A').trim(),
            'value': (item['value']?.toString() ?? 'N/A').trim(),
          };
        }).toList();
      }
    } catch (e) {
      logger.e('Error parsing highlights: $e');
    }
    return List<Map<String, String>>.from(defaultCar['highlights']);
  }

  List<Map<String, String>> getSpecifications() {
    try {
      final specs = listing['specifications'];
      if (specs is List) {
        return specs.whereType<Map<String, dynamic>>().map((item) {
          return {
            'title': (item['title']?.toString() ?? 'N/A').trim(),
            'value': (item['value']?.toString() ?? 'N/A').trim(),
          };
        }).toList();
      }
    } catch (e) {
      logger.e('Error parsing specifications: $e');
    }
    return List<Map<String, String>>.from(defaultCar['specifications']);
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
        : 'assets/images/default_car.png';

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
                onPressed: () {
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
              IconButton(
                onPressed: () {},
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.share, color: Colors.white, size: 20),
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
                        final image = index < images.length ? images[index] : 'assets/images/default_car.png';
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
                    getListingInfo(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(height: 1),
                  const SizedBox(height: 20),
                  _buildInfoRow(Icons.location_on_outlined, listing['location'] ?? 'Location not available'),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.refresh_outlined, '${formatTimeAgo(listing['created_at'] ?? '')}'),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildTag("Warranty", ColorGlobalVariables.greyColor),
                      _buildVerifiedSellerTag(),
                    ],
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
                        child: _buildActionButton(
                          "Mark as Sold",
                          Icons.check,
                          Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildActionButton(
                          "Promote",
                          FontAwesomeIcons.bullhorn,
                          Colors.green,
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

  Widget _buildActionButton(String text, IconData icon, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Row(
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