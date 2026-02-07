import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/searchItemModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/searchProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';

class HomePageSearchPage extends StatefulWidget {
  const HomePageSearchPage({super.key});

  @override
  _HomePageSearchPageState createState() => _HomePageSearchPageState();
}

class _HomePageSearchPageState extends State<HomePageSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _showInitialState = true;

  // Commented out Recent Searches data
  // final List<String> _recentSearches = [
  //   'Toyota Camry 2020',
  //   'BMW X5',
  //   'Mercedes Benz',
  //   'Honda Civic',
  //   'Range Rover Sport'
  // ];

  // Commented out Popular Searches data
  // final List<String> _popularSearches = [
  //   'Tesla Model 3',
  //   'Ford Mustang',
  //   'Porsche 911',
  //   'Audi Q7',
  //   'Jeep Wrangler',
  //   'Nissan Altima'
  // ];

  // Helper method to get colors for different categories
  Color _getCategoryColor(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'cars':
        return Colors.blue;
      case 'motorcycles':
        return Colors.orange;
      case 'trucks':
        return Colors.green;
      case 'parts & accessories':
        return Colors.red;
      case 'agricultural machinery':
        return Colors.brown;
      case 'electric vehicles':
        return Colors.teal;
      default:
        return ColorGlobalVariables.blueColor;
    }
  }

  // Helper method to get icons for different categories
  IconData _getCategoryIcon(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'cars':
        return Icons.directions_car;
      case 'motorcycles':
        return Icons.motorcycle;
      case 'trucks':
        return Icons.local_shipping;
      case 'parts & accessories':
        return Icons.construction;
      case 'agricultural machinery':
        return Icons.agriculture;
      case 'electric vehicles':
        return Icons.electric_car;
      default:
        return Icons.category;
    }
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
    _searchFocusNode.requestFocus();
  }

  void _onSearchTextChanged() {
    final query = _searchController.text.trim();
    
    if (query.isEmpty) {
      setState(() {
        _showInitialState = true;
      });
      Provider.of<SearchProvider>(context, listen: false).clearSearch();
      return;
    }

    if (query.length >= 2) {
      setState(() {
        _showInitialState = false;
      });
      Provider.of<SearchProvider>(context, listen: false).searchWithDebounce(query);
    }
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) return;
    
    _searchController.text = query;
    _searchFocusNode.unfocus();
    
    // Commented out recent searches functionality
    // if (!_recentSearches.contains(query)) {
    //   setState(() {
    //     _recentSearches.insert(0, query);
    //     if (_recentSearches.length > 5) {
    //       _recentSearches.removeLast();
    //     }
    //   });
    // }

    setState(() {
      _showInitialState = false;
    });
    Provider.of<SearchProvider>(context, listen: false).searchWithDebounce(query);
  }

  void _clearSearch() {
    _searchController.clear();
    _searchFocusNode.requestFocus();
    setState(() {
      _showInitialState = true;
    });
    Provider.of<SearchProvider>(context, listen: false).clearSearch();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchTextChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.white,
      appBar: _buildAppBar(isDarkMode),
      body: _buildBody(isDarkMode),
    );
  }

  AppBar _buildAppBar(bool isDarkMode) {
    return AppBar(
      backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded, 
          color: isDarkMode ? Colors.white : Colors.black87
        ),
        onPressed: () => Get.back(),
      ),
      title: Container(
        height: 45,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF616161) : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDarkMode ? const Color(0xFF757575) : Colors.grey[300]!
          ),
        ),
        child: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          autofocus: true,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
          decoration: InputDecoration(
            hintText: 'Search cars, brands, models...',
            hintStyle: TextStyle(color: isDarkMode ? Colors.white60 : Colors.grey[500]),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_rounded, 
              color: isDarkMode ? Colors.white60 : Colors.grey[500]
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear_rounded, 
                      color: isDarkMode ? Colors.white60 : Colors.grey[500]
                    ),
                    onPressed: _clearSearch,
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
          ),
          onSubmitted: (value) {
            _performSearch(value);
          },
        ),
      ),
    );
  }

  Widget _buildBody(bool isDarkMode) {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, child) {
        if (_showInitialState) {
          return _buildSearchSuggestions(isDarkMode);
        }

        if (searchProvider.isLoading) {
          return _buildLoadingState(isDarkMode);
        }

        if (searchProvider.hasError) {
          return _buildErrorState(searchProvider, isDarkMode);
        }

        if (searchProvider.hasResults) {
          return _buildSearchResults(searchProvider.searchResults, isDarkMode);
        }

        return _buildNoResultsState(isDarkMode);
      },
    );
  }

  Widget _buildSearchSuggestions(bool isDarkMode) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: true);
    
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Commented out Recent Searches section
          // if (_recentSearches.isNotEmpty) ...[
          //   _buildSectionHeader('Recent Searches', isDarkMode),
          //   SizedBox(height: 12),
          //   Wrap(
          //     spacing: 8,
          //     runSpacing: 8,
          //     children: _recentSearches.map((search) {
          //       return _buildChip(search, Icons.history_rounded, isDarkMode);
          //     }).toList(),
          //   ),
          //   SizedBox(height: 24),
          // ],

          // Browse Categories - THESE WILL TRIGGER SEARCH BY CATEGORY NAME
          _buildSectionHeader('Browse Categories', isDarkMode),
          SizedBox(height: 16),
          _buildCategoriesGrid(homeProvider.categories, isDarkMode),
          SizedBox(height: 24),

          // Commented out Popular Searches section
          // _buildSectionHeader('Popular Searches', isDarkMode),
          // SizedBox(height: 12),
          // Column(
          //   children: _popularSearches.map((search) {
          //     return _buildSearchSuggestionItem(search, isDarkMode);
          //   }).toList(),
          // ),
        ],
      ),
    );
  }

  // Categories Grid - NOW TRIGGERS SEARCH BY CATEGORY NAME
  Widget _buildCategoriesGrid(List<Categories> categories, bool isDarkMode) {
    if (categories.isEmpty) {
      return _buildCategoriesLoading(isDarkMode);
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _buildCategoryCard(category, isDarkMode);
      },
    );
  }

  Widget _buildCategoriesLoading(bool isDarkMode) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildCategoryShimmer(isDarkMode);
      },
    );
  }

  Widget _buildCategoryShimmer(bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF424242) : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[600] : Colors.grey[200],
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 50,
              height: 10,
              color: isDarkMode ? Colors.grey[600] : Colors.grey[200],
            ),
            SizedBox(height: 4),
            Container(
              width: 35,
              height: 8,
              color: isDarkMode ? Colors.grey[600] : Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }

  // Category Card - NOW TRIGGERS SEARCH BY CATEGORY NAME
  Widget _buildCategoryCard(Categories category, bool isDarkMode) {
    return GestureDetector(
      onTap: () => _performSearch(category.name), // Search by category name
      child: Container(
        margin: EdgeInsets.all(2),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 100,
            maxHeight: 120,
          ),
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF424242) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.05),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: isDarkMode ? const Color(0xFF616161) : Colors.grey[100]!
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _getCategoryColor(category.name).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: _buildCategoryImage(category),
                ),
                SizedBox(height: 8),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 80,
                  ),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '${_getCategoryCount(category.name)} items',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white60 : Colors.grey[500],
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to get approximate counts for categories (temporary)
  String _getCategoryCount(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'cars':
        return '1.2K';
      case 'motorcycles':
        return '567';
      case 'trucks':
        return '89';
      case 'parts & accessories':
        return '2.3K';
      case 'agricultural machinery':
        return '156';
      case 'electric vehicles':
        return '789';
      default:
        return '100';
    }
  }

  Widget _buildCategoryImage(Categories category) {
    final imageUrl = category.image;
    final hasValidImage = imageUrl.isNotEmpty && 
                         !imageUrl.contains('assets/');
    
    if (hasValidImage) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: CachedNetworkImage(
          imageUrl: getImageUrl(imageUrl, null),
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: Icon(
              _getCategoryIcon(category.name),
              color: _getCategoryColor(category.name),
              size: 20,
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(
              _getCategoryIcon(category.name),
              color: _getCategoryColor(category.name),
              size: 20,
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Icon(
          _getCategoryIcon(category.name),
          color: _getCategoryColor(category.name),
          size: 20,
        ),
      );
    }
  }

  Widget _buildSearchResults(List<SearchItem> results, bool isDarkMode) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${results.length} results found',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white70 : Colors.grey[700],
                ),
              ),
              Text(
                'for "${_searchController.text}"',
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode ? Colors.white60 : Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemCount: results.length,
            itemBuilder: (context, index) {
              return _SearchResultItemWidget(
                searchItem: results[index],
                isDarkMode: isDarkMode,
              );
            },
          ),
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
          SizedBox(height: 16),
          Text(
            'Searching...',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(SearchProvider searchProvider, bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline, 
            size: 64, 
            color: isDarkMode ? Colors.grey[400] : Colors.grey[400]
          ),
          SizedBox(height: 16),
          Text(
            'Search failed',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            searchProvider.errorMessage,
            style: TextStyle(
              color: isDarkMode ? Colors.white60 : Colors.grey[500], 
              fontSize: 14
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: searchProvider.retrySearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.blueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              'Try Again',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResultsState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 64,
            color: isDarkMode ? Colors.grey[500] : Colors.grey[300],
          ),
          SizedBox(height: 16),
          Text(
            'No results found for "${_searchController.text}"',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Try different keywords or check spelling',
            style: TextStyle(
              color: isDarkMode ? Colors.white60 : Colors.grey[500],
              fontSize: 14,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _clearSearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.blueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Clear Search',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool isDarkMode) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: isDarkMode ? Colors.white : Colors.black87,
      ),
    );
  }

  // Commented out Chip for Recent Searches
  // Widget _buildChip(String text, IconData icon, bool isDarkMode) {
  //   return GestureDetector(
  //     onTap: () => _performSearch(text),
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //       decoration: BoxDecoration(
  //         color: isDarkMode ? const Color(0xFF424242) : Colors.grey[50],
  //         borderRadius: BorderRadius.circular(20),
  //         border: Border.all(
  //           color: isDarkMode ? const Color(0xFF616161) : Colors.grey[300]!
  //         ),
  //       ),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(
  //             icon, 
  //             size: 16, 
  //             color: isDarkMode ? Colors.white60 : Colors.grey[600]
  //           ),
  //           SizedBox(width: 6),
  //           Text(
  //             text,
  //             style: TextStyle(
  //               color: isDarkMode ? Colors.white70 : Colors.grey[700],
  //               fontSize: 14,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Commented out Search Suggestion Item for Popular Searches
  // Widget _buildSearchSuggestionItem(String search, bool isDarkMode) {
  //   return ListTile(
  //     leading: Icon(
  //       Icons.trending_up_rounded, 
  //       color: isDarkMode ? Colors.white60 : Colors.grey[500], 
  //       size: 20
  //     ),
  //     title: Text(
  //       search,
  //       style: TextStyle(
  //         color: isDarkMode ? Colors.white70 : Colors.grey[700]
  //       ),
  //     ),
  //     trailing: Icon(
  //       Icons.arrow_forward_ios_rounded, 
  //       size: 16, 
  //       color: isDarkMode ? Colors.white60 : Colors.grey[400]
  //     ),
  //     onTap: () => _performSearch(search),
  //     contentPadding: EdgeInsets.symmetric(horizontal: 4),
  //   );
  // }
}

