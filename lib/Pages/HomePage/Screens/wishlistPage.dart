import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getWishlistProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistToggleProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final ScrollController _scrollController = ScrollController();
  final _scrollThreshold = 100.0;
  String _viewType = 'grid'; // 'grid' or 'list'

  @override
  void initState() {
    super.initState();
    _initializeWishlist();
    _scrollController.addListener(_scrollListener);
  }

  void _initializeWishlist() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<WishlistFetchProvider>();
      if (provider.wishlistItems.isEmpty) {
        provider.fetchWishlist();
      }
    });
  }

  void _scrollListener() {
    final provider = context.read<WishlistFetchProvider>();
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold &&
        !provider.isLoadingMore &&
        provider.hasMore) {
      provider.loadMoreWishlist();
    }
  }

  void _toggleView(String viewType) {
    setState(() {
      _viewType = viewType;
    });
  }

  Future<void> _onRefresh() async {
    await context.read<WishlistFetchProvider>().refreshWishlist();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(theme),
      body: _buildBody(theme),
    );
  }

  PreferredSizeWidget _buildAppBar(ThemeData theme) {
    return CustomAppbar(
      onLeadingIconClickFunction: () => Get.back(),
      isLeadingWidgetExist: false,
      leadingIconData: Icons.arrow_back_ios_new,
      appbarBackgroundColor: theme.appBarTheme.backgroundColor ?? Colors.white,
      leadingIconDataColor: theme.iconTheme.color ?? ColorGlobalVariables.fadedBlackColor,
      titleText: "My Wishlist",
      titleTextColor: theme.appBarTheme.foregroundColor ?? ColorGlobalVariables.brownColor,
      titleFontWeight: FontWeight.bold,
      titleTextSize: 22,
      centerTitle: true,
      actions: [
        const SizedBox(width: 8),
        _buildNotificationButton(theme),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _buildNotificationButton(ThemeData theme) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomRoundIconButton(
          iconData: Icons.notifications_outlined,
          iconSize: 20,
          buttonSize: 40,
          isBorderSlightlyCurved: true,
          onIconButtonClickFunction: () => _handleNotificationTap(),
          backgroundColor: theme.brightness == Brightness.dark ? Colors.grey[800]! : Colors.grey[50]!,
          iconDataColor: theme.iconTheme.color ?? Colors.grey[700],
        ),
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: ColorGlobalVariables.brownColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  void _handleNotificationTap() {
    Get.toNamed(RouteClass.notificationsPage);
  }

  Widget _buildBody(ThemeData theme) {
    return SafeArea(
      child: Consumer<WishlistFetchProvider>(
        builder: (context, provider, _) {
          return RefreshIndicator.adaptive(
            onRefresh: _onRefresh,
            color: ColorGlobalVariables.brownColor,
            backgroundColor: theme.cardColor,
            displacement: 40,
            strokeWidth: 2.5,
            child: CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                _buildHeaderSliver(provider, theme),
                if (provider.isLoading && provider.wishlistItems.isEmpty)
                  _buildLoadingSliver(theme)
                else if (provider.errorMessage.isNotEmpty && provider.wishlistItems.isEmpty)
                  _buildErrorSliver(provider, theme)
                else if (provider.wishlistItems.isEmpty)
                  _buildEmptySliver(theme)
                else
                  _buildContentSliver(provider, theme),
                if (provider.isLoadingMore) _buildLoadingMoreSliver(theme),
                if (!provider.hasMore && provider.wishlistItems.isNotEmpty)
                  _buildEndSliver(theme),
              ],
            ),
          );
        },
      ),
    );
  }

  SliverToBoxAdapter _buildHeaderSliver(WishlistFetchProvider provider, ThemeData theme) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Wishlist',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleLarge?.color,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${provider.totalItems} saved items',
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.textTheme.bodyMedium?.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            _buildViewToggleButtons(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildViewToggleButtons(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Grid View Button
          CustomRoundIconButton(
            iconData: Icons.grid_view,
            isBorderSlightlyCurved: true,
            onIconButtonClickFunction: () => _toggleView('grid'),
            buttonSize: 36,
            iconSize: 16,
            backgroundColor: _viewType == 'grid' 
                ? ColorGlobalVariables.brownColor 
                : theme.cardColor,
            iconDataColor: _viewType == 'grid' 
                ? Colors.white 
                : theme.iconTheme.color,
          ),
          SizedBox(width: 4),
          // List View Button
          CustomRoundIconButton(
            iconData: Icons.list,
            isBorderSlightlyCurved: true,
            onIconButtonClickFunction: () => _toggleView('list'),
            buttonSize: 36,
            iconSize: 16,
            backgroundColor: _viewType == 'list' 
                ? ColorGlobalVariables.brownColor 
                : theme.cardColor,
            iconDataColor: _viewType == 'list' 
                ? Colors.white 
                : theme.iconTheme.color,
          ),
        ],
      ),
    );
  }

  SliverFillRemaining _buildLoadingSliver(ThemeData theme) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLoadingAnimation(),
            const SizedBox(height: 20),
            Text(
              'Loading your wishlist...',
              style: TextStyle(
                fontSize: 16,
                color: theme.textTheme.bodyMedium?.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingAnimation() {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.redColor),
              strokeWidth: 3,
            ),
          ),
          Center(
            child: Icon(
              Icons.favorite,
              color: ColorGlobalVariables.redColor.withOpacity(0.8),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  SliverFillRemaining _buildErrorSliver(WishlistFetchProvider provider, ThemeData theme) {
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 80,
              color: theme.iconTheme.color,
            ),
            const SizedBox(height: 20),
            Text(
              'Unable to Load Wishlist',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: theme.textTheme.titleLarge?.color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              provider.errorMessage.isNotEmpty ? provider.errorMessage : 'An unknown error occurred',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: theme.textTheme.bodyMedium?.color,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            _buildRetryButton(provider, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildRetryButton(WishlistFetchProvider provider, ThemeData theme) {
    return ElevatedButton(
      onPressed: provider.fetchWishlist,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorGlobalVariables.redColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        'Try Again',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  SliverFillRemaining _buildEmptySliver(ThemeData theme) {
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                size: 50,
                color: theme.iconTheme.color,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No Items in Wishlist',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.titleLarge?.color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Start saving your favorite vehicles and\nwe\'ll keep them here for you',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: theme.textTheme.bodyMedium?.color,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 28),
            _buildBrowseButton(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildBrowseButton(ThemeData theme) {
    return ElevatedButton(
      onPressed: () => Get.offAllNamed(RouteClass.mainBottomNavigationPage),
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorGlobalVariables.brownColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.explore, size: 18),
          const SizedBox(width: 8),
          Text(
            'Browse Vehicles',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSliver(WishlistFetchProvider provider, ThemeData theme) {
    if (_viewType == 'grid') {
      return _buildGridSliver(provider, theme);
    } else {
      return _buildListSliver(provider, theme);
    }
  }

  SliverPadding _buildGridSliver(WishlistFetchProvider provider, ThemeData theme) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.72,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = provider.wishlistItems[index];
            return _WishlistGridItem(
              item: item,
              index: index,
            );
          },
          childCount: provider.wishlistItems.length,
        ),
      ),
    );
  }

  SliverList _buildListSliver(WishlistFetchProvider provider, ThemeData theme) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = provider.wishlistItems[index];
          return _WishlistListItem(
            item: item,
            index: index,
          );
        },
        childCount: provider.wishlistItems.length,
      ),
    );
  }

  SliverToBoxAdapter _buildLoadingMoreSliver(ThemeData theme) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Loading more items...',
                style: TextStyle(
                  color: theme.textTheme.bodyMedium?.color,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildEndSliver(ThemeData theme) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                size: 48,
                color: Colors.green,
              ),
              const SizedBox(height: 12),
              Text(
                'All items loaded',
                style: TextStyle(
                  color: theme.textTheme.bodyMedium?.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Grid View Item Widget - Updated with consistent brand image handling
class _WishlistGridItem extends StatefulWidget {
  final dynamic item;
  final int index;

  const _WishlistGridItem({
    required this.item,
    required this.index,
  });

  @override
  State<_WishlistGridItem> createState() => _WishlistGridItemState();
}

class _WishlistGridItemState extends State<_WishlistGridItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  
  bool _isRemoving = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  dynamic get _itemData {
    if (widget.item is Map && widget.item.containsKey('item')) {
      return widget.item['item'];
    }
    return widget.item;
  }

  String get _itemId {
    if (_itemData is Map) {
      return _itemData['id']?.toString() ?? '';
    }
    return _itemData?.id?.toString() ?? '';
  }

  Future<void> _removeItem() async {
    if (_isRemoving) return;
    
    setState(() => _isRemoving = true);
    _animationController.forward();

    try {
      final toggleProvider = context.read<WishlistToggleProvider>();
      final fetchProvider = context.read<WishlistFetchProvider>();
      
      final success = await toggleProvider.toggleWishlistItem(itemId: _itemId, context: context);

      if (success) {
        await Future.delayed(const Duration(milliseconds: 300));
        fetchProvider.removeItem(_itemId);
        
        _showRemovalSnackbar();
      } else {
        _animationController.reverse();
        _showErrorSnackbar();
      }
    } catch (e) {
      _animationController.reverse();
      _showErrorSnackbar(message: 'Error: $e');
    } finally {
      if (mounted) {
        setState(() => _isRemoving = false);
      }
    }
  }

  void _showRemovalSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text('Removed from wishlist'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorSnackbar({String message = 'Failed to remove item'}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _navigateToDetail() {
    Get.toNamed(
      RouteClass.getDetailPage(),
      arguments: {
        'product': _itemData is Map ? _itemData : _itemData.toJson(),
        'item': _itemData is Map ? _itemData : _itemData.toJson(),
        'type': 'wishlist',
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: child,
          ),
        );
      },
      child: _buildCardContent(theme),
    );
  }

  Widget _buildCardContent(ThemeData theme) {
    final imageUrl = _getImageUrl();
    final brandImage = _getBrandImage();

    return Card(
      elevation: 2,
      color: theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: _isRemoving ? null : _navigateToDetail,
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                _buildImageSection(imageUrl, theme),
                
                // Content Section
                _buildContentSection(brandImage, theme),
              ],
            ),
            
            // Remove Button
            Positioned(
              top: 8,
              right: 8,
              child: _buildRemoveButton(theme),
            ),

            // Category Badge
            Positioned(
              top: 8,
              left: 8,
              child: _buildCategoryBadge(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(String imageUrl, ThemeData theme) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Container(
        height: 120,
        width: double.infinity,
        color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[100],
        child: Stack(
          children: [
            _buildImage(imageUrl, theme),
            _buildImageOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl, ThemeData theme) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      progressIndicatorBuilder: (context, url, progress) {
        return Shimmer.fromColors(
          baseColor: theme.brightness == Brightness.dark ? Colors.grey[700]! : Colors.grey[300]!,
          highlightColor: theme.brightness == Brightness.dark ? Colors.grey[600]! : Colors.grey[100]!,
          child: Container(color: theme.cardColor),
        );
      },
      errorWidget: (context, url, error) {
        return _buildImageErrorPlaceholder(theme);
      },
    );
  }

  Widget _buildImageErrorPlaceholder(ThemeData theme) {
    return Container(
      color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_not_supported, size: 32, color: theme.iconTheme.color),
            SizedBox(height: 4),
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

  Widget _buildImageOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.transparent,
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBadge() {
    final category = _getCategory();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        category,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildContentSection(String? brandImage, ThemeData theme) {
    final userProvider = Provider.of<UserProvider>(context);
    
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title and Condition
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _getItemName(),
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
                  _getCondition(),
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),

            // Price and Mileage
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${userProvider.user?.countryCurrencySymbol} ${_getFormattedPrice()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorGlobalVariables.redColor,
                  ),
                ),
                if (_getMileage() != null)
                  Row(
                    children: [
                      Icon(Icons.speed, size: 20, color: theme.iconTheme.color),
                      SizedBox(width: 8),
                      Text(
                        "${formatNumber(shortenerRequired: true, number: int.parse(_getMileage()!))} km",
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            SizedBox(height: 12),

            // Brand and Details - CONSISTENT with HomePage implementation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Brand Image - Consistent with HomePage
                if (brandImage != null && !brandImage.contains('assets/'))
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CachedNetworkImage(
                      imageUrl: getImageUrl(brandImage, null),
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) => Icon(
                        Icons.business,
                        size: 16,
                        color: theme.iconTheme.color,
                      ),
                    ),
                  )
                else
                  SizedBox(width: 24),
                
                // Transmission - Consistent with HomePage
                if (_getTransmission() != null)
                  Row(
                    children: [
                      Icon(Icons.settings, size: 14, color: theme.iconTheme.color),
                      SizedBox(width: 4),
                      Text(
                        _getTransmission()!,
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    ],
                  ),
                
                // Location - Consistent with HomePage
                if (_getLocation() != null)
                  Flexible(
                    child: Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: theme.iconTheme.color),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            _getLocation()!,
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
    );
  }

  Widget _buildRemoveButton(ThemeData theme) {
    return Material(
      color: theme.cardColor,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: _isRemoving ? null : _removeItem,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: _isRemoving
              ? Padding(
                  padding: const EdgeInsets.all(6),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.redColor),
                  ),
                )
              : Icon(
                  Icons.favorite,
                  size: 18,
                  color: ColorGlobalVariables.redColor,
                ),
        ),
      ),
    );
  }

  // Helper methods to safely access item properties
  String _getImageUrl() {
    try {
      if (_itemData is Map) {
        final images = _itemData['images'] as List?;
        final firstImage = images?.isNotEmpty == true ? images!.first : null;
        return getImageUrl(firstImage ?? "${ImageStringGlobalVariables.imagePath}car_placeholder.png", null);
      }
      final images = _itemData?.images;
      final firstImage = images?.isNotEmpty == true ? images!.first : null;
      return getImageUrl(firstImage ?? "${ImageStringGlobalVariables.imagePath}car_placeholder.png", null);
    } catch (e) {
      return getImageUrl("${ImageStringGlobalVariables.imagePath}car_placeholder.png", null);
    }
  }

  String? _getBrandImage() {
    try {
      if (_itemData is Map) {
        return _itemData['brand']?['image'];
      }
      return _itemData?.brand?.image;
    } catch (e) {
      return null;
    }
  }

  String _getCategory() {
    try {
      if (_itemData is Map) {
        return _itemData['category']?['name'] ?? _itemData['buildType'] ?? 'Car';
      }
      return _itemData?.category?.name ?? _itemData?.buildType ?? 'Car';
    } catch (e) {
      return 'Car';
    }
  }

  String _getItemName() {
    try {
      if (_itemData is Map) {
        return _itemData['name'] ?? 'Unnamed Vehicle';
      }
      return _itemData?.name ?? 'Unnamed Vehicle';
    } catch (e) {
      return 'Unnamed Vehicle';
    }
  }

  String _getCondition() {
    try {
      if (_itemData is Map) {
        return _itemData['condition'] ?? 'Used';
      }
      return _itemData?.condition ?? 'Used';
    } catch (e) {
      return 'Used';
    }
  }

  String _getFormattedPrice() {
    try {
      if (_itemData is Map) {
        final price = _itemData['price'] ?? '0';
        return formatNumber(shortenerRequired: true, number: int.parse(price));
      }
      final price = _itemData?.price ?? '0';
      return formatNumber(shortenerRequired: true, number: int.parse(price));
    } catch (e) {
      return '0';
    }
  }

  String? _getMileage() {
    try {
      if (_itemData is Map) {
        return _itemData['mileage']?.toString();
      }
      return _itemData?.mileage?.toString();
    } catch (e) {
      return null;
    }
  }

  String? _getTransmission() {
    try {
      if (_itemData is Map) {
        return _itemData['transmission'];
      }
      return _itemData?.transmission;
    } catch (e) {
      return null;
    }
  }

  String? _getLocation() {
    try {
      if (_itemData is Map) {
        return _itemData['location'];
      }
      return _itemData?.location;
    } catch (e) {
      return null;
    }
  }
}

