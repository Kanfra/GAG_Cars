import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Links/links.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistToggleProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/filterBottomSheetContent.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/homeService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _loadMoreDebouncer;
  SfRangeValues _priceRange = const SfRangeValues(700, 2000);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  void _scrollListener() {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !provider.isLoadingMore &&
        provider.hasMoreRecommended) {
      
      _loadMoreDebouncer?.cancel();
      _loadMoreDebouncer = Timer(const Duration(milliseconds: 300), () {
        provider.loadMoreRecommended();
      });
    }
  }

  Future<void> _loadData() async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    await homeProvider.fetchAllData();
  }

  void _onRefresh() async {
    await _loadData();
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
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars, size: 20, color: Colors.black87),
          onPressed: () {},
        ),
        title: Text(
          "GAGcars",
          style: TextStyle(
            color: ColorGlobalVariables.brownColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.globe, size: 20, color: Colors.black54),
            onPressed: () => Get.toNamed(RouteClass.newsBlogPage),
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, size: 22, color: Colors.black54),
                onPressed: () => Get.toNamed(RouteClass.notificationsPage),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: homeProvider.isLoading 
            ? _buildLoadingState()
            : homeProvider.errorMessage.isNotEmpty 
                ? _buildErrorState(homeProvider)
                : RefreshIndicator(
                    onRefresh: _loadData,
                    child: _buildContent(screenSize, homeProvider),
                  ),
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
          SizedBox(height: 16),
          Text(
            'Loading amazing cars...',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(HomeProvider homeProvider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            homeProvider.errorMessage,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: homeProvider.retryFailedRequest,
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

  Widget _buildContent(Size screenSize, HomeProvider homeProvider) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        // Search Section
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: CustomTextFormField(
                obscureText: false,
                textInputType: TextInputType.text,
                hintText: 'Search for cars, brands, or models...',
                cursorColor: ColorGlobalVariables.brownColor,
                fillColor: Colors.white,
                enabledBorderColor: Colors.transparent,
                focusedBorderColor: ColorGlobalVariables.brownColor,
                prefixIconData: Icons.search,
                fieldWidth: double.infinity,
                fieldHeight: 16,
                suffixIconData: FontAwesomeIcons.sliders,
                onSuffixIconClickFunction: () => showFilterBottomSheet(
                  context: context,
                  widget: FilterBottomSheetContent(
                    priceRange: _priceRange,
                    onPriceRangeChanged: (newRange) {
                      setState(() => _priceRange = newRange);
                    },
                  ),
                ),
                isSuffixIconRequired: true,
                isPrefixIconRequired: true,
                editingController: searchEditingController,
                isFieldHeightRequired: false,
              ),
            ),
          ),
        ),

        // Trending Makes Section
        SliverToBoxAdapter(
          child: _buildTrendingMakes(homeProvider),
        ),

        // Categories Section - ADDED THIS BACK
        SliverToBoxAdapter(
          child: _buildCategoriesSection(homeProvider),
        ),

        // Special Offers Section
        SliverToBoxAdapter(
          child: _buildSpecialOffers(homeProvider, screenSize),
        ),

        // Recommended Header
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended for You',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  children: [
                    CustomRoundIconButton(
                      iconData: Icons.list,
                      isBorderSlightlyCurved: true,
                      onIconButtonClickFunction: () {},
                      buttonSize: 36,
                      iconSize: 16,
                    ),
                    SizedBox(width: 8),
                    CustomRoundIconButton(
                      iconData: Icons.grid_view,
                      isBorderSlightlyCurved: true,
                      onIconButtonClickFunction: () {},
                      buttonSize: 36,
                      iconSize: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Recommended Grid
        SliverPadding(
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
                final recommended = homeProvider.recommendedItems[index];
                return _buildRecommendedItem(recommended, screenSize);
              },
              childCount: homeProvider.recommendedItems.length,
            ),
          ),
        ),

        // Loading More Indicator
        SliverToBoxAdapter(
          child: homeProvider.isLoadingMore
              ? Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          ColorGlobalVariables.redColor),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ),

        // No More Items Message
        SliverToBoxAdapter(
          child: !homeProvider.hasMoreRecommended &&
                  homeProvider.recommendedItems.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Text(
                      'You\'ve reached the end!',
                      style: TextStyle(
                        color: Colors.grey[600],
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

  Widget _buildTrendingMakes(HomeProvider homeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Brands',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Links(
                linkTextType: 'View All',
                linkTextColor: ColorGlobalVariables.brownColor,
                isTextSmall: true,
                textDecoration: TextDecoration.none,
                linkFontWeight: FontWeight.w600,
                isIconWidgetRequiredAtEnd: false,
                isIconWidgetRequiredAtFront: false,
                onClickFunction: () {
                  Get.toNamed(
                    RouteClass.getAllMakesPage(),
                    arguments: {
                      'brands': homeProvider.trendingMakes.map((make) => make.toJson()).toList(),
                      'type': 'brands'
                    },
                    );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: homeProvider.trendingMakes.length,
            itemBuilder: (context, index) {
              final make = homeProvider.trendingMakes[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CustomImage(
                  imagePath: getImageUrl(make.image, null),
                  isAssetImage: false,
                  isImageBorderRadiusRequired: false,
                  imageWidth: 56,
                  imageHeight: 56,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  // ADDED: Categories Section with horizontal listview cards
  Widget _buildCategoriesSection(HomeProvider homeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Text(
            'Browse Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: homeProvider.categories.length,
            itemBuilder: (context, index) {
              final category = homeProvider.categories[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to category page or filter by category
                  print('Category tapped: ${category.name}');
                },
                child: Container(
                  width: 90,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Category Icon
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _getCategoryColor(category.name),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _getIconForCategory(categoryName: category.name),
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Category Name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildSpecialOffers(HomeProvider homeProvider, Size screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Text(
            'Special Offers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: homeProvider.specialOffers.length,
            itemBuilder: (context, index) {
              final offer = homeProvider.specialOffers[index];
              final item = offer.item;
              final brand = item?.brand;
              final firstImage = item!.images?.isNotEmpty == true
                  ? item.images?.first
                  : "car_placeholder.png";
              final brandImage = brand?.image;
              final discount = offer.discount;

              return Container(
                width: screenSize.width * 0.75,
                margin: EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: getImageUrl(firstImage, null),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: Icon(Icons.error, color: Colors.grey[400]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 12,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: ColorGlobalVariables.redColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${discount.toString()}% OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        bottom: 12,
                        right: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (brandImage != null)
                              Container(
                                width: 32,
                                height: 32,
                                child: CachedNetworkImage(
                                  imageUrl: getImageUrl(brandImage, null),
                                  fit: BoxFit.contain,
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.business,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            SizedBox(height: 8),
                            Text(
                              item.name ?? 'Special Offer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Limited Time Offer',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildRecommendedItem(RecommendedItem recommended, Size screenSize) {
    final firstImage = recommended.images?.isNotEmpty == true
        ? recommended.images!.first
        : "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
    final brandImage = recommended.brand?.image;

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RouteClass.getDetailPage(),
          arguments: {
            'product': recommended.toJson(),
            'item': recommended.toJson(),
            'type': 'recommended',
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
                    color: Colors.grey[100],
                    child: _buildRecommendedImage(firstImage, recommended),
                  ),
                ),
                
                // Category Badge
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
                      recommended.category?.name ?? 'Car',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                // Wishlist Button
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        await Provider.of<WishlistToggleProvider>(context,
                                listen: false)
                            .toggleWishlistItem(itemId: recommended.id);
                      } catch (e) {
                        print('Wishlist error: $e');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Colors.black54,
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
                          recommended.name ?? 'Unnamed Vehicle',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        recommended.condition ?? 'Used',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  // Price and Mileage
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'GH₵ ${formatNumber(shortenerRequired: true, number: int.parse(recommended.price ?? '0'))}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorGlobalVariables.redColor,
                        ),
                      ),
                      if (recommended.mileage != null)
                        Row(
                          children: [
                            Icon(Icons.speed, size: 14, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text(
                              "${formatNumber(shortenerRequired: true, number: int.parse(recommended.mileage!))} km",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),

                  SizedBox(height: 12),

                  // Brand and Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (brandImage != null)
                        Container(
                          width: 24,
                          height: 24,
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(brandImage, null),
                            fit: BoxFit.contain,
                            errorWidget: (context, url, error) => Icon(
                              Icons.business,
                              size: 16,
                              color: Colors.grey[400],
                            ),
                          ),
                        )
                      else
                        SizedBox(width: 24),
                      
                      if (recommended.transmission != null)
                        Row(
                          children: [
                            Icon(Icons.settings, size: 14, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text(
                              recommended.transmission!,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      
                      if (recommended.location != null)
                        Flexible(
                          child: Row(
                            children: [
                              Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                              SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  recommended.location!,
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

  Widget _buildRecommendedImage(String imageUrl, RecommendedItem recommended) {
    final bool isAssetImage = recommended.images?.isNotEmpty != true;
    
    if (isAssetImage) {
      return Image.asset(
        "${ImageStringGlobalVariables.imagePath}car_placeholder.png",
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildImageErrorPlaceholder();
        },
      );
    } else {
      final String fullImageUrl = getImageUrl(imageUrl, null);
      
      return CachedNetworkImage(
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
      );
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
            SizedBox(height: 4),
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

  // Helper method to get colors for different categories
  Color _getCategoryColor(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'parts & accessories':
        return Colors.blue;
      case 'motocycle':
        return Colors.orange;
      case 'agricultural machinery':
        return Colors.green;
      case 'trucks':
        return Colors.red;
      default:
        return ColorGlobalVariables.redColor;
    }
  }

  IconData _getIconForCategory({required String categoryName}) {
    switch (categoryName.toLowerCase()) {
      case 'parts & accessories':
        return Icons.construction;
      case 'motocycle':
        return FontAwesomeIcons.motorcycle;
      case 'agricultural machinery':
        return Icons.agriculture;
      case 'trucks':
        return FontAwesomeIcons.truck;
      default:
        return Icons.directions_car;
    }
  }
}