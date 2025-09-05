import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/myListingsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getMyListingsProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class MyListingPage extends StatefulWidget {
  const MyListingPage({super.key});

  @override
  State<MyListingPage> createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _loadMoreDebouncer;
  late MyListingsProvider _provider;
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    _provider = MyListingsProvider();
    _loadInitialData();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !_provider.isLoading &&
        _provider.hasMore) {
      
      _loadMoreDebouncer?.cancel();
      _loadMoreDebouncer = Timer(const Duration(milliseconds: 500), () {
        _provider.loadMoreListings();
      });
    }
  }

  Future<void> _loadInitialData() async {
    await _provider.loadInitialListings();
  }

  Future<void> _refreshListings() async {
    await _provider.refreshListings();
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
    final screenSize = MediaQuery.of(context).size;
    
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Scaffold(
        appBar: CustomAppbar(
          onLeadingIconClickFunction: () => Get.back(),
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back_ios,
          appbarBackgroundColor: ColorGlobalVariables.whiteColor,
          leadingIconDataColor: ColorGlobalVariables.fadedBlackColor,
          titleText: "My Listings",
          titleTextColor: ColorGlobalVariables.brownColor,
          centerTitle: true,
          actions: [
            const SizedBox(width: 5),
            Stack(
              children: [
                CustomRoundIconButton(
                  iconData: Icons.notifications,
                  iconSize: 18,
                  buttonSize: 35,
                  isBorderSlightlyCurved: false,
                  onIconButtonClickFunction: () {}
                ),
                Positioned(
                  right: 2,
                  top: 3,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 8,
                      minHeight: 8,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 5),
          ],
        ),
        body: SafeArea(
          child: Consumer<MyListingsProvider>(
            builder: (context, provider, child) {
              return Container(
                width: screenSize.width,
                height: screenSize.height,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                ),
                child: _buildContent(provider),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(MyListingsProvider provider) {
    if (provider.isInitialLoad && provider.isLoading) {
      return _buildLoadingState();
    }

    if (provider.error != null && provider.listings.isEmpty) {
      return _buildErrorState(provider);
    }

    return RefreshIndicator(
      onRefresh: _refreshListings,
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Header with item count
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Vehicles',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '${provider.loadedCount}${provider.totalCount > 0 ? '/${provider.totalCount}' : ''} items',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Grid View
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
                  final listing = provider.listings[index];
                  return _buildListingItem(listing);
                },
                childCount: provider.listings.length,
              ),
            ),
          ),

          // Loading More Indicator
          SliverToBoxAdapter(
            child: provider.isLoading
                ? _buildLoadMoreIndicator()
                : const SizedBox.shrink(),
          ),

          // No More Items Message
          SliverToBoxAdapter(
            child: !provider.hasMore && provider.listings.isNotEmpty
                ? _buildNoMoreItems()
                : const SizedBox.shrink(),
          ),

          // Empty State
          if (provider.listings.isEmpty && !provider.isLoading)
            SliverToBoxAdapter(
              child: _buildEmptyState(),
            ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading your listings...',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(MyListingsProvider provider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            provider.error ?? 'Failed to load listings',
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: provider.loadInitialListings,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.redColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Try Again', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadMoreIndicator() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
            ),
            const SizedBox(height: 8),
            Text(
              'Loading more...',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoMoreItems() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Text(
          'All listings loaded',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.car_repair, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No listings yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start by adding your first vehicle listing',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to create listing page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorGlobalVariables.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Add Listing', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListingItem(MyListing listing) {
    final price = _parseSafeDouble(listing.price) ?? 0;
    final mileage = _parseSafeDouble(listing.mileage) ?? 0;
    final condition = listing.condition?.toString() ?? "Used";
    final transmission = listing.transmission ?? "Manual";
    final location = listing.location.isNotEmpty ? listing.location : "Unknown";

    return GestureDetector(
      onTap: () {
        // Navigate to listing detail
        logger.w('item is clicked on');
                      Get.toNamed(
                        RouteClass.listingsDetailPage,
                        arguments: {
                          'listing': listing.toJson(),
                          'type': 'listing'
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
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    color: Colors.grey[100],
                  ),
                  child: _buildListingImage(listing),
                ),
                
                // Category Badge
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
                      _getCategoryName(listing.categoryId),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
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
                  // Title and Condition
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          listing.name.isNotEmpty ? listing.name : 'Unnamed Vehicle',
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
                        condition,
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
                        'GH₵ ${_formatNumber(price)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorGlobalVariables.redColor,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.speed, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            "${_formatNumber(mileage)} km",
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

                  // Transmission and Location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Transmission
                      Row(
                        children: [
                          Icon(Icons.settings, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            transmission,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      
                      // Location
                      Flexible(
                        child: Row(
                          children: [
                            Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                location,
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

  Widget _buildListingImage(MyListing listing) {
    if (listing.images.isEmpty) {
      return _buildImageErrorPlaceholder();
    }

    final imageUrl = listing.images.first;
    if (imageUrl.isEmpty) {
      return _buildImageErrorPlaceholder();
    }

    try {
      final fullImageUrl = getImageUrl(imageUrl, null);
      
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: CachedNetworkImage(
          imageUrl: fullImageUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.redColor),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return _buildImageErrorPlaceholder();
          },
        ),
      );
    } catch (e) {
      return _buildImageErrorPlaceholder();
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

  // Helper methods for safe parsing and formatting
  double? _parseSafeDouble(String? value) {
    if (value == null || value.isEmpty) return null;
    try {
      final parsed = double.tryParse(value);
      return parsed?.isFinite == true ? parsed : null;
    } catch (e) {
      return null;
    }
  }

  String _formatNumber(double number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toStringAsFixed(0);
  }

  String _getCategoryName(int categoryId) {
    switch (categoryId) {
      case 1:
        return 'Car';
      case 2:
        return 'Motorcycle';
      case 4:
        return 'Truck';
      default:
        return 'Vehicle';
    }
  }
}