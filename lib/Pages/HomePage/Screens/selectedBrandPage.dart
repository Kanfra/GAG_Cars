import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/brandItemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getBrandItemsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistManager.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistToggleProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SelectedBrandPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const SelectedBrandPage({
    super.key,
    required this.allJson,
  });

  @override
  State<SelectedBrandPage> createState() => _SelectedBrandPageState();
}

class _SelectedBrandPageState extends State<SelectedBrandPage> {
  late Map<String, dynamic> _selectedBrand;
  late String _type;
  final ScrollController _scrollController = ScrollController();
  final double _scrollThreshold = 100.0;
  bool _showSearchBar = true;
  double _lastScrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeFromArguments();
    _setupScrollController();
    _loadInitialItems();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _initializeFromArguments() {
    final Map<String, dynamic> args = widget.allJson;

    print('=== DEBUG: SelectedBrandPage Arguments ===');
    print('All arguments keys: ${args.keys}');
    print('Arguments: $args');
    print('=====================================');

    if (args.containsKey('selectedBrand')) {
      _selectedBrand = args['selectedBrand'] as Map<String, dynamic>;
      print('Selected Brand Data: $_selectedBrand');
    } else {
      throw Exception('selectedBrand is required in arguments');
    }

    _type = args['type'] as String? ?? 'selectedBrand';
  }

  void _setupScrollController() {
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final currentOffset = _scrollController.offset;
      
      // Show search bar when at the top
      if (currentOffset <= 0) {
        if (!_showSearchBar) {
          setState(() {
            _showSearchBar = true;
          });
        }
      } 
      // Hide when scrolling down, show when scrolling up
      else if (currentOffset > _lastScrollOffset + 50) {
        // Scrolling down - hide search bar
        if (_showSearchBar) {
          setState(() {
            _showSearchBar = false;
          });
        }
      } else if (currentOffset < _lastScrollOffset - 25) {
        // Scrolling up - show search bar
        if (!_showSearchBar) {
          setState(() {
            _showSearchBar = true;
          });
        }
      }
      
      _lastScrollOffset = currentOffset;
    }
    
