import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getSimilarItemsProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:get/get.dart';
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
  late String _itemId;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    
    // Initialize from arguments
    _initializeFromArguments();
    
    // Load initial items using provider
    _loadInitialItems();
  }

  void _initializeFromArguments() {
    final Map<String, dynamic> args = widget.allJson;
    
    if (args.containsKey('selectedCategory')) {
      _category = args['selectedCategory'] as Categories;
      
      // Get itemId for the provider
      _itemId = args['itemId'] as String? ?? _category.id.toString();
      
      // Debug log
      print('Category: ${_category.name}, Category ID: ${_category.id}, Item ID: $_itemId');
    }
  }

  void _loadInitialItems() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SimilarItemsProvider>(context, listen: false);
      provider.loadInitialItems(_category.id!, _itemId);
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreDebouncer?.cancel();
      _loadMoreDebouncer = Timer(const Duration(milliseconds: 500), () {
        final provider = Provider.of<SimilarItemsProvider>(context, listen: false);
        if (provider.hasMore && !provider.isLoadingMore) {
          provider.loadMoreItems();
        }
      });
    }
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
        actions: const [
          SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Consumer<SimilarItemsProvider>(
          builder: (context, provider, child) {
            return _buildContent(provider);
          },
        ),
      ),
    );
  }

  Widget _buildContent(SimilarItemsProvider provider) {
    // Show empty state if no items and not loading (this is normal, not an error)
    if (!provider.isLoading && provider.items.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () => provider.refresh(),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Header Section
          SliverToBoxAdapter(
            child: _buildHeaderSection(provider),
          ),

          // Loading State (initial load)
          if (provider.isLoading && provider.items.isEmpty)
            const SliverFillRemaining(
              child: _LoadingState(),
            ),

          // Grid Items - Show only if we have items
          if (provider.items.isNotEmpty)
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
                    final item = provider.items[index];
                    return _CategoryItemWidget(
                      item: item,
                      screenSize: MediaQuery.of(context).size,
                    );
                  },
                  childCount: provider.items.length,
                ),
              ),
            ),

          // Loading More Indicator
          if (provider.isLoadingMore)
            const SliverToBoxAdapter(
              child: _LoadingMoreIndicator(),
            ),

          // End of List Indicator
          if (!provider.hasMore && provider.items.isNotEmpty)
            const SliverToBoxAdapter(
              child: _EndOfListIndicator(),
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(SimilarItemsProvider provider) {
    return Padding(
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
            provider.items.isNotEmpty 
                ? '${provider.items.length} items found${provider.hasMore ? '+' : ''}'
                : 'No items available',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          // Empty State Icon
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              size: 60,
              color: Colors.blue[400],
            ),
          ),
          const SizedBox(height: 32),
          // Empty State Title
          Text(
            'No Items Available',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          // Empty State Description
          Text(
            'There are currently no items available in the "${_category.name}" category.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Please check back later or explore other categories.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Action Buttons
          Column(
            children: [
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorGlobalVariables.brownColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Browse Other Categories',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Provider.of<SimilarItemsProvider>(context, listen: false).refresh(),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue[600],
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Refresh'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Loading State Widget
class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
          strokeWidth: 3,
        ),
        const SizedBox(height: 20),
        Text(
          'Loading Items...',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Please wait while we fetch the latest items',
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

// Loading More Indicator Widget
class _LoadingMoreIndicator extends StatelessWidget {
  const _LoadingMoreIndicator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
            strokeWidth: 2,
          ),
          const SizedBox(height: 12),
          Text(
            'Loading more items...',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// End of List Indicator Widget
class _EndOfListIndicator extends StatelessWidget {
  const _EndOfListIndicator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            size: 40,
            color: Colors.green[400],
          ),
          const SizedBox(height: 8),
          Text(
            'You\'ve reached the end',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'No more items to load',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItemWidget extends StatefulWidget {
  final SimilarItem item;
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

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RouteClass.getDetailPage(),
          arguments: {
            'product': _convertToRecommendedItem(widget.item).toJson(),
            'item': _convertToRecommendedItem(widget.item).toJson(),
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
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
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
                          widget.item.name ?? 'Unnamed Item',
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
                            Icon(Icons.speed, size: 14, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(
                              "${formatNumber(shortenerRequired: true, number: int.tryParse(widget.item.mileage!) ?? 0)} km",
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

  // Helper method to convert SimilarItem to RecommendedItem for compatibility
  RecommendedItem _convertToRecommendedItem(SimilarItem similarItem) {
    return RecommendedItem(
      id: similarItem.id,
      name: similarItem.name ?? 'Unnamed Item',
      price: similarItem.price ?? '0',
      year: similarItem.year ?? '',
      images: similarItem.images ?? [],
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
      // Convert String dates to DateTime
      warrantyExpiration: similarItem.warrantyExpiration != null 
          ? DateTime.tryParse(similarItem.warrantyExpiration!) 
          : null,
      deletedAt: similarItem.deletedAt != null 
          ? DateTime.tryParse(similarItem.deletedAt!) 
          : null,
      createdAt: DateTime.tryParse(similarItem.createdAt ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(similarItem.updatedAt ?? '') ?? DateTime.now(),
      height: similarItem.height,
      vin: similarItem.vin,
      isPromoted: false,
      brand: null,
    );
  }
}