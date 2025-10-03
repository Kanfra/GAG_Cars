import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textLarge.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/trendingMakeModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AllMakesPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const AllMakesPage({
    super.key,
    required this.allJson,
  });

  @override
  State<AllMakesPage> createState() => _AllMakesPageState();
}

class _AllMakesPageState extends State<AllMakesPage> {
  final TextEditingController _searchEditingController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late String _type;
  late List<TrendingMake> _brands;
  late List<TrendingMake> _filteredBrands;
  bool _isSearching = false;
  bool _showShimmer = true;
  String _currentLayout = 'grid';
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    _initializeFromArguments();
    _simulateLoading();
  }

  void _initializeFromArguments() {
    final Map<String, dynamic> args = widget.allJson;

    // DEBUG: Print all arguments to see what's actually being passed
    print('=== DEBUG: AllMakesPage Arguments ===');
    print('All arguments keys: ${args.keys}');
    print('Arguments: $args');
    print('=====================================');

    // Handle type
    _type = args['type'] as String? ?? 'brands';

    // Handle brands data - FIXED: Properly extract and convert brands
    if (args.containsKey('brands')) {
      final brandsData = args['brands'];
      if (brandsData is List<dynamic>) {
        _brands = brandsData.map((brandJson) {
          if (brandJson is TrendingMake) {
            return brandJson;
          } else if (brandJson is Map<String, dynamic>) {
            return TrendingMake.fromJson(brandJson);
          } else {
            throw Exception('Invalid brand type: ${brandJson.runtimeType}');
          }
        }).toList();
        logger.i('✅ Loaded ${_brands.length} brands from arguments');
      } else {
        _brands = [];
        logger.w('⚠️ brands is not a list, using empty list');
      }
    } else if (args.containsKey('selectedBrands')) {
      // Alternative key name
      final selectedBrands = args['selectedBrands'];
      if (selectedBrands is List<dynamic>) {
        _brands = selectedBrands.map((brandJson) {
          if (brandJson is TrendingMake) {
            return brandJson;
          } else if (brandJson is Map<String, dynamic>) {
            return TrendingMake.fromJson(brandJson);
          } else {
            throw Exception('Invalid brand type: ${brandJson.runtimeType}');
          }
        }).toList();
        logger.i('✅ Loaded ${_brands.length} brands from selectedBrands');
      } else {
        _brands = [];
        logger.w('⚠️ selectedBrands is not a list, using empty list');
      }
    } else {
      _brands = [];
      logger.w('⚠️ No brands data found in arguments, using empty list');
    }

    _filteredBrands = List.from(_brands);
  }

  void _simulateLoading() {
    Future.delayed(Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _showShimmer = false;
        });
      }
    });
  }

  void _filterBrands(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      if (query.isEmpty) {
        _filteredBrands = List.from(_brands);
      } else {
        _filteredBrands = _brands
            .where((brand) =>
                brand.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
            .toList();
      }
    });
  }

  void _toggleLayout() {
    setState(() {
      _currentLayout = _currentLayout == 'grid' ? 'list' : 'grid';
    });
  }

  void _navigateToSelectedBrand(TrendingMake brand) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    
    // Filter recommended items by this brand
    final brandItems = homeProvider.recommendedItems.where((item) {
      final itemBrandId = item.brand?.id ?? item.brandId;
      return itemBrandId == brand.id;
    }).toList();

    logger.w('🚗 Found ${brandItems.length} items for brand: ${brand.name}');
    
    Get.toNamed(
      RouteClass.getSelectedBrandPage(),
      arguments: {
        'selectedBrand': brand.toJson(),
        'brandItems': brandItems, // Pass the actual filtered items
        'type': 'selectedBrand'
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchSection(),
            _buildHeaderSection(),
            Expanded(
              child: _showShimmer
                  ? _buildShimmerLoader()
                  : _filteredBrands.isEmpty
                      ? _buildEmptyState()
                      : _currentLayout == 'grid'
                          ? _buildGridView()
                          : _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black87),
        onPressed: () => Get.back(),
      ),
      title: Text(
        'All Makes',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: ColorGlobalVariables.brownColor,
          letterSpacing: -0.5,
        ),
      ),
      centerTitle: true,
      actions: [
        // IconButton(
        //   icon: Icon(Icons.filter_list_rounded, color: Colors.black54),
        //   onPressed: () {},
        // ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.grey[50]!],
        ),
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: _searchEditingController,
          focusNode: _searchFocusNode,
          onChanged: _filterBrands,
          decoration: InputDecoration(
            hintText: 'Search luxury brands...',
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
            border: InputBorder.none,
            prefixIcon: Container(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.search_rounded, color: ColorGlobalVariables.brownColor, size: 24),
            ),
            suffixIcon: _isSearching
                ? IconButton(
                    icon: Icon(Icons.close_rounded, color: Colors.grey[500]),
                    onPressed: () {
                      _searchEditingController.clear();
                      _filterBrands('');
                      _searchFocusNode.unfocus();
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.mic_rounded, color: ColorGlobalVariables.brownColor),
                    onPressed: () {},
                  ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${_filteredBrands.length} ${_filteredBrands.length == 1 ? 'Make' : 'All Makes'}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.grid_view_rounded,
                  color: _currentLayout == 'grid' ? ColorGlobalVariables.brownColor : Colors.grey[400],
                ),
                onPressed: _toggleLayout,
              ),
              IconButton(
                icon: Icon(
                  Icons.list_rounded,
                  color: _currentLayout == 'list' ? ColorGlobalVariables.brownColor : Colors.grey[400],
                ),
                onPressed: _toggleLayout,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85,
      ),
      itemCount: _filteredBrands.length,
      itemBuilder: (context, index) {
        final brand = _filteredBrands[index];
        return _buildBrandGridCard(brand);
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: _filteredBrands.length,
      itemBuilder: (context, index) {
        final brand = _filteredBrands[index];
        return _buildBrandListCard(brand);
      },
    );
  }

  Widget _buildBrandGridCard(TrendingMake brand) {
    // Get vehicle count for this brand from HomeProvider
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final vehicleCount = homeProvider.recommendedItems.where((item) {
      final itemBrandId = item.brand?.id ?? item.brandId;
      return itemBrandId == brand.id;
    }).length;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _navigateToSelectedBrand(brand),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 25,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Main Content - Perfectly Centered
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Brand Logo Container
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey[100]!, width: 3),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(brand.image, null),
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[200],
                              child: Icon(Icons.business, color: Colors.grey[400]),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Brand Name - Centered
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 120),
                        child: Text(
                          brand.name ?? 'Unknown Brand',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      SizedBox(height: 12),

                      // Vehicle Count Badge - Centered
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ColorGlobalVariables.brownColor.withOpacity(0.15),
                              ColorGlobalVariables.brownColor.withOpacity(0.08),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          '$vehicleCount ${vehicleCount == 1 ? 'vehicle' : 'vehicles'}',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: ColorGlobalVariables.brownColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Hover Effect Layer
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => _navigateToSelectedBrand(brand),
                    splashColor: ColorGlobalVariables.brownColor.withOpacity(0.1),
                    highlightColor: ColorGlobalVariables.brownColor.withOpacity(0.05),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandListCard(TrendingMake brand) {
    // Get vehicle count for this brand from HomeProvider
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final vehicleCount = homeProvider.recommendedItems.where((item) {
      final itemBrandId = item.brand?.id ?? item.brandId;
      return itemBrandId == brand.id;
    }).length;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _navigateToSelectedBrand(brand),
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 15,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _navigateToSelectedBrand(brand),
              splashColor: ColorGlobalVariables.brownColor.withOpacity(0.1),
              highlightColor: ColorGlobalVariables.brownColor.withOpacity(0.05),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Brand Logo
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[100]!, width: 2),
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: getImageUrl(brand.image, null),
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey[200],
                            child: Icon(Icons.business, color: Colors.grey[400]),
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(width: 16),
                    
                    // Brand Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            brand.name ?? 'Unknown Brand',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '$vehicleCount ${vehicleCount == 1 ? 'vehicle' : 'vehicles'} available',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Arrow Icon
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 80,
              color: Colors.grey[300],
            ),
            SizedBox(height: 24),
            Text(
              'No Brands Found',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.grey[500],
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Try adjusting your search terms or browse all brands',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _searchEditingController.clear();
                _filterBrands('');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorGlobalVariables.brownColor,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'View All Brands',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerLoader() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchEditingController.dispose();
    super.dispose();
  }
}