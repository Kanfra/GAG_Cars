import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textLarge.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
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
  late final String type;
  late final List<Map<String, dynamic>> brands;
  List<Map<String, dynamic>> filteredBrands = [];
  bool _isSearching = false;
  bool _showShimmer = true;
  String _currentLayout = 'grid';
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    _initializeData();
    _simulateLoading();
  }

  void _initializeData() {
    type = widget.allJson['type'] as String;
    brands = widget.allJson['brands'] as List<Map<String, dynamic>>;
    filteredBrands = List.from(brands);
    logger.i('Loaded ${brands.length} brands');
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
        filteredBrands = List.from(brands);
      } else {
        filteredBrands = brands
            .where((brand) =>
                brand['name']?.toString().toLowerCase().contains(query.toLowerCase()) ?? false)
            .toList();
      }
    });
  }

  void _toggleLayout() {
    setState(() {
      _currentLayout = _currentLayout == 'grid' ? 'list' : 'grid';
    });
  }

  void _navigateToSelectedBrand(Map<String, dynamic> brand) {
    // Navigate to SelectedBrandPage with the selected brand data
    Get.toNamed(
      RouteClass.getSelectedBrandPage(),
      arguments: {
        'selectedBrand': brand,
        'type': 'selectedBrand'
      }
    );
    // Get.toNamed(
    //   '/selectedBrand', // Make sure this route is defined in your RouteClass
    //   arguments: {
    //     'brand': brand,
    //     'brandName': brand['name'],
    //     'brandImage': brand['image'],
    //     'vehicleCount': brand['id']?.toString() ?? '0',
    //     'sourcePage': 'AllMakesPage',
    //   },
    //   transition: Transition.rightToLeft, // Smooth GetX transition
    //   duration: Duration(milliseconds: 300),
    // );
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
                  : filteredBrands.isEmpty
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
        IconButton(
          icon: Icon(Icons.filter_list_rounded, color: Colors.black54),
          onPressed: () {},
        ),
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
            '${filteredBrands.length} ${filteredBrands.length == 1 ? 'Make' : 'All Makes'}',
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
      itemCount: filteredBrands.length,
      itemBuilder: (context, index) {
        final brand = filteredBrands[index];
        return _buildBrandGridCard(brand);
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: filteredBrands.length,
      itemBuilder: (context, index) {
        final brand = filteredBrands[index];
        return _buildBrandListCard(brand);
      },
    );
  }

  Widget _buildBrandGridCard(Map<String, dynamic> brand) {
    final carCount = brand['id']?.toString() ?? '0';
    
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
                          child: CustomImage(
                            imagePath: getImageUrl(brand['image'], null),
                            isAssetImage: false,
                            isImageBorderRadiusRequired: false,
                            imageWidth: 55,
                            imageHeight: 55,
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Brand Name - Centered
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 120),
                        child: Text(
                          brand['name'] ?? 'Unknown Brand',
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

                      // Car Count Badge - Centered
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
                          '$carCount vehicles',
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

  Widget _buildBrandListCard(Map<String, dynamic> brand) {
    final carCount = brand['id']?.toString() ?? '0';
    
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
                        child: CustomImage(
                          imagePath: getImageUrl(brand['image'], null),
                          isAssetImage: false,
                          isImageBorderRadiusRequired: false,
                          imageWidth: 50,
                          imageHeight: 50,
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
                            brand['name'] ?? 'Unknown Brand',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '$carCount premium vehicles available',
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