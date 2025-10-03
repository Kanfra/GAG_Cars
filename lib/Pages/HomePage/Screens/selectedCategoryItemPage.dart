import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getSimilarItemsProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:get/get.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/similarItemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistManager.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistToggleProvider.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:provider/provider.dart';

class SelectedCategoryItemPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const SelectedCategoryItemPage({
    super.key,
    required this.allJson,
  });

  @override
  State<SelectedCategoryItemPage> createState() => _SelectedCategoryItemPageState();
}

class _SelectedCategoryItemPageState extends State<SelectedCategoryItemPage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _loadMoreDebouncer;
  late Categories _category;
  late List<RecommendedItem> _categoryItems;
  late String _itemId;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    
    // Initialize from arguments
    _initializeFromArguments();
  }

void _initializeFromArguments() {
  final Map<String, dynamic> args = widget.allJson;
  
  if (args.containsKey('selectedCategory')) {
    _category = args['selectedCategory'] as Categories;
    
    // Get the pre-filtered category items from homepage
    if (args.containsKey('categoryItems')) {
      final categoryItems = args['categoryItems'] as List<dynamic>;
      // Simply cast to RecommendedItem since we passed objects directly
      _categoryItems = categoryItems.cast<RecommendedItem>();
    } else {
      _categoryItems = []; // Empty list if no items passed
    }
    
    // Get itemId for fallback (if needed)
    _itemId = args['itemId'] as String? ?? _category.id.toString();
    
    // Debug log
    print('Category: ${_category.name}, Items count: ${_categoryItems.length}');
  }
}

// REMOVE the _convertJsonToRecommendedItems method entirely - we don't need it!



  void _scrollListener() {
    // Since we're using pre-loaded data, we don't need lazy loading
    // But keeping the structure for consistency
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _loadMoreDebouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: Text(
          _category.name,
          style: const TextStyle(
            color: ColorGlobalVariables.brownColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          // CustomRoundIconButton(
          //   iconData: Icons.filter_list_rounded,
          //   isBorderSlightlyCurved: true,
          //   onIconButtonClickFunction: () {
          //     _showFilterOptions();
          //   },
          //   buttonSize: 36,
          //   iconSize: 18,
          // ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Header Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _category.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_categoryItems.length} items found',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Grid Items
          if (_categoryItems.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = _categoryItems[index];
                    return _CategoryItemWidget(
                      item: item,
                      screenSize: MediaQuery.of(context).size,
                    );
                  },
                  childCount: _categoryItems.length,
                ),
              ),
            )
          else
            // Empty State
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.category_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No items found in this category',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Try a different category or check back later',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorGlobalVariables.brownColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('Back to Categories', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _onRefresh() async {
    // Since we're using pre-loaded data, refresh would go back to homepage
    // or you could implement a different refresh logic
    setState(() {
      // Could trigger a re-filter or other logic here
    });
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                                'Filter Options',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              ),
              // Add your filter options here
              Expanded(
                child: Center(
                  child: Text(
                    'Filter options for ${_category.name}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CategoryItemWidget extends StatefulWidget {
  final RecommendedItem item;
  final Size screenSize;

  const _CategoryItemWidget({
    required this.item,
    required this.screenSize,
  });

  @override
  __CategoryItemWidgetState createState() => __CategoryItemWidgetState();
}

class __CategoryItemWidgetState extends State<_CategoryItemWidget>
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
    final firstImage = widget.item.images?.isNotEmpty == true
        ? widget.item.images!.first
        : "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
    final brandImage = widget.item.brand?.image;
    final isPromoted = widget.item.isPromoted == true;

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RouteClass.getDetailPage(),
          arguments: {
            'product': widget.item.toJson(),
            'item': widget.item.toJson(),
            'type': 'category-item',
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
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
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: _buildItemImage(firstImage),
                  ),
                ),
                
                // Condition Badge
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
                
                // PROMOTED BADGE
                if (isPromoted)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.amber[700],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 12),
                          const SizedBox(width: 2),
                          Text(
                            'FEATURED',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                // Animated Wishlist Button
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      if (_isLoading) return;
                      _toggleLike();
                    },
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
                                color: Colors.black12,
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
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Year
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.item.name ?? 'Unnamed Vehicle',
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
                        widget.item.year ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Price and Mileage
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'GH₵ ${formatNumber(shortenerRequired: true, number: int.parse(widget.item.price ?? '0'))}',
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

                  // Brand and Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (brandImage != null)
                        Container(
                          width: 24,
                          height: 24,
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(brandImage, null),
                            fit: BoxFit.contain,
                            errorWidget: (context, url, error) => Icon(
                              Icons.business,
                              size: 16,
                              color: Colors.grey[400],
                            ),
                          ),
                        )
                      else
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
}