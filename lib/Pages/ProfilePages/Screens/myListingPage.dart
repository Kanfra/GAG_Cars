import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/myListingsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getMyListingsProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:get/get.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';

class MyListingPage extends StatefulWidget {
  const MyListingPage({super.key});

  @override
  State<MyListingPage> createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  Timer? _loadMoreDebouncer;
  late MyListingsProvider _provider;
  final logger = Logger();
  bool _isFirstLoad = true;
  
  // Tab controller and state variables
  late TabController _tabController;
  List<MyListing> _liveListings = [];
  List<MyListing> _soldListings = [];
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _provider = MyListingsProvider();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _loadInitialData();
    _scrollController.addListener(_scrollListener);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh data when page becomes visible again
    if (!_isFirstLoad) {
      _refreshListings();
    }
    _isFirstLoad = false;
  }

  void _scrollListener() {
    final pixels = _scrollController.position.pixels;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final shouldLoad = (pixels >= maxScroll - 200) && 
                    !_provider.isLoading && 
                    _provider.hasMore && 
                    _currentTabIndex == 0;

    print('📜 Scroll Debug:');
    print('   Position: $pixels / $maxScroll');
    print('   Should load: $shouldLoad');
    print('   isLoading: ${_provider.isLoading}');
    print('   hasMore: ${_provider.hasMore}');
    print('   Current tab: $_currentTabIndex');
    
    if (shouldLoad) {
      _loadMoreDebouncer?.cancel();
      _loadMoreDebouncer = Timer(const Duration(milliseconds: 300), () {
        _provider.loadMoreListings();
      });
    }
  }

  Future<void> _loadInitialData() async {
    await _provider.loadInitialListings();
  }

  Future<void> _loadMoreData() async {
    if (!_provider.isLoading && _provider.hasMore && _currentTabIndex == 0) {
      await _provider.loadMoreListings();
    }
  }

  Future<void> _refreshListings() async {
    await _provider.refreshListings();
  }

  // Separate listings into live and sold
  void _separateListings(List<MyListing> allListings) {
    _liveListings = allListings.where((listing) => listing.status != 'sold').toList();
    _soldListings = allListings.where((listing) => listing.status == 'sold').toList();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _loadMoreDebouncer?.cancel();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Scaffold(
        backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
        appBar: AppBar(
          backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios, 
              color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor, 
              size: 20
            ),
            onPressed: (){
              Get.offAllNamed(
                RouteClass.getMainBottomNavigationPage(),
                arguments: {
                  'selected_tab_index': 4,
                }
              );
            },
          ),
          title: Text(
            "My Listings",
            style: TextStyle(
              color: isDarkMode ? Colors.white : ColorGlobalVariables.brownColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none, 
                      color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor, 
                      size: 24
                    ),
                    onPressed: () {
                      Get.toNamed(
                        RouteClass.getNotificationsPage(),
                      );
                    },
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              color: isDarkMode ? const Color(0xFF424242) : Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDarkMode ? Colors.grey[700]! : Colors.grey[200]!
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorGlobalVariables.brownColor,
                          ColorGlobalVariables.brownColor.withOpacity(0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: ColorGlobalVariables.brownColor.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: isDarkMode ? Colors.white70 : Colors.grey[600],
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.local_offer_outlined, size: 18),
                            const SizedBox(width: 6),
                            const Text('Live'),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.verified_outlined, size: 18),
                            const SizedBox(width: 6),
                            const Text('Sold'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Consumer<MyListingsProvider>(
            builder: (context, provider, child) {
              // Separate listings whenever provider data changes
              if (provider.listings.isNotEmpty && (_liveListings.isEmpty && _soldListings.isEmpty)) {
                _separateListings(provider.listings);
              }

              return Container(
                width: screenSize.width,
                height: screenSize.height,
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
                ),
                child: Column(
                  children: [
                    // Tab Bar Stats
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      color: isDarkMode ? const Color(0xFF424242) : Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem(_liveListings.length, 'Active', Colors.blue, isDarkMode),
                          _buildStatItem(_soldListings.length, 'Sold', Colors.green, isDarkMode),
                          _buildStatItem(_liveListings.length + _soldListings.length, 'Total', ColorGlobalVariables.brownColor, isDarkMode),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 1),
                    
                    // Tab Content
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Live Tab
                          _buildTabContent(_liveListings, provider, isLiveTab: true, isDarkMode: isDarkMode),
                          
                          // Sold Tab
                          _buildTabContent(_soldListings, provider, isLiveTab: false, isDarkMode: isDarkMode),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(int count, String label, Color color, bool isDarkMode) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent(List<MyListing> listings, MyListingsProvider provider, {required bool isLiveTab, required bool isDarkMode}) {
    if (provider.isInitialLoad && provider.isLoading) {
      return _buildLoadingState(isDarkMode);
    }

    if (provider.error != null && listings.isEmpty) {
      return _buildErrorState(provider, isDarkMode);
    }

    return isLiveTab 
      ? RefreshIndicator(
          onRefresh: _refreshListings,
          child: _buildListView(listings, provider, isLiveTab: isLiveTab, isDarkMode: isDarkMode),
        )
      : _buildListView(listings, provider, isLiveTab: isLiveTab, isDarkMode: isDarkMode);
  }

  Widget _buildListView(List<MyListing> listings, MyListingsProvider provider, {required bool isLiveTab, required bool isDarkMode}) {
    return CustomScrollView(
      controller: isLiveTab ? _scrollController : null,
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
                  isLiveTab ? 'My Vehicles' : 'Sold Vehicles',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  '${listings.length}${isLiveTab && provider.totalCount > 0 ? '/${provider.totalCount}' : ''} items',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Grid View
        if (listings.isNotEmpty)
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
                  final listing = listings[index];
                  return _buildListingItem(listing, isLiveTab: isLiveTab, isDarkMode: isDarkMode);
                },
                childCount: listings.length,
              ),
            ),
          ),

        // Loading More Indicator (only for Live tab)
        if (isLiveTab && provider.isLoading && provider.hasMore)
          SliverToBoxAdapter(
            child: _buildLoadMoreIndicator(isDarkMode),
          ),

        // No More Items Message (only for Live tab)
        if (isLiveTab && !provider.hasMore && listings.isNotEmpty)
          SliverToBoxAdapter(
            child: _buildNoMoreItems(isDarkMode),
          ),

        // Empty State
        if (listings.isEmpty && !provider.isLoading)
          SliverToBoxAdapter(
            child: _buildEmptyState(isLiveTab: isLiveTab, isDarkMode: isDarkMode),
          ),
      ],
    );
  }

  Widget _buildLoadingState(bool isDarkMode) {
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
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(MyListingsProvider provider, bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: isDarkMode ? Colors.grey[500] : Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            provider.error ?? 'Failed to load listings',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600], 
              fontSize: 16
            ),
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

  Widget _buildLoadMoreIndicator(bool isDarkMode) {
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
              'Loading more listings...',
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoMoreItems(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Text(
          'All listings loaded',
          style: TextStyle(
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState({required bool isLiveTab, required bool isDarkMode}) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.car_repair, 
              size: 64, 
              color: isDarkMode ? Colors.grey[500] : Colors.grey[400]
            ),
            const SizedBox(height: 16),
            Text(
              isLiveTab ? 'No listings yet' : 'No sold items',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isLiveTab 
                ? 'Start by adding your first vehicle listing'
                : 'Items you mark as sold will appear here',
              style: TextStyle(
                color: isDarkMode ? Colors.white60 : Colors.grey[500],
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            if (isLiveTab) const SizedBox(height: 20),
            if (isLiveTab)
              ElevatedButton(
                onPressed: () {
                 Get.offAllNamed(
                RouteClass.getMainBottomNavigationPage(),
                arguments: {
                  'selected_tab_index': 2,
                }
              );
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

  Widget _buildListingItem(MyListing listing, {required bool isLiveTab, required bool isDarkMode}) {
    final price = _parseSafeDouble(listing.price) ?? 0;
    final mileage = _parseSafeDouble(listing.mileage) ?? 0;
    final condition = listing.condition?.toString() ?? "Used";
    final transmission = listing.transmission ?? "Manual";
    final location = listing.location.isNotEmpty ? listing.location : "Unknown";
    final isPromoted = listing.isPromoted == true;
    
    // Get category name directly from the category object
    final categoryName = _getCategoryDisplayName(listing.category?.name ?? 'Vehicle');

    return GestureDetector(
      onTap: () {
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
          color: isDarkMode ? const Color(0xFF424242) : Colors.white,
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
                    color: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                  ),
                  child: _buildListingImage(listing, isDarkMode),
                ),
                
                // Category Badge - NOW USING ACTUAL CATEGORY NAME FROM API
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
                      categoryName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                // Sold Badge for sold items
                if (!isLiveTab)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'SOLD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                // Promoted Badge for promoted items (only on live tab)
                if (isPromoted && isLiveTab)
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
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isLiveTab 
                              ? (isDarkMode ? Colors.white : Colors.black87)
                              : (isDarkMode ? Colors.white60 : Colors.grey[600]),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        condition,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkMode ? Colors.white60 : Colors.grey[600],
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
                          color: isLiveTab 
                            ? ColorGlobalVariables.redColor 
                            : (isDarkMode ? Colors.white60 : Colors.grey[600]),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.speed, 
                            size: 14, 
                            color: isDarkMode ? Colors.white60 : Colors.grey[600]
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${_formatNumber(mileage)} km",
                            style: TextStyle(
                              fontSize: 12,
                              color: isDarkMode ? Colors.white60 : Colors.grey[600],
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
                          Icon(
                            Icons.settings, 
                            size: 14, 
                            color: isDarkMode ? Colors.white60 : Colors.grey[600]
                          ),
                          const SizedBox(width: 4),
                          Text(
                            transmission,
                            style: TextStyle(
                              fontSize: 11,
                              color: isDarkMode ? Colors.white60 : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      
                      // Location
                      Flexible(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on, 
                              size: 14, 
                              color: isDarkMode ? Colors.white60 : Colors.grey[600]
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                location,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: isDarkMode ? Colors.white60 : Colors.grey[600],
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

  Widget _buildListingImage(MyListing listing, bool isDarkMode) {
    if (listing.images.isEmpty) {
      return _buildImageErrorPlaceholder(isDarkMode);
    }

    final imageUrl = listing.images.first;
    if (imageUrl.isEmpty) {
      return _buildImageErrorPlaceholder(isDarkMode);
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
            return _buildImageErrorPlaceholder(isDarkMode);
          },
        ),
      );
    } catch (e) {
      return _buildImageErrorPlaceholder(isDarkMode);
    }
  }

  Widget _buildImageErrorPlaceholder(bool isDarkMode) {
    return Container(
      color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported, 
              size: 32, 
              color: isDarkMode ? Colors.grey[500] : Colors.grey[400]
            ),
            const SizedBox(height: 4),
            Text(
              'No Image',
              style: TextStyle(
                fontSize: 10,
                color: isDarkMode ? Colors.grey[400] : Colors.grey[500],
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

  // NEW: Get category display name from the actual category object
  String _getCategoryDisplayName(String categoryName) {
    // You can customize the display name if needed
    // For example, shorten "Parts & accessories" to "Parts"
    // if (categoryName == "Parts & accessories") {
    //   return "Parts";
    // }
    return categoryName;
  }
}