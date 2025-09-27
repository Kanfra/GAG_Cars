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
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppbar(
      onLeadingIconClickFunction: () => Get.back(),
      isLeadingWidgetExist: true,
      leadingIconData: Icons.arrow_back_ios_new,
      appbarBackgroundColor: Colors.white,
      leadingIconDataColor: ColorGlobalVariables.fadedBlackColor,
      titleText: "My Wishlist",
      titleTextColor: ColorGlobalVariables.redColor,
      centerTitle: true,
      actions: [
        const SizedBox(width: 8),
        _buildNotificationButton(),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _buildNotificationButton() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomRoundIconButton(
          iconData: Icons.notifications_outlined,
          iconSize: 20,
          buttonSize: 40,
          isBorderSlightlyCurved: true,
          onIconButtonClickFunction: () => _handleNotificationTap(),
          backgroundColor: Colors.grey[50],
          iconDataColor: Colors.grey[700],
        ),
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
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

  Widget _buildBody() {
    return SafeArea(
      child: Consumer<WishlistFetchProvider>(
        builder: (context, provider, _) {
          return RefreshIndicator.adaptive(
            onRefresh: _onRefresh,
            color: ColorGlobalVariables.redColor,
            backgroundColor: Colors.white,
            displacement: 40,
            strokeWidth: 2.5,
            child: CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                _buildHeaderSliver(provider),
                if (provider.isLoading && provider.wishlistItems.isEmpty)
                  _buildLoadingSliver()
                else if (provider.errorMessage.isNotEmpty && provider.wishlistItems.isEmpty)
                  _buildErrorSliver(provider)
                else if (provider.wishlistItems.isEmpty)
                  _buildEmptySliver()
                else
                  _buildContentSliver(provider),
                if (provider.isLoadingMore) _buildLoadingMoreSliver(),
                if (!provider.hasMore && provider.wishlistItems.isNotEmpty)
                  _buildEndSliver(),
              ],
            ),
          );
        },
      ),
    );
  }

  SliverToBoxAdapter _buildHeaderSliver(WishlistFetchProvider provider) {
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
                    color: Colors.grey[900],
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${provider.totalItems} saved items',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            _buildViewToggleButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildViewToggleButtons() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildViewButton(Icons.grid_view, true),
          _buildViewButton(Icons.list, false),
        ],
      ),
    );
  }

  Widget _buildViewButton(IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isActive ? ColorGlobalVariables.redColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        size: 18,
        color: isActive ? Colors.white : Colors.grey[600],
      ),
    );
  }

  SliverFillRemaining _buildLoadingSliver() {
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
                color: Colors.grey[600],
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

  SliverFillRemaining _buildErrorSliver(WishlistFetchProvider provider) {
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 20),
            Text(
              'Unable to Load Wishlist',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              provider.errorMessage.isNotEmpty ? provider.errorMessage : 'An unknown error occurred',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            _buildRetryButton(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildRetryButton(WishlistFetchProvider provider) {
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

  SliverFillRemaining _buildEmptySliver() {
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
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                size: 50,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No Items in Wishlist',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Start saving your favorite vehicles and\nwe\'ll keep them here for you',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 28),
            _buildBrowseButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBrowseButton() {
    return ElevatedButton(
      onPressed: () => Get.offAllNamed(RouteClass.mainBottomNavigationPage),
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorGlobalVariables.redColor,
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

  SliverPadding _buildContentSliver(WishlistFetchProvider provider) {
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
            return _WishlistItemCard(
              item: item,
              index: index,
            );
          },
          childCount: provider.wishlistItems.length,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildLoadingMoreSliver() {
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
                  valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.redColor),
                ),
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
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildEndSliver() {
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
                  color: Colors.grey[600],
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

class _WishlistItemCard extends StatefulWidget {
  final dynamic item;
  final int index;

  const _WishlistItemCard({
    required this.item,
    required this.index,
  });

  @override
  State<_WishlistItemCard> createState() => _WishlistItemCardState();
}

class _WishlistItemCardState extends State<_WishlistItemCard>
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

  // FIX: Handle both item structures (direct map or nested item)
  dynamic get _itemData {
    // If item has an 'item' property, use that (nested structure)
    if (widget.item is Map && widget.item.containsKey('item')) {
      return widget.item['item'];
    }
    // Otherwise use the item directly (flat structure)
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
      child: _buildCardContent(),
    );
  }

  Widget _buildCardContent() {
    final imageUrl = _getImageUrl();
    final brandImage = _getBrandImage();

    return Card(
      elevation: 2,
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
                _buildImageSection(imageUrl),
                
                // Content Section
                _buildContentSection(brandImage),
              ],
            ),
            
            // Remove Button
            Positioned(
              top: 8,
              right: 8,
              child: _buildRemoveButton(),
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

  Widget _buildImageSection(String imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Container(
        height: 120,
        width: double.infinity,
        color: Colors.grey[100],
        child: Stack(
          children: [
            _buildImage(imageUrl),
            _buildImageOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      progressIndicatorBuilder: (context, url, progress) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(color: Colors.white),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image_not_supported, color: Colors.grey[400], size: 32),
              const SizedBox(height: 4),
              Text('No Image', style: TextStyle(color: Colors.grey[500], fontSize: 10)),
            ],
          ),
        );
      },
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

  Widget _buildContentSection(dynamic brandImage) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitleSection(),
            _buildPriceSection(),
            _buildDetailsSection(brandImage),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _getItemName(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          _getCondition(),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GH₵ ${_getFormattedPrice()}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorGlobalVariables.redColor,
          ),
        ),
        if (_getMileage() != null) ...[
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.speed, size: 12, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                "${formatNumber(shortenerRequired: true, number: int.parse(_getMileage()!))} km",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildDetailsSection(dynamic brandImage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (brandImage != null) _buildBrandImage(brandImage),
        const Spacer(),
        if (_getTransmission() != null) _buildTransmission(),
        if (_getLocation() != null) _buildLocation(),
      ],
    );
  }

  Widget _buildBrandImage(String brandImage) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[100],
      ),
      child: CachedNetworkImage(
        imageUrl: getImageUrl(brandImage, null),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTransmission() {
    return Row(
      children: [
        Icon(Icons.settings, size: 12, color: Colors.grey[600]),
        const SizedBox(width: 2),
        Text(
          _getTransmission()!,
          style: TextStyle(fontSize: 10, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildLocation() {
    return Flexible(
      child: Row(
        children: [
          Icon(Icons.location_on, size: 12, color: Colors.grey[600]),
          const SizedBox(width: 2),
          Flexible(
            child: Text(
              _getLocation()!,
              style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRemoveButton() {
    return Material(
      color: Colors.white,
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
              ? const Padding(
                  padding: EdgeInsets.all(6),
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(
                  Icons.favorite,
                  size: 18,
                  color: Colors.red,
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