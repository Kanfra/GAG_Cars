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
  final Logger logger = Logger();

  // Speech variables - Commented out since flutter_speech is problematic
  // bool _isListening = false;
  // String _lastWords = '';
  // bool _speechAvailable = false;

  // Keyboard visibility tracking
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _initializeFromArguments();
    // _initializeSpeech(); // Commented out - speech functionality disabled
    _simulateLoading();
    
    // Listen for keyboard visibility changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupKeyboardListeners();
    });
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

  // void _initializeSpeech() {
  //   // Commented out - speech functionality disabled
  //   _speechAvailable = false;
  //   logger.i('ℹ️ Speech recognition disabled due to compatibility issues');
  // }

  void _setupKeyboardListeners() {
    // Check initial keyboard state
    _updateKeyboardVisibility();
    
    // Listen for keyboard changes
    _searchFocusNode.addListener(() {
      _updateKeyboardVisibility();
    });
  }

  void _updateKeyboardVisibility() {
    final newKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    if (newKeyboardVisible != _keyboardVisible) {
      setState(() {
        _keyboardVisible = newKeyboardVisible;
      });
    }
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
                brand.name.toLowerCase().contains(query.toLowerCase()) ?? false)
            .toList();
      }
    });
  }

  void _toggleLayout() {
    setState(() {
      _currentLayout = _currentLayout == 'grid' ? 'list' : 'grid';
    });
  }

  // Voice search methods commented out since functionality is disabled
  /*
  void _startListening() {
    // Show a message that voice search is coming soon
    _showSpeechMessage('Voice search functionality coming soon!');
    
    // For demo purposes, simulate speech recognition after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isListening = false;
          // Simulate a search term
          _searchEditingController.text = 'Toyota';
          _filterBrands('Toyota');
        });
      }
    });
  }

  void _stopListening() {
    setState(() {
      _isListening = false;
    });
  }

  void _toggleListening() {
    if (_isListening) {
      _stopListening();
    } else {
      setState(() {
        _isListening = true;
      });
      _startListening();
    }
  }

  void _showSpeechError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showSpeechMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorGlobalVariables.brownColor,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
  */

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
        'brandItems': brandItems,
        'type': 'selectedBrand'
      }
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF303030)
        : Colors.grey[50]!;
  }

  Color _getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF424242)
        : Colors.white;
  }

  Color _getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFFFFFF)
        : Colors.black87;
  }

  Color _getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xB3FFFFFF)
        : Colors.grey[700]!;
  }

  Color _getIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFFFFFF)
        : Colors.black87;
  }

  Color _getBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF616161)
        : Colors.grey[200]!;
  }

  Color _getSearchContainerColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF424242)
        : Colors.white;
  }

  Color _getBrandLogoBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF303030)
        : Colors.grey[50]!;
  }

  Color _getBrandLogoBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF616161)
        : Colors.grey[100]!;
  }

  Color _getShimmerBaseColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF424242)
        : Colors.grey[200]!;
  }

  Color _getShimmerHighlightColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF303030)
        : Colors.grey[100]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(context),
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                _buildSearchSection(context),
                _buildHeaderSection(context),
                Expanded(
                  child: _buildContentSection(constraints),
                ),
              ],
            );
          },
        ),
      ),
      // Commented out - floating action button for voice search disabled
      // floatingActionButton: _isListening ? _buildListeningFab() : null,
    );
  }

  Widget _buildContentSection(BoxConstraints constraints) {
    if (_showShimmer) {
      return _buildShimmerLoader();
    }
    
    if (_filteredBrands.isEmpty) {
      return _buildEmptyState(constraints);
    }
    
    return _currentLayout == 'grid' 
        ? _buildGridView() 
        : _buildListView();
  }

  // Commented out - listening FAB disabled
  /*
  Widget _buildListeningFab() {
    return Container(
      margin: EdgeInsets.only(bottom: _keyboardVisible ? MediaQuery.of(context).viewInsets.bottom + 20 : 20),
      child: FloatingActionButton.large(
        onPressed: _stopListening,
        backgroundColor: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mic, color: Colors.white, size: 30),
            SizedBox(height: 4),
            Text(
              'Demo Mode',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
  */

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF424242)
          : Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded, 
          color: _getIconColor(context),
        ),
        onPressed: () => Get.back(),
      ),
      title: Text(
        'All Makes',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : ColorGlobalVariables.brownColor,
          letterSpacing: -0.5,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: Theme.of(context).brightness == Brightness.dark
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF424242), const Color(0xFF303030)],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.grey[50]!],
              ),
        border: Border(bottom: BorderSide(color: _getBorderColor(context), width: 1)),
      ),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getSearchContainerColor(context),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: _searchEditingController,
          focusNode: _searchFocusNode,
          onChanged: _filterBrands,
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w500,
            color: _getTextColor(context),
          ),
          decoration: InputDecoration(
            hintText: 'Search luxury brands...',
            hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xB3FFFFFF)
                  : Colors.grey[500],
              fontSize: 16,
            ),
            border: InputBorder.none,
            prefixIcon: Container(
              padding: const EdgeInsets.all(12),
              child: Icon(
                Icons.search_rounded, 
                color: ColorGlobalVariables.brownColor, 
                size: 24,
              ),
            ),
            suffixIcon: _buildSuffixIcon(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    if (_isSearching) {
      return IconButton(
        icon: Icon(
          Icons.close_rounded, 
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xB3FFFFFF)
              : Colors.grey[500],
        ),
        onPressed: () {
          _searchEditingController.clear();
          _filterBrands('');
          _searchFocusNode.unfocus();
        },
      );
    } else {
      // Commented out - mic icon button disabled
      /*
      return IconButton(
        icon: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: _isListening ? Colors.red.withOpacity(0.1) : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            _isListening ? Icons.mic_rounded : Icons.mic_rounded,
            color: _isListening ? Colors.red : ColorGlobalVariables.brownColor.withOpacity(0.7),
            size: _isListening ? 26 : 24,
          ),
        ),
        onPressed: _toggleListening,
        tooltip: 'Tap for voice search demo',
      );
      */
      return SizedBox.shrink(); // Return empty widget when not searching
    }
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${_filteredBrands.length} ${_filteredBrands.length == 1 ? 'Make' : 'Makes'}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _getSecondaryTextColor(context),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.grid_view_rounded,
                  color: _currentLayout == 'grid' 
                      ? ColorGlobalVariables.brownColor 
                      : Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xB3FFFFFF)
                          : Colors.grey[400],
                ),
                onPressed: _toggleLayout,
              ),
              IconButton(
                icon: Icon(
                  Icons.list_rounded,
                  color: _currentLayout == 'list' 
                      ? ColorGlobalVariables.brownColor 
                      : Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xB3FFFFFF)
                          : Colors.grey[400],
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85,
      ),
      itemCount: _filteredBrands.length,
      itemBuilder: (context, index) {
        final brand = _filteredBrands[index];
        return _buildBrandGridCard(brand, context);
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: _filteredBrands.length,
      itemBuilder: (context, index) {
        final brand = _filteredBrands[index];
        return _buildBrandListCard(brand, context);
      },
    );
  }

  Widget _buildBrandGridCard(TrendingMake brand, BuildContext context) {
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
            color: _getCardColor(context),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 25,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: _getBrandLogoBackgroundColor(context),
                          shape: BoxShape.circle,
                          border: Border.all(color: _getBrandLogoBorderColor(context), width: 3),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(brand.image, null),
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Container(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? const Color(0xFF424242)
                                  : Colors.grey[200],
                              child: Icon(
                                Icons.business, 
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xB3FFFFFF)
                                    : Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 120),
                        child: Text(
                          brand.name ?? 'Unknown Brand',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: _getTextColor(context),
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 12),
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

  Widget _buildBrandListCard(TrendingMake brand, BuildContext context) {
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
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: _getCardColor(context),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 15,
                offset: const Offset(0, 4),
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
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: _getBrandLogoBackgroundColor(context),
                        shape: BoxShape.circle,
                        border: Border.all(color: _getBrandLogoBorderColor(context), width: 2),
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: getImageUrl(brand.image, null),
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Container(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? const Color(0xFF424242)
                                : Colors.grey[200],
                            child: Icon(
                              Icons.business, 
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? const Color(0xB3FFFFFF)
                                  : Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            brand.name ?? 'Unknown Brand',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: _getTextColor(context),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$vehicleCount ${vehicleCount == 1 ? 'vehicle' : 'vehicles'} available',
                            style: TextStyle(
                              fontSize: 14,
                              color: _getSecondaryTextColor(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xB3FFFFFF)
                          : Colors.grey[400],
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

  Widget _buildEmptyState(BoxConstraints constraints) {
    // Calculate available height considering keyboard
    final availableHeight = constraints.maxHeight - 
        (MediaQuery.of(context).padding.top + kToolbarHeight + 200);
    
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: availableHeight,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off_rounded,
                  size: 80,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF616161)
                      : Colors.grey[300],
                ),
                const SizedBox(height: 24),
                Text(
                  'No Brands Found',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xB3FFFFFF)
                        : Colors.grey[500],
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Try adjusting your search terms or browse all brands',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xB3FFFFFF)
                        : Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    _searchEditingController.clear();
                    _filterBrands('');
                    _searchFocusNode.unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorGlobalVariables.brownColor,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
        ),
      ),
    );
  }

  Widget _buildShimmerLoader() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: _getShimmerBaseColor(context),
          highlightColor: _getShimmerHighlightColor(context),
          child: Container(
            decoration: BoxDecoration(
              color: _getCardColor(context),
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