// List View Item Widget - Updated with consistent brand image handling
class _WishlistListItem extends StatefulWidget {
  final dynamic item;
  final int index;

  const _WishlistListItem({
    required this.item,
    required this.index,
  });

  @override
  State<_WishlistListItem> createState() => _WishlistListItemState();
}

class _WishlistListItemState extends State<_WishlistListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  
  bool _isRemoving = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  dynamic get _itemData {
    if (widget.item is Map && widget.item.containsKey('item')) {
      return widget.item['item'];
    }
    return widget.item;
  }

  String get _itemId {
    if (_itemData is Map) {
      return _itemData['id']?.toString() ?? '';
    }
    return _itemData?.id?.toString() ?? '';
  }

  Future<void> _removeItem() async {
    if (_isRemoving) return;
    
    setState(() => _isRemoving = true);
    _animationController.forward();

    try {
      final toggleProvider = context.read<WishlistToggleProvider>();
      final fetchProvider = context.read<WishlistFetchProvider>();
      
      final success = await toggleProvider.toggleWishlistItem(itemId: _itemId, context: context);

      if (success) {
        await Future.delayed(const Duration(milliseconds: 300));
        fetchProvider.removeItem(_itemId);
        
        _showRemovalSnackbar();
      } else {
        _animationController.reverse();
        _showErrorSnackbar();
      }
    } catch (e) {
      _animationController.reverse();
      _showErrorSnackbar(message: 'Error: $e');
    } finally {
      if (mounted) {
        setState(() => _isRemoving = false);
      }
    }
  }

  void _showRemovalSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text('Removed from wishlist'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorSnackbar({String message = 'Failed to remove item'}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _navigateToDetail() {
    Get.toNamed(
      RouteClass.getDetailPage(),
      arguments: {
        'product': _itemData is Map ? _itemData : _itemData.toJson(),
        'item': _itemData is Map ? _itemData : _itemData.toJson(),
        'type': 'wishlist',
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final theme = Theme.of(context);
    
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: child,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 160,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image Section
            SizedBox(
              width: 160,
              height: 160,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Container(
                      width: 160,
                      height: 160,
                      color: theme.brightness == Brightness.dark 
                          ? Colors.grey[800] 
                          : Colors.grey[100],
                      child: _buildImage(theme),
                    ),
                  ),
                  
                  // Remove Button
                  Positioned(
                    top: 8,
                    right: 8,
                    child: _buildRemoveButton(theme),
                  ),
                ],
              ),
            ),

            // Content Section - CONSISTENT with HomePage list view structure
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Header with Title and Category
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getItemName(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: theme.textTheme.titleLarge?.color,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2),
                        Text(
                          _getCategory(),
                          style: TextStyle(
                            fontSize: 11,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),

                    // Price and Condition - Consistent with HomePage
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${userProvider.user?.countryCurrencySymbol ?? ''} ${_getFormattedPrice()}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorGlobalVariables.redColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: theme.brightness == Brightness.dark 
                                ? Colors.grey[700] 
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            _getCondition(),
                            style: TextStyle(
                              fontSize: 10,
                              color: theme.textTheme.bodyMedium?.color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Details Row - Consistent with HomePage
                    Row(
                      children: [
                        if (_getMileage() != null)
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.speed, size: 12, color: theme.iconTheme.color),
                                SizedBox(width: 2),
                                Expanded(
                                  child: Text(
                                    "${formatNumber(shortenerRequired: true, number: int.parse(_getMileage()!))} km",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: theme.textTheme.bodyMedium?.color,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        
                        if (_getTransmission() != null)
                          SizedBox(width: 8),
                        
                        if (_getTransmission() != null)
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.settings, size: 12, color: theme.iconTheme.color),
                                SizedBox(width: 2),
                                Expanded(
                                  child: Text(
                                    _getTransmission()!,
                                    style: TextStyle(
                                      fontSize: 10,
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

                    // Location and Brand - Consistent with HomePage
                    Row(
                      children: [
                        if (_getLocation() != null)
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.location_on, size: 12, color: theme.iconTheme.color),
                                SizedBox(width: 2),
                                Expanded(
                                  child: Text(
                                    _getLocation()!,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: theme.textTheme.bodyMedium?.color,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        
                        // Brand Image - Consistent with HomePage
                        if (_getBrandImage() != null && !_getBrandImage()!.contains('assets/'))
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CachedNetworkImage(
                              imageUrl: getImageUrl(_getBrandImage()!, null),
                              fit: BoxFit.contain,
                              errorWidget: (context, url, error) => Icon(
                                Icons.business,
                                size: 14,
                                color: theme.iconTheme.color,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(ThemeData theme) {
    final imageUrl = _getImageUrl();
    
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) {
        return Shimmer.fromColors(
          baseColor: theme.brightness == Brightness.dark ? Colors.grey[700]! : Colors.grey[300]!,
          highlightColor: theme.brightness == Brightness.dark ? Colors.grey[600]! : Colors.grey[100]!,
          child: Container(color: theme.cardColor),
        );
      },
      errorWidget: (context, url, error) {
        return _buildImageErrorPlaceholder(theme);
      },
    );
  }

  Widget _buildImageErrorPlaceholder(ThemeData theme) {
    return Container(
      color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_not_supported, size: 24, color: theme.iconTheme.color),
            SizedBox(height: 2),
            Text(
              'No Image',
              style: TextStyle(
                fontSize: 9,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoveButton(ThemeData theme) {
    return Material(
      color: theme.cardColor,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: _isRemoving ? null : _removeItem,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: _isRemoving
              ? Padding(
                  padding: const EdgeInsets.all(6),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.redColor),
                  ),
                )
              : Icon(
                  Icons.favorite,
                  size: 18,
                  color: ColorGlobalVariables.redColor,
                ),
        ),
      ),
    );
  }

  // Helper methods to safely access item properties
  String _getImageUrl() {
    try {
      if (_itemData is Map) {
        final images = _itemData['images'] as List?;
        final firstImage = images?.isNotEmpty == true ? images!.first : null;
        return getImageUrl(firstImage ?? "${ImageStringGlobalVariables.imagePath}car_placeholder.png", null);
      }
      final images = _itemData?.images;
      final firstImage = images?.isNotEmpty == true ? images!.first : null;
      return getImageUrl(firstImage ?? "${ImageStringGlobalVariables.imagePath}car_placeholder.png", null);
    } catch (e) {
      return getImageUrl("${ImageStringGlobalVariables.imagePath}car_placeholder.png", null);
    }
  }

  String? _getBrandImage() {
    try {
      if (_itemData is Map) {
        return _itemData['brand']?['image'];
      }
      return _itemData?.brand?.image;
    } catch (e) {
      return null;
    }
  }

  String _getCategory() {
    try {
      if (_itemData is Map) {
        return _itemData['category']?['name'] ?? _itemData['buildType'] ?? 'Car';
      }
      return _itemData?.category?.name ?? _itemData?.buildType ?? 'Car';
    } catch (e) {
      return 'Car';
    }
  }

  String _getItemName() {
    try {
      if (_itemData is Map) {
        return _itemData['name'] ?? 'Unnamed Vehicle';
      }
      return _itemData?.name ?? 'Unnamed Vehicle';
    } catch (e) {
      return 'Unnamed Vehicle';
    }
  }

  String _getCondition() {
    try {
      if (_itemData is Map) {
        return _itemData['condition'] ?? 'Used';
      }
      return _itemData?.condition ?? 'Used';
    } catch (e) {
      return 'Used';
    }
  }

  String _getFormattedPrice() {
    try {
      if (_itemData is Map) {
        final price = _itemData['price'] ?? '0';
        return formatNumber(shortenerRequired: true, number: int.parse(price));
      }
      final price = _itemData?.price ?? '0';
      return formatNumber(shortenerRequired: true, number: int.parse(price));
    } catch (e) {
      return '0';
    }
  }

  String? _getMileage() {
    try {
      if (_itemData is Map) {
        return _itemData['mileage']?.toString();
      }
      return _itemData?.mileage?.toString();
    } catch (e) {
      return null;
    }
  }

  String? _getTransmission() {
    try {
      if (_itemData is Map) {
        return _itemData['transmission'];
      }
      return _itemData?.transmission;
    } catch (e) {
      return null;
    }
  }

  String? _getLocation() {
    try {
      if (_itemData is Map) {
        return _itemData['location'];
      }
      return _itemData?.location;
    } catch (e) {
      return null;
    }
  }
}