import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/searchProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/filterBottomSheetContent.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Import your custom components
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/searchItemModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
}

class _SearchItemCard extends StatelessWidget {
  final SearchItem item;

  const _SearchItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final firstImage = item.images?.isNotEmpty == true ? item.images!.first : null;

    return GestureDetector(
      onTap: () {
        // Navigate to detail page
        debugPrint('Tapped on: ${item.name}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
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

            // Content section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and year
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
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
                  const SizedBox(height: 6),

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
                  const SizedBox(height: 8),

                  // Details row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Transmission
                      if (item.transmission != null)
                        Row(
                          children: [
                            Icon(Icons.settings, size: 14, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(
                              item.transmission!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                      // Location
                      if (item.location != null)
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Expanded(
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
                            ],
                          ),
                        ),
                    ],
                  ),

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