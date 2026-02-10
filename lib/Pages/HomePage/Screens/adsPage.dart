import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/userListingsModel.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getUserListingsProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:get/get.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';

class AdsPage extends StatefulWidget {
  final Map<String, dynamic> allJson;

  const AdsPage({
    super.key,
    required this.allJson,
  });

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _loadMoreDebouncer;
  String _viewType = 'grid'; // 'grid' or 'list'

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  void _scrollListener() {
    final provider = Provider.of<UserListingsProvider>(context, listen: false);
    
    // Load more functionality
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !provider.isLoadingMore &&
        provider.hasMore) {
      
      _loadMoreDebouncer?.cancel();
      _loadMoreDebouncer = Timer(const Duration(milliseconds: 300), () {
        provider.loadMoreListings();
      });
    }
  }

  Future<void> _loadData() async {
    final provider = Provider.of<UserListingsProvider>(context, listen: false);
    await provider.loadInitialListings(widget.allJson['user']['id']);
  }

  Future<void> _onRefresh() async {
    await _loadData();
  }

  void _toggleView(String viewType) {
    setState(() {
      _viewType = viewType;
    });
  }

  void _navigateToDetailPage(Listing listing) {
    final logger = Logger();
    logger.e('phone number: ${widget.allJson['user']['phone']}');
    Get.toNamed(
      RouteClass.getAdsDetailPage(), 
      arguments: {
        'user': widget.allJson['user'],
        'phoneNumber': widget.allJson['phoneNumber'],
        'listing': listing,
        'type': 'adsDetailPage',
      },
    );
  }

  // Helper method to format price with commas
  String _formatPriceWithCommas(String priceString) {
    try {
      final int price = int.parse(priceString);
      final String priceStr = price.toString();
      final StringBuffer formattedPrice = StringBuffer();
      
      for (int i = 0; i < priceStr.length; i++) {
        if (i > 0 && (priceStr.length - i) % 3 == 0) {
          formattedPrice.write(',');
        }
        formattedPrice.write(priceStr[i]);
      }
      
      return formattedPrice.toString();
    } catch (e) {
      return priceString;
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
    final theme = Theme.of(context);
    final userListingsProvider = Provider.of<UserListingsProvider>(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: theme.iconTheme.color),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "${widget.allJson['user']['name']} Listings",
          style: TextStyle(
            color: theme.appBarTheme.foregroundColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // View Toggle Buttons
          Row(
            children: [
              // List View Button
              Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: _viewType == 'list' 
                      ? ColorGlobalVariables.brownColor 
                      : theme.cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(Icons.list, size: 20),
                  color: _viewType == 'list' ? Colors.white : theme.iconTheme.color,
                  onPressed: () => _toggleView('list'),
                ),
              ),
              // Grid View Button
              Container(
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: _viewType == 'grid' 
                      ? ColorGlobalVariables.brownColor 
                      : theme.cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(Icons.grid_view, size: 20),
                  color: _viewType == 'grid' ? Colors.white : theme.iconTheme.color,
                  onPressed: () => _toggleView('grid'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: userListingsProvider.isLoading 
            ? _buildLoadingState(theme)
            : userListingsProvider.hasError 
                ? _buildErrorState(userListingsProvider, theme)
                : RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: _buildContent(userListingsProvider, theme),
                  ),
      ),
    );
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
          ),
          SizedBox(height: 16),
          Text(
            'Loading your listings...',
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(UserListingsProvider provider, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: theme.iconTheme.color),
          SizedBox(height: 16),
          Text(
            provider.errorMessage,
            style: TextStyle(color: theme.textTheme.bodyMedium?.color, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => provider.loadInitialListings(widget.allJson['user']['id']),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.brownColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text('Try Again', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(UserListingsProvider provider, ThemeData theme) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        // Empty State
        if (!provider.hasListings && !provider.isLoading)
          SliverFillRemaining(
            child: _buildEmptyState(theme),
          )
        else
          // Listings Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.allJson['user']['name']} Listings (${provider.totalCount})',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  if (provider.hasListings)
                    Text(
                      'Showing ${provider.displayedCount} of ${provider.totalCount}',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                ],
              ),
            ),
          ),

        // Listings based on selected view
        if (provider.hasListings)
          if (_viewType == 'grid')
            _buildListingsGrid(provider, theme)
          else
            _buildListingsList(provider, theme),

        // Loading More Indicator
        SliverToBoxAdapter(
          child: provider.isLoadingMore
              ? Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Loading more listings...',
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ),

        // No More Items Message
        SliverToBoxAdapter(
          child: !provider.hasMore && provider.hasListings
              ? Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Text(
                      'All listings loaded',
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.car_rental_outlined,
          size: 80,
          color: theme.iconTheme.color?.withOpacity(0.5),
        ),
        SizedBox(height: 16),
        Text(
          'No Listings Yet',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.titleLarge?.color,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Start by creating your first car listing',
          style: TextStyle(
            fontSize: 14,
            color: theme.textTheme.bodyMedium?.color,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/create-listing');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorGlobalVariables.brownColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(
            'Create Listing',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildListingsGrid(UserListingsProvider provider, ThemeData theme) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.72,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final listing = provider.listings[index];
            return _ListingItemGridWidget(
              listing: listing,
              onTap: () => _navigateToDetailPage(listing),
            );
          },
          childCount: provider.listings.length,
        ),
      ),
    );
  }

  Widget _buildListingsList(UserListingsProvider provider, ThemeData theme) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final listing = provider.listings[index];
          return _ListingItemListWidget(
            listing: listing,
            onTap: () => _navigateToDetailPage(listing),
          );
        },
        childCount: provider.listings.length,
      ),
    );
  }
}