class _SearchResultItemWidget extends StatelessWidget {
  final SearchItem searchItem;
  final bool isDarkMode;

  const _SearchResultItemWidget({
    required this.searchItem,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final firstImage = searchItem.images?.isNotEmpty == true
        ? searchItem.images!.first
        : null;
    
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RouteClass.getDetailPage(),
          arguments: {
            'product': searchItem.toJson(),
            'item': searchItem.toJson(),
            'type': 'details',
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF424242) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.12),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    color: isDarkMode ? const Color(0xFF616161) : Colors.grey[100],
                    child: _buildSearchItemImage(firstImage),
                  ),
                ),
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
                      searchItem.condition ?? 'Used',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    searchItem.name ?? 'Unnamed Vehicle',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${userProvider.user?.countryCurrencySymbol ?? ''} ${_formatPrice(searchItem.price)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorGlobalVariables.redColor,
                        ),
                      ),
                      if (searchItem.year != null)
                        Text(
                          searchItem.year!,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDarkMode ? Colors.white60 : Colors.grey[600],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (searchItem.transmission != null)
                        Row(
                          children: [
                            Icon(
                              Icons.settings, 
                              size: 14, 
                              color: isDarkMode ? Colors.white60 : Colors.grey[600]
                            ),
                            SizedBox(width: 4),
                            Text(
                              searchItem.transmission!,
                              style: TextStyle(
                                fontSize: 11,
                                color: isDarkMode ? Colors.white60 : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      if (searchItem.mileage != null)
                        Row(
                          children: [
                            Icon(
                              Icons.speed, 
                              size: 20, 
                              color: isDarkMode ? Colors.white60 : Colors.grey[600]
                            ),
                            SizedBox(width: 8),
                            Text(
                              "${_formatMileage(searchItem.mileage!)} km",
                              style: TextStyle(
                                fontSize: 11,
                                color: isDarkMode ? Colors.white60 : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 8),
                  if (searchItem.location != null)
                    Row(
                      children: [
                        Icon(
                          Icons.location_on, 
                          size: 14, 
                          color: isDarkMode ? Colors.white60 : Colors.grey[600]
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            searchItem.location!,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchItemImage(String? imageUrl) {
    if (imageUrl != null && imageUrl.isNotEmpty && !imageUrl.contains('assets/')) {
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
    } else {
      return _buildImageErrorPlaceholder();
    }
  }

  Widget _buildImageErrorPlaceholder() {
    return Container(
      color: isDarkMode ? const Color(0xFF616161) : Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported, 
              size: 32, 
              color: isDarkMode ? Colors.grey[400] : Colors.grey[400]
            ),
            SizedBox(height: 4),
            Text(
              'No Image',
              style: TextStyle(
                fontSize: 10,
                color: isDarkMode ? Colors.white60 : Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(String? price) {
    if (price == null || price.isEmpty) return '0';
    try {
      final number = int.parse(price);
      if (number >= 1000000) {
        return '${(number / 1000000).toStringAsFixed(1)}M';
      } else if (number >= 1000) {
        return '${(number / 1000).toStringAsFixed(1)}K';
      }
      return number.toString();
    } catch (e) {
      return price;
    }
  }

  String _formatMileage(String mileage) {
    try {
      final number = int.parse(mileage);
      if (number >= 1000000) {
        return '${(number / 1000000).toStringAsFixed(1)}M';
      } else if (number >= 1000) {
        return '${(number / 1000).toStringAsFixed(1)}K';
      }
      return number.toString();
    } catch (e) {
      return mileage;
    }
  }
}