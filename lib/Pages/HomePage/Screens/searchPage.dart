import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/searchProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/filterBottomSheetContent.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/distanceUtils.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Import your custom components
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/searchItemModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Clear any previous search when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final searchProvider = Provider.of<SearchProvider>(context, listen: false);
      searchProvider.clearSearch();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(),

          // Content Area
          Expanded(
            child: Consumer<SearchProvider>(
              builder: (context, searchProvider, child) {
                return _buildContent(searchProvider);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Icon(Icons.search, color: Colors.grey[600], size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Search cars, brands, models...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(fontSize: 16),
                onChanged: (value) {
                  final searchProvider = Provider.of<SearchProvider>(context, listen: false);
                  if (value.length >= 2) {
                    searchProvider.searchWithDebounce(value);
                  } else if (value.isEmpty) {
                    searchProvider.clearSearch();
                  }
                },
              ),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.sliders, color: Colors.grey[600], size: 16),
              onPressed: () {
                // Show filter bottom sheet
                showFilterBottomSheet(
                  context: context,
                  widget: FilterBottomSheetContent(
                    priceRange: const SfRangeValues(700, 2000),
                    onPriceRangeChanged: (newRange) {},
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(SearchProvider searchProvider) {
    if (searchProvider.isLoading) {
      return _buildLoadingState();
    }

    if (searchProvider.hasError) {
      return _buildErrorState(searchProvider);
    }

    if (searchProvider.currentQuery.isNotEmpty) {
      if (searchProvider.hasResults) {
        return _buildSearchResults(searchProvider);
      } else {
        return _buildNoResultsState();
      }
    }

    return _buildInitialState();
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Searching...',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(SearchProvider searchProvider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            searchProvider.errorMessage,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: searchProvider.retrySearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.brownColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Try Again', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResultsState() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/search_not_found.json',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            const Text(
              'No Results Found',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Try different keywords or check your spelling',
              style: TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Search for vehicles',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Find cars, brands, and models',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(SearchProvider searchProvider) {
    return Column(
      children: [
        // Results count
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${searchProvider.searchResults.length} results found',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  searchProvider.clearSearch();
                  _searchController.clear();
                },
                child: Text(
                  'Clear',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorGlobalVariables.redColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Grid view
        Expanded(
          child: GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemCount: searchProvider.searchResults.length,
            itemBuilder: (context, index) {
              final item = searchProvider.searchResults[index];
              return _SearchItemCard(item: item);
            },
          ),
        ),
      ],
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
}

class _SearchItemCard extends StatelessWidget {
  final SearchItem item;

  const _SearchItemCard({required this.item});

  // Helper method to format price with commas - moved to widget class
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
    final firstImage = item.images?.isNotEmpty == true ? item.images!.first : null;
    final userProvider = Provider.of<UserProvider>(context);

    return GestureDetector(
      onTap: () {
        // Navigate to detail page
        print('Tapped on: ${item.name}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Container(
                height: 120,
                width: double.infinity,
                color: Colors.grey[100],
                child: _buildItemImage(firstImage),
              ),
            ),

            // Content section - Enhanced with tooltips and improved layout
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Condition - Enhanced with tooltip and spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Tooltip(
                          message: item.name ?? 'Unnamed Vehicle',
                          preferBelow: false,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text(
                            item.name ?? 'Unnamed Vehicle',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(width: 5), // 5px spacing between vehicle name and condition type
                      if (item.year != null)
                        Text(
                          item.year!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),

<<<<<<< Updated upstream
                  // Price
                  Text(
                    'GH₵ ${formatNumber(shortenerRequired: true, number: int.tryParse(item.price ?? '0') ?? 0)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorGlobalVariables.redColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
=======
>>>>>>> Stashed changes
                  const SizedBox(height: 8),

                  // Price and Mileage - Enhanced with tooltip and formatting
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3, // Give price 3/4 of the space
                        child: Tooltip(
                          message: '${userProvider.user?.countryCurrencySymbol ?? ''} ${_formatPriceWithCommas(item.price ?? '0')}',
                          preferBelow: false,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text(
                            '${userProvider.user?.countryCurrencySymbol ?? ''} ${_formatPriceWithCommas(item.price ?? '0')}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorGlobalVariables.redColor,
                            ),
                            maxLines: 1,
                            overflow: _formatPriceWithCommas(item.price ?? '0').length > 6
                                ? TextOverflow.ellipsis
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(width: 8), // Increased spacing between price and mileage
                      if (item.mileage != null)
                        Expanded(
                          flex: 1, // Give mileage 1/4 of the space
                          child: Tooltip(
                            message: item.mileage != null
                                ? "${DistanceUtils.formatDistance(item.mileage)} km"
                                : "No mileage data",
                            preferBelow: false,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.speed, size: 14, color: Colors.grey[600]),
                                SizedBox(width: 4), // Reduced spacing between icon and text
                                Expanded(
                                  child: DistanceUtils.buildDistanceText(
                                    item.mileage,
                                    textStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Transmission and Location - Enhanced with spacing and location tooltip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Transmission - Enhanced with spacing
                      if (item.transmission != null)
                        Row(
                          children: [
                            Icon(Icons.settings, size: 14, color: Colors.grey[600]),
                            SizedBox(width: 2), // Reduced spacing between icon and text
                            Text(
                              item.transmission!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                      SizedBox(width: 4), // 4px spacing between transmission and location

                      // Location - Enhanced with tooltip
                      if (item.location != null)
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                              SizedBox(width: 2), // Reduced spacing between icon and text
                              Expanded(
                                child: Tooltip(
                                  message: item.location!,
                                  preferBelow: false,
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
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
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  child: Text(
                                    item.location!,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
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
<<<<<<< Updated upstream

                  // Mileage (if available and space permits)
                  if (item.mileage != null && item.transmission == null)
                    Row(
                      children: [
                            Icon(Icons.speed, size: 20, color: Colors.grey[600]),
                            const SizedBox(width: 8),
                        Text(
                          "${formatNumber(shortenerRequired: true, number: int.tryParse(item.mileage!) ?? 0)} km",
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
=======
>>>>>>> Stashed changes
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage(String? imageUrl) {
    if (imageUrl != null && imageUrl.isNotEmpty && !imageUrl.contains('assets/')) {
      final String fullImageUrl = getImageUrl(imageUrl, null);

      return CachedNetworkImage(
        imageUrl: fullImageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => _buildImageErrorPlaceholder(),
      );
    } else {
      return _buildImageErrorPlaceholder();
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
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}