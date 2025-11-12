import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getSimilarItemsProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:get/get.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
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

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF303030) // grey[900]
        : Colors.grey[50]!;
  }

  Color _getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF424242) // grey[800]
        : Colors.white;
  }

  Color _getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFFFFFF) // white
        : Colors.black87;
  }

  Color _getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xB3FFFFFF) // white70
        : Colors.grey[600]!;
  }

  Color _getIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFFFFFF) // white
        : Colors.black87;
  }

  Color _getImagePlaceholderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF424242) // grey[800]
        : Colors.grey[200]!;
  }

  Color _getEmptyStateIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF90CAF9) // light blue
        : Colors.blue[400]!;
  }

  Color _getEmptyStateBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF1E3A5F) // dark blue
        : Colors.blue[50]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(context),
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF424242) // grey[800]
            : Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded, 
            size: 20, 
            color: _getIconColor(context)
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          _category.name,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : ColorGlobalVariables.brownColor,
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
            return _buildContent(provider, context);
          },
        ),
      ),
    );
  }

  Widget _buildContent(SimilarItemsProvider provider, BuildContext context) {
    // Show empty state if no items and not loading (this is normal, not an error)
    if (!provider.isLoading && provider.items.isEmpty) {
      return _buildEmptyState(context);
    }

    return RefreshIndicator(
      onRefresh: () => provider.refresh(),
      backgroundColor: _getCardColor(context),
      color: ColorGlobalVariables.brownColor,
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Header Section
          SliverToBoxAdapter(
            child: _buildHeaderSection(provider, context),
          ),

          // Loading State (initial load)
          if (provider.isLoading && provider.items.isEmpty)
            SliverFillRemaining(
              child: _LoadingState(context: context),
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
            SliverToBoxAdapter(
              child: _LoadingMoreIndicator(context: context),
            ),

          // End of List Indicator
          if (!provider.hasMore && provider.items.isNotEmpty)
            SliverToBoxAdapter(
              child: _EndOfListIndicator(context: context),
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(SimilarItemsProvider provider, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _category.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _getTextColor(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            provider.items.isNotEmpty 
                ? '${provider.items.length} items found${provider.hasMore ? '+' : ''}'
                : 'No items available',
            style: TextStyle(
              fontSize: 14,
              color: _getSecondaryTextColor(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
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
              color: _getEmptyStateBackgroundColor(context),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              size: 60,
              color: _getEmptyStateIconColor(context),
            ),
          ),
          const SizedBox(height: 32),
          // Empty State Title
          Text(
            'No Items Available',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _getTextColor(context),
            ),
          ),
          const SizedBox(height: 12),
          // Empty State Description
          Text(
            'There are currently no items available in the "${_category.name}" category.',
            style: TextStyle(
              fontSize: 16,
              color: _getSecondaryTextColor(context),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Please check back later or explore other categories.',
            style: TextStyle(
              fontSize: 14,
              color: _getSecondaryTextColor(context),
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
                  foregroundColor: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF90CAF9) // light blue
                      : Colors.blue[600],
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
  final BuildContext context;
  const _LoadingState({required this.context});

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
            color: _getSecondaryTextColor(context),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Please wait while we fetch the latest items',
          style: TextStyle(
            color: _getSecondaryTextColor(context),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  static Color _getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xB3FFFFFF) // white70
        : Colors.grey[600]!;
  }
}

// Loading More Indicator Widget
class _LoadingMoreIndicator extends StatelessWidget {
  final BuildContext context;
  const _LoadingMoreIndicator({required this.context});

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
              color: _getSecondaryTextColor(context),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  static Color _getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xB3FFFFFF) // white70
        : Colors.grey[600]!;
  }
}

// End of List Indicator Widget
class _EndOfListIndicator extends StatelessWidget {
  final BuildContext context;
  const _EndOfListIndicator({required this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            size: 40,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.green[300]
                : Colors.green[400],
          ),
          const SizedBox(height: 8),
          Text(
            'You\'ve reached the end',
            style: TextStyle(
              color: _getSecondaryTextColor(context),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'No more items to load',
            style: TextStyle(
              color: _getSecondaryTextColor(context),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  static Color _getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xB3FFFFFF) // white70
        : Colors.grey[500]!;
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

  Color _getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF424242) // grey[800]
        : Colors.white;
  }

  Color _getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFFFFFF) // white
        : Colors.black87;
  }

  Color _getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xB3FFFFFF) // white70
        : Colors.grey[600]!;
  }

  Color _getImagePlaceholderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF424242) // grey[800]
        : Colors.grey[200]!;
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
        // DIRECTLY PASS SimilarItem TO DetailPage WITHOUT CONVERSION
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
          color: _getCardColor(context),
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
                    color: _getImagePlaceholderColor(context),
                    child: _buildItemImage(firstImage, context),
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
                            color: _getCardColor(context),
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
                                      _getSecondaryTextColor(context),
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
                                          : _getSecondaryTextColor(context),
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
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _getTextColor(context),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        widget.item.year ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: _getSecondaryTextColor(context),
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
                            Icon(
                              Icons.speed, 
                              size: 14, 
                              color: _getSecondaryTextColor(context)
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${formatNumber(shortenerRequired: true, number: int.tryParse(widget.item.mileage!) ?? 0)} km",
                              style: TextStyle(
                                fontSize: 12,
                                color: _getSecondaryTextColor(context),
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
                            Icon(
                              Icons.settings, 
                              size: 14, 
                              color: _getSecondaryTextColor(context)
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.item.transmission!,
                              style: TextStyle(
                                fontSize: 11,
                                color: _getSecondaryTextColor(context),
                              ),
                            ),
                          ],
                        ),
                      
                      if (widget.item.location != null)
                        Flexible(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on, 
                                size: 14, 
                                color: _getSecondaryTextColor(context)
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  widget.item.location!,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: _getSecondaryTextColor(context),
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

  Widget _buildItemImage(String imageUrl, BuildContext context) {
    final bool isAssetImage = imageUrl == "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
    
    if (isAssetImage) {
      return Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildImageErrorPlaceholder(context);
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
          return _buildImageErrorPlaceholder(context);
        },
      );
    }
  }

  Widget _buildImageErrorPlaceholder(BuildContext context) {
    return Container(
      color: _getImagePlaceholderColor(context),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported, 
              size: 32, 
              color: _getSecondaryTextColor(context)
            ),
            const SizedBox(height: 4),
            Text(
              'No Image',
              style: TextStyle(
                fontSize: 10,
                color: _getSecondaryTextColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}