    // Load more functionality
    final provider = Provider.of<BrandItemsProvider>(context, listen: false);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - _scrollThreshold &&
        provider.canLoadMore) {
      _loadMoreItems();
    }
  }

  void _loadInitialItems() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BrandItemsProvider>(context, listen: false);
      
      final brandId = _selectedBrand['id'];
      if (brandId != null) {
        print('🔄 Loading vehicles for brand: $brandId');
        provider.loadInitialItems(brandId);
      } else {
        print('❌ No brand ID found in selectedBrand');
      }
    });
  }

  void _loadMoreItems() {
    final provider = Provider.of<BrandItemsProvider>(context, listen: false);
    if (provider.canLoadMore) {
      print('🔄 Loading more items...');
      provider.loadMoreItems();
    }
  }

  void _onRefresh() async {
    final provider = Provider.of<BrandItemsProvider>(context, listen: false);
    await provider.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: Text(
          _selectedBrand['name'] ?? 'Brand',
          style: TextStyle(
            color: ColorGlobalVariables.brownColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer<BrandItemsProvider>(
          builder: (context, provider, child) {
            return RefreshIndicator(
              onRefresh: () async => _onRefresh(),
              backgroundColor: Colors.white,
              color: ColorGlobalVariables.brownColor,
              child: Stack(
                children: [
                  _buildContent(provider, isSmallScreen),
                  
                  // Floating Search Bar
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      transform: Matrix4.translationValues(
                        0, 
                        _showSearchBar ? 0 : -100, 
                        0
                      ),
                      child: _buildSearchWidget(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BrandItemsProvider provider, bool isSmallScreen) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        // Add padding at the top for the floating search bar
        SliverToBoxAdapter(
          child: SizedBox(height: _showSearchBar ? 80 : 0),
        ),

        // Header Section
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildHeaderSection(provider),
          ),
        ),

        // Content based on state
        if (provider.isLoading && provider.items.isEmpty)
          const SliverToBoxAdapter(
            child: _LoadingState(),
          )
        else if (provider.hasError && provider.items.isEmpty)
          SliverToBoxAdapter(
            child: _buildErrorState(provider.error!),
          )
        else if (provider.isEmpty)
          SliverToBoxAdapter(
            child: _buildEmptyState(),
          )
        else
          _buildItemsGrid(provider, isSmallScreen),

        // Load More Indicator
        if (provider.hasMore)
          SliverToBoxAdapter(
            child: _buildLoadMoreIndicator(provider),
          )
        else if (provider.hasItems)
          const SliverToBoxAdapter(
            child: _NoMoreItemsIndicator(),
          ),
      ],
    );
  }

  Widget _buildSearchWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          // Navigate to search page or implement search functionality
          Get.toNamed(RouteClass.getHomePageSearchPage());
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  color: ColorGlobalVariables.blueColor,
                  size: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Search ${_selectedBrand['name'] ?? 'brand'} vehicles...',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorGlobalVariables.blueColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.tune_rounded,
                        color: ColorGlobalVariables.blueColor,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Filter',
                        style: TextStyle(
                          color: ColorGlobalVariables.blueColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BrandItemsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _selectedBrand['name'] ?? 'Brand',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _buildResultsText(provider),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        if (provider.hasItems) ...[
          const SizedBox(height: 8),
          _buildStatsSection(provider),
        ],
      ],
    );
  }

  String _buildResultsText(BrandItemsProvider provider) {
    if (provider.isLoading && provider.items.isEmpty) {
      return "Searching for vehicles...";
    } else if (provider.isEmpty) {
      return "No vehicles found";
    } else {
      return "${provider.totalItems} ${provider.totalItems == 1 ? 'vehicle' : 'vehicles'} available${provider.hasMore ? ' • More loading...' : ''}";
    }
  }

  Widget _buildStatsSection(BrandItemsProvider provider) {
    final priceRange = _calculatePriceRange(provider.items);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Price range: GH₵${formatNumber(shortenerRequired: true, number: priceRange['min']!.toInt())} - GH₵${formatNumber(shortenerRequired: true, number: priceRange['max']!.toInt())}',
            style: TextStyle(
              color: Colors.blue[700],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (provider.hasMore)
            Text(
              '• More available',
              style: TextStyle(
                color: Colors.green[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Map<String, double> _calculatePriceRange(List<BrandItem> items) {
    if (items.isEmpty) return {'min': 0, 'max': 0};
    
    final prices = items.map((item) => double.tryParse(item.price) ?? 0).toList();
    prices.sort();
    
    return {
      'min': prices.first,
      'max': prices.last,
    };
  }

  Widget _buildItemsGrid(BrandItemsProvider provider, bool isSmallScreen) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isSmallScreen ? 1 : 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: isSmallScreen ? 1.6 : 0.72,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = provider.items[index];
            return _BrandItemWidget(
              item: item,
              screenSize: MediaQuery.of(context).size,
            );
          },
          childCount: provider.items.length,
        ),
      ),
    );
  }

  Widget _buildLoadMoreIndicator(BrandItemsProvider provider) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: provider.isLoadingMore
            ? Column(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 8),
                  Text(
                    'Loading more vehicles...',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            : GestureDetector(
                onTap: _loadMoreItems,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh, color: Colors.blue[700], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Load More Vehicles',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_car_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 24),
          Text(
            'No Vehicles Found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'We couldn\'t find any ${_selectedBrand['name'] ?? 'brand'} vehicles at the moment.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Check back later or try another brand.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => _loadInitialItems(),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.brownColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red[400],
          ),
          const SizedBox(height: 24),
          const Text(
            'Unable to Load Vehicles',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _extractErrorMessage(error),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _loadInitialItems(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorGlobalVariables.brownColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Try Again'),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _extractErrorMessage(String fullError) {
    try {
      if (fullError.contains('"message":')) {
        final start = fullError.indexOf('"message":') + 10;
        final end = fullError.indexOf('",', start);
        return fullError.substring(start, end).replaceAll('"', '');
      }
      return fullError.length > 150 ? '${fullError.substring(0, 150)}...' : fullError;
    } catch (e) {
      return fullError.length > 150 ? '${fullError.substring(0, 150)}...' : fullError;
    }
  }
}

// Loading State Widget
class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Loading vehicles...',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// No More Items Indicator
class _NoMoreItemsIndicator extends StatelessWidget {
  const _NoMoreItemsIndicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          'All vehicles loaded',
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _BrandItemWidget extends StatefulWidget {
  final BrandItem item;
  final Size screenSize;

  const _BrandItemWidget({
    required this.item,
    required this.screenSize,
  });

  @override
  _BrandItemWidgetState createState() => _BrandItemWidgetState();
}

class _BrandItemWidgetState extends State<_BrandItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
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
        if (_isLiked) _animationController.value = 1.0;
      });
    } catch (e) {
      print('Error checking wishlist status: $e');
    }
  }

  Future<void> _toggleLike() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    try {
      if (_isLiked) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }

      final wishlistProvider = Provider.of<WishlistToggleProvider>(context, listen: false);
      final result = await wishlistProvider.toggleWishlistItem(
        itemId: widget.item.id,
        context: context,
      );

      if (result) {
        setState(() => _isLiked = !_isLiked);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isLiked ? 'Added to wishlist!' : 'Removed from wishlist'),
            backgroundColor: _isLiked ? Colors.green : Colors.orange,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print('Wishlist error: $e');
    } finally {
      setState(() => _isLoading = false);
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

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RouteClass.getDetailPage(),
          arguments: {
            'product': widget.item.toJson(),
            'item': widget.item.toJson(),
            'type': 'brand-item',
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
            // Image section
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
                // Condition badge
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
                // Wishlist button
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: _toggleLike,
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
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                                  ),
                                )
                              : Icon(
                                  _isLiked ? Icons.favorite : Icons.favorite_border,
                                  size: 18,
                                  color: _isLiked ? Colors.red : Colors.grey[600],
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Details section
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
                                  widget.item.location,
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
        errorBuilder: (context, error, stackTrace) => _buildImageErrorPlaceholder(),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: getImageUrl(imageUrl, null),
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
          ),
        ),
        errorWidget: (context, url, error) => _buildImageErrorPlaceholder(),
      );
    }
  }

  Widget _buildImageErrorPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_not_supported, size: 32, color: Colors.grey),
            SizedBox(height: 4),
            Text(
              'No Image',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}