// Grid View Widget for Listings
class _ListingItemGridWidget extends StatelessWidget {
  final Listing listing;
  final VoidCallback onTap;

  const _ListingItemGridWidget({
    required this.listing,
    required this.onTap,
  });

  // Helper method to format price with commas
  String _formatPriceWithCommas(String priceString) {
    try {
      final int price = int.parse(priceString);
      final String priceStr = price.toString();
      final StringBuffer formattedPrice = StringBuffer();
      
      for (int i = 0; i < priceStr.length; i++) {
        if (i > 0 && (priceStr.length - i) % 3 == 0) {
          formattedPrice.write(',');
        }
        formattedPrice.write(priceStr[i]);
      }
      
      return formattedPrice.toString();
    } catch (e) {
      return priceString;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final theme = Theme.of(context);
    // FIXED: Null-safe image handling
    final firstImage = listing.images?.isNotEmpty == true ? listing.images!.first : null;
    // FIXED: Null-safe boolean
    final isPromoted = listing.isPromoted ?? false;

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    color: theme.brightness == Brightness.dark 
                        ? Colors.grey[800] 
                        : Colors.grey[100],
                    child: _buildListingImage(firstImage, theme),
                  ),
                ),
                
                // Status Badge
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      listing.category?.name ?? 'Category',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                // Promoted Badge
                if (isPromoted)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.amber[700],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 12),
                          SizedBox(width: 2),
                          Text(
                            'PROMOTED',
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
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Category
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Tooltip(
                          message: listing.name ?? 'No Name',
                          preferBelow: false,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          textStyle: TextStyle(
                            color: theme.textTheme.titleLarge?.color,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text(
                            // FIXED: Null-safe name
                            listing.name ?? 'No Name',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: theme.textTheme.titleLarge?.color,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(width: 5), // 5px spacing between name and category
                      Text(
                        // FIXED: Null-safe category name
                        listing.category?.name ?? 'No Category',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 5), // 5px spacing between name and category

                  // Price with Tooltip
                  Tooltip(
                    message: '${userProvider.user?.countryCurrencySymbol ?? ''} ${_formatPriceWithCommas(listing.price ?? '0')}',
                    preferBelow: false,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    textStyle: TextStyle(
                      color: theme.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text(
                      '${userProvider.user?.countryCurrencySymbol ?? ''} ${_formatPriceWithCommas(listing.price ?? '0')}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorGlobalVariables.redColor,
                      ),
<<<<<<< Updated upstream
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 20, color: theme.iconTheme.color),
                          SizedBox(width: 8),
                          Text(
                            // FIXED: Null-safe year
                            listing.year ?? 'No Year',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                          ),
                        ],
                      ),
                    ],
=======
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
>>>>>>> Stashed changes
                  ),

                  SizedBox(height: 10), // Reduced from 12 to 10

                  // Location with Tooltip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.location_on, size: 14, color: theme.iconTheme.color),
                            SizedBox(width: 4),
                            Expanded(
                              child: Tooltip(
                                message: listing.location ?? 'No Location',
                                preferBelow: false,
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: theme.cardColor,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                textStyle: TextStyle(
                                  color: theme.textTheme.titleLarge?.color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                child: Text(
                                  // FIXED: Null-safe location
                                  listing.location ?? 'No Location',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: theme.textTheme.bodyMedium?.color,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6), // Reduced from 8 to 6

                  // Created Date
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 12, color: theme.iconTheme.color),
                      SizedBox(width: 4),
                      Text(
                        // FIXED: Null-safe date
                        'Posted ${_formatDate(listing.createdAt ?? DateTime.now())}',
                        style: TextStyle(
                          fontSize: 10,
                          color: theme.textTheme.bodySmall?.color,
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

  Widget _buildListingImage(String? imageUrl, ThemeData theme) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
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
    } else {
      return _buildImageErrorPlaceholder(theme);
    }
  }

  Widget _buildImageErrorPlaceholder(ThemeData theme) {
    return Container(
      color: theme.brightness == Brightness.dark 
          ? Colors.grey[800] 
          : Colors.grey[200],
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

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else {
      return '${(difference.inDays / 30).floor()} months ago';
    }
  }
}

// List View Widget for Listings
class _ListingItemListWidget extends StatelessWidget {
  final Listing listing;
  final VoidCallback onTap;

  const _ListingItemListWidget({
    required this.listing,
    required this.onTap,
  });

  // Helper method to format price with commas
  String _formatPriceWithCommas(String priceString) {
    try {
      final int price = int.parse(priceString);
      final String priceStr = price.toString();
      final StringBuffer formattedPrice = StringBuffer();
      
      for (int i = 0; i < priceStr.length; i++) {
        if (i > 0 && (priceStr.length - i) % 3 == 0) {
          formattedPrice.write(',');
        }
        formattedPrice.write(priceStr[i]);
      }
      
      return formattedPrice.toString();
    } catch (e) {
      return priceString;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final theme = Theme.of(context);
    // FIXED: Null-safe image handling
    final firstImage = listing.images?.isNotEmpty == true ? listing.images!.first : null;
    // FIXED: Null-safe boolean
    final isPromoted = listing.isPromoted ?? false;

    return GestureDetector(
      onTap: onTap,
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
                      child: _buildListingImage(firstImage, theme),
                    ),
                  ),
                  
                  if (isPromoted)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.amber[700],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 12),
                            SizedBox(width: 2),
                            Text(
                              'PROMOTED',
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
                ],
              ),
            ),

            // Content Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Header with Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Tooltip(
                            message: listing.name ?? 'No Name',
                            preferBelow: false,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            textStyle: TextStyle(
                              color: theme.textTheme.titleLarge?.color,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            child: Text(
                              // FIXED: Null-safe name
                              listing.name ?? 'No Name',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: theme.textTheme.titleLarge?.color,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          // FIXED: Null-safe category name
                          listing.category?.name ?? 'No Category',
                          style: TextStyle(
                            fontSize: 11,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5), // 5px spacing between name and category

                    // Price with Tooltip
                    Tooltip(
                      message: '${userProvider.user?.countryCurrencySymbol ?? ''} ${_formatPriceWithCommas(listing.price ?? '0')}',
                      preferBelow: false,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      textStyle: TextStyle(
                        color: theme.textTheme.titleLarge?.color,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text(
                        '${userProvider.user?.countryCurrencySymbol ?? ''} ${_formatPriceWithCommas(listing.price ?? '0')}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorGlobalVariables.redColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    SizedBox(height: 6),

                    // Location with Tooltip
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.location_on, size: 12, color: theme.iconTheme.color),
                              SizedBox(width: 4), // 4px spacing between icon and text
                              Expanded(
                                child: Tooltip(
                                  message: listing.location ?? 'No Location',
                                  preferBelow: false,
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: theme.cardColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  textStyle: TextStyle(
                                    color: theme.textTheme.titleLarge?.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  child: Text(
                                    // FIXED: Null-safe location
                                    listing.location ?? 'No Location',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: theme.textTheme.bodyMedium?.color,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 4),

                    // Created Date
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 12, color: theme.iconTheme.color),
                        SizedBox(width: 4),
                        Text(
                          // FIXED: Null-safe date
                          _formatDate(listing.createdAt ?? DateTime.now()),
                          style: TextStyle(
                            fontSize: 10,
                            color: theme.textTheme.bodySmall?.color,
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

  Widget _buildListingImage(String? imageUrl, ThemeData theme) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      final String fullImageUrl = getImageUrl(imageUrl, null);
      
      return CachedNetworkImage(
        imageUrl: fullImageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Container(
            color: theme.brightness == Brightness.dark 
                ? Colors.grey[800] 
                : Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return _buildImageErrorPlaceholder(theme);
        },
      );
    } else {
      return _buildImageErrorPlaceholder(theme);
    }
  }

  Widget _buildImageErrorPlaceholder(ThemeData theme) {
    return Container(
      color: theme.brightness == Brightness.dark 
          ? Colors.grey[800] 
          : Colors.grey[200],
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

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else {
      return '${(difference.inDays / 30).floor()} months ago';
    }
  }
}