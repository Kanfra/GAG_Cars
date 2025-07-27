import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Links/links.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textLarge.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailPage extends StatefulWidget {
  //final List<String> imageUrls;
  final Map<String, dynamic> allJson;
  const DetailPage({
    super.key, 
    required this.allJson,
    //required this.imageUrls
    });

  
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ScrollController _scrollController = ScrollController();
  final double _appBarHeight = 300;
  double _lastScrollPosition = 0;
  bool _isAppBarVisible = true;

  late final Map<String, dynamic> item;
  late final Map<String, dynamic>? product;
  late final String? type;

  List<String> imageUrls = [
    "${ImageStringGlobalVariables.imagePath}honda_civic_temporary.png",
    "${ImageStringGlobalVariables.imagePath}red_car_temporary.png",
    "${ImageStringGlobalVariables.imagePath}black_car_temporary.png",
    "${ImageStringGlobalVariables.imagePath}ford_temporary.png",
    ];

  @override
  void initState() {
    super.initState();
    item = widget.allJson['item'] as Map<String, dynamic>;
    product = widget.allJson['product'] as Map<String, dynamic>;
    type = widget.allJson['type'] as String?;
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final currentPosition = _scrollController.position.pixels;
    final scrollDirection = currentPosition > _lastScrollPosition ? 'down' : 'up';
    _lastScrollPosition = currentPosition;

    if (scrollDirection == 'down' && _isAppBarVisible) {
      setState(() => _isAppBarVisible = false);
    } else if (scrollDirection == 'up' && !_isAppBarVisible) {
      setState(() => _isAppBarVisible = true);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final screenSize = MediaQuery.of(context).size
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Animated AppBar
          SliverAppBar(
            expandedHeight: _appBarHeight,
            pinned: true,
            floating: true,
            centerTitle: true,
            title: TextLarge(
              title: 'Details', 
              fontWeight: FontWeight.w500, 
              textColor: ColorGlobalVariables.blackColor
              ),
            leading: CustomRoundIconButton(
              iconData: Icons.arrow_back_ios, 
              isBorderSlightlyCurved: false, 
              iconDataColor: ColorGlobalVariables.fadedBlackColor,
              //backgroundColor: ,
              onIconButtonClickFunction: (){
                Get.back();
              }
              ),
            actions: [
              CustomRoundIconButton(
                iconData: Icons.share, 
                isBorderSlightlyCurved: false, 
                onIconButtonClickFunction: (){}
                ),
              const SizedBox(width: 5,),
            ],
            flexibleSpace: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isAppBarVisible ? 1 : 0,
              child: _buildFlexibleSpace(),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: ColorGlobalVariables.whiteColor
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                    child: Column(
                      children: [
                        // verhicle name text
                    TextLarge(
                      title: item['name'], 
                      fontWeight: FontWeight.bold, 
                      textColor: ColorGlobalVariables.blackColor
                      ),
                    const SizedBox(height: 5,),
                    // cost of vehicle
                    TextSmall(
                      title: 'GH₵ ${formatNumber(shortenerRequired: false, number: int.parse(item['price']))}', 
                      fontWeight: FontWeight.w500, 
                      textColor: ColorGlobalVariables.fadedBlackColor
                      ),
                    const SizedBox(height: 20,),
                    // some descriptions
                    item['description'] != null ? TextSmall(
                      title: item['description'], 
                      fontWeight: FontWeight.normal, 
                      textColor: ColorGlobalVariables.fadedBlackColor
                      ) : const SizedBox(),
                    item['description'] != null ? const SizedBox(height: 20,) : const SizedBox(),
                    // location icon, location text, date, time
                    item['location'] != null ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // location icon
                        CustomIcon(
                          iconData: Icons.location_on, 
                          isFaIcon: false, 
                          iconColor: ColorGlobalVariables.blackColor
                          ),
                        const SizedBox(width: 3,),
                        // date and time
                        Expanded(
                          child: TextSmall(
                            title: '${item['location']}, ${formatTimeAgo(item['created_at'])}', 
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis, 
                            textColor: ColorGlobalVariables.blackColor
                            ),
                        ),
                      ],
                    ) : const SizedBox(),
                    item['location'] != null ? const SizedBox(height: 10,) : const SizedBox(),
                    // five star, verified container, bell icon and text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // stars
                        SizedBox(
                          height: 19,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: CustomIcon(
                                iconData: Icons.star, 
                                isFaIcon: false, 
                                iconSize: 14,
                                iconColor: ColorGlobalVariables.goldColor
                                ),
                            ),
                            ),
                        ),
                        // verified dealer container
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: ColorGlobalVariables.greenColor,
                          ),
                          child: Row(
                            children: [
                              // check icon
                              CustomImage(
                                imagePath: '${ImageStringGlobalVariables.iconPath}check_verified.png', 
                                isAssetImage: true,
                                imageHeight: 15,
                                imageWidth: 15, 
                                isImageBorderRadiusRequired: false
                                ),
                              const SizedBox(width: 3,),
                              TextSmall(
                                title: 'Verified Dealer', 
                                fontWeight: FontWeight.normal, 
                                textColor: ColorGlobalVariables.blackColor
                                ),
                            ],
                          ),
                        ),
                        // notify me ... text
                        Links(
                          linkTextType: 'Notify (Price Drops)', 
                          linkTextColor: ColorGlobalVariables.blackColor, 
                          isTextSmall: true, 
                          textDecorationColor: ColorGlobalVariables.blackColor,
                          isIconWidgetRequiredAtEnd: false, 
                          isIconWidgetRequiredAtFront: true, 
                          iconData: Icons.notifications_outlined,
                          iconColor: ColorGlobalVariables.blackColor,
                          onClickFunction: (){},
                          ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    // Highlights text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextSmall(
                        title: 'Highlights:',  
                        fontWeight: FontWeight.w500, 
                        textColor: ColorGlobalVariables.blackColor
                        ),
                    ),
                    const SizedBox(height: 8,),
                    // row for model year, mileage, fuel type, engine, drive
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // model year
                        Column(
                          children: [
                            CustomIcon(
                              iconData: Icons.event, 
                              isFaIcon: false, 
                              iconSize: 25,
                              iconColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 3,),
                            //icon name
                            TextExtraSmall(
                              title: 'Model Year', 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 5,),
                              // icon amount
                            TextSmall(
                              title: item['year'], 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ),
                        // mileage
                        item['mileage'] != null ? Column(
                          children: [
                            CustomIcon(
                              iconData: Icons.speed, // directions_car 
                              isFaIcon: false, 
                              iconSize: 25,
                              iconColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 3,),
                            //icon name
                            TextExtraSmall(
                              title: 'Mileage', 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 5,),
                              // icon amount
                            TextSmall(
                              title: '${item['mileage']} km', 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ) : const SizedBox(),
                        // fuel type
                        Column(
                          children: [
                            CustomIcon(
                              iconData: Icons.local_gas_station, 
                              iconSize: 25,
                              isFaIcon: false, 
                              iconColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 3,),
                            //icon name
                            TextExtraSmall(
                              title: 'Fuel Type', 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 5,),
                              // icon amount
                            TextSmall(
                              title: 'Petrol', 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ),
                        // engine
                        item['engine_capacity'] != null ? Column(
                          children: [
                            CustomIcon(
                              iconData: Icons.engineering, // build 
                              iconSize: 25,
                              isFaIcon: false, 
                              iconColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 3,),
                            //icon name
                            TextExtraSmall(
                              title: 'Engine', 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 5,),
                              // icon amount
                            TextSmall(
                              title: '${item["engine_capacity"]} L', 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ) : const SizedBox(),
                        // drive
                        Column(
                          children: [
                            CustomIcon(
                              iconData: Icons.directions_car, // settings 
                              iconSize: 25,
                              isFaIcon: false, 
                              iconColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 3,),
                            //icon name
                            TextExtraSmall(
                              title: 'Drive', 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 5,),
                              // icon amount
                            TextSmall(
                              title: 'AWD', 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    // specification header text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextSmall(
                        title: 'Specifications', 
                        fontWeight: FontWeight.w500, 
                        textColor: ColorGlobalVariables.blackColor
                        ),
                    ),
                    const SizedBox(height: 8,),
                    // row for make, model, color, seats, registered
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // make
                        Column(
                          children: [
                            TextExtraSmall(
                              title: 'Make', 
                              textColor: ColorGlobalVariables.blackColor,
                              ),
                            const SizedBox(height: 5,),
                            TextSmall(
                              title: item['category'].name, 
                              fontWeight: FontWeight.w500, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ),
                        // model
                        item['brand_model'] != null ? Column(
                          children: [
                            TextExtraSmall(
                              title: 'Model', 
                              textColor: ColorGlobalVariables.blackColor,
                              ),
                            const SizedBox(height: 5,),
                            TextSmall(
                              title: item['brand_model'].name, 
                              fontWeight: FontWeight.w500, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ) : const SizedBox(),
                        // color
                        item['color'] != null ? Column(
                          children: [
                            TextExtraSmall(
                              title: 'Color', 
                              textColor: ColorGlobalVariables.blackColor,
                              ),
                            const SizedBox(height: 5,),
                            TextSmall(
                              title: item['color'], 
                              fontWeight: FontWeight.w500, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ) : const SizedBox(),
                        // seats
                        item['number_of_passengers'] != null ? Column(
                          children: [
                            TextExtraSmall(
                              title: 'Seats', 
                              textColor: ColorGlobalVariables.blackColor,
                              ),
                            const SizedBox(height: 5,),
                            TextSmall(
                              title: '${item['number_of_passengers'].toString()} seats', 
                              fontWeight: FontWeight.w500, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ) : const SizedBox(),
                        // registered
                        Column(
                          children: [
                            TextExtraSmall(
                              title: 'Registered', 
                              textColor: ColorGlobalVariables.blackColor,
                              ),
                            const SizedBox(height: 5,),
                            TextSmall(
                              title: 'No', 
                              fontWeight: FontWeight.w500, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    // show more link button
                    Align(
                      alignment: Alignment.centerRight,
                      child: Links(
                        linkTextType: 'Show more', 
                        linkFontWeight: FontWeight.w500,
                        linkTextColor: ColorGlobalVariables.redColor, 
                        isTextSmall: ColorGlobalVariables.trueValue, 
                        textDecorationColor: ColorGlobalVariables.redColor,
                        isIconWidgetRequiredAtEnd: ColorGlobalVariables.falseValue, 
                        isIconWidgetRequiredAtFront: ColorGlobalVariables.falseValue, 
                        onClickFunction: (){}
                        ),
                    ),
                    const Divider(
                      color: ColorGlobalVariables.fadedBlackColor,
                      height: 15,
                      thickness: 0.5,
                    ),
                    // row for user image and details
                    Row(
                      children: [
                        // user image
                        CustomImage(
                          imagePath: '${ImageStringGlobalVariables.imagePath}user_profile_temporary.png', 
                          isAssetImage: true,
                          imageBackgroundColor: Colors.transparent, // for size testing purpose
                          imageWidth: 80,
                          imageHeight: 80,
                          imageBorderRadius: 40,
                          fit: BoxFit.contain, 
                          isImageBorderRadiusRequired: ColorGlobalVariables.trueValue
                          ),
                        const SizedBox(width: 8,),
                        // user details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // row for user name & check image
                            Row(
                              children: [
                                TextSmall(
                                  title: 'Gordon Auto Garage', 
                                  fontWeight: FontWeight.bold,
                                  //overflow: TextOverflow.ellipsis, 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                                const SizedBox(width: 3,),
                                CustomImage(
                                  imagePath: '${ImageStringGlobalVariables.iconPath}check.png',
                                  imageWidth: 18,
                                  imageHeight: 18,
                                  fit: BoxFit.cover, 
                                  isAssetImage: true, 
                                  isImageBorderRadiusRequired: false,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            // joined ... text
                            TextSmall(
                              title: 'Joined: 3 years ago', 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                            const SizedBox(height: 3,),
                            // number of ads
                            TextSmall(
                              title: '34 Ads',
                              textDecoration: TextDecoration.underline,
                              textDecorationColor: ColorGlobalVariables.greenColor,
                              fontWeight: FontWeight.bold, 
                              textColor: ColorGlobalVariables.greenColor
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    // row for chat and show contact button
                    Row(
                      children: [
                        // chat button
                        Expanded(
                          child: CustomTextButton(
                          buttonTextType: 'Chat', 
                          textTypeColor: ColorGlobalVariables.redColor, 
                          borderColor: ColorGlobalVariables.fadedBlackColor,
                          isFullButtonWidthRequired: ColorGlobalVariables.falseValue, 
                          buttonBackgroundColor: Colors.transparent, 
                          onClickFunction: (){}
                          ),
                        ),
                        const SizedBox(width: 20,),
                        // show contact button
                        Expanded(
                          child: CustomTextButton(
                            buttonTextType: 'Show contact', 
                            borderColor: ColorGlobalVariables.fadedBlackColor,
                            textTypeColor: ColorGlobalVariables.redColor, 
                            isFullButtonWidthRequired: ColorGlobalVariables.falseValue, 
                            buttonBackgroundColor: Colors.transparent, 
                            onClickFunction: (){}
                            ),
                        )
                      ],
                    ),
                    
                    
                    ],),
                  ),
                  const SizedBox(height: 15,),
                  GridView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: recommendeds.length,
                        shrinkWrap: ColorGlobalVariables.trueValue,
                        primary: ColorGlobalVariables.falseValue,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items per row
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.75, // Adjust based on your card's height
                        ),
                        itemBuilder: (context, index) {
                          final recommended = recommendeds[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            height: 245,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 0.1,
                                  spreadRadius: 0.1,
                                  offset: Offset(0.1, 0.1),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    CustomImage(
                                      imagePath: recommended["productImage"], 
                                      isAssetImage: true, 
                                      isImageBorderRadiusRequired: true,
                                      imageBorderRadius: 8,
                                      imageHeight: 120,
                                      imageWidth: double.infinity,
                                      fit: BoxFit.contain,
                                      ),
                                    // product type
                                    Positioned(
                                      top: 3, left: 4,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: ColorGlobalVariables.textFieldColor,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: RotatedBox(
                                          quarterTurns: 1,
                                          child: TextSmall(
                                            title: recommended["productType"], 
                                            fontWeight: FontWeight.normal, 
                                            textColor: ColorGlobalVariables.blackColor
                                            ),
                                        ),
                                      ),
                                    ),
                                  // liked icon
                                  Positioned(
                                    top: 3, right: 4,
                                    child: CustomIcon(
                                      iconData: recommended["isLiked"]  ? Icons.favorite : Icons.favorite_border_outlined, 
                                      isFaIcon: false, 
                                      iconSize: 25,
                                      iconColor: recommended["isLiked"] ? ColorGlobalVariables.redColor : ColorGlobalVariables.fadedBlackColor,
                                      ),
                                  ),
                                  ],
                                ),
                                const SizedBox(height: 8,),
                                // row for product name and product nature
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextSmall(
                                        title: recommended["productName"], 
                                        fontWeight: FontWeight.normal, 
                                        overflow: TextOverflow.ellipsis,
                                        textColor: ColorGlobalVariables.blackColor
                                        ),
                                    ),
                                    const SizedBox(width: 4,),
                                    TextSmall(
                                      title: recommended["productNature"], 
                                      fontWeight: FontWeight.normal, 
                                      textColor: ColorGlobalVariables.blackColor
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 2,),
                                // row for product cost  and milleage
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextMedium(
                                        title: "GH₵${recommended["cost"]}", 
                                        fontWeight: FontWeight.w500, 
                                        textColor: ColorGlobalVariables.redColor,
                                        ),
                                    ),
                                    const SizedBox(width: 4,),
                                    Row(
                                      children: [
                                        CustomIcon(
                                          iconData: Icons.speed, 
                                          isFaIcon: false, 
                                          iconColor: ColorGlobalVariables.blackColor
                                          ),
                                        const SizedBox(width: 2,),
                                        TextSmall(
                                          title: "${recommended["mileage"]} km", 
                                          fontWeight: FontWeight.normal, 
                                          textColor: ColorGlobalVariables.blackColor
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12,),
                                // row for product logo product, driveType and location
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // product logo
                                    recommended["productLogo"].isEmpty ? const SizedBox(width: 16,) : CustomImage(
                                      imagePath: recommended["productLogo"], 
                                      isAssetImage: true, 
                                      imageHeight: 25,
                                      imageWidth: 25,
                                      isImageBorderRadiusRequired: false
                                      ),
                                    // row for icon and driveType
                                    Row(
                                      children: [
                                        CustomIcon(
                                          iconData: Icons.settings,
                                          isFaIcon: false, 
                                          iconSize: 16,
                                          iconColor: ColorGlobalVariables.blackColor
                                          ),
                                        const SizedBox(width: 2,),
                                        TextExtraSmall(
                                          title: recommended["driveType"], 
                                          fontWeight: FontWeight.normal, 
                                          textColor: ColorGlobalVariables.blackColor,
                                          ),
                                      ],
                                    ),
                                    //row for icon and location
                                    Row(
                                      children: [
                                        CustomIcon(
                                          iconData: Icons.location_on, 
                                          isFaIcon: false, 
                                          iconColor: ColorGlobalVariables.redColor
                                          ),
                                        const SizedBox(width: 2,),
                                        TextExtraSmall(
                                          title: recommended["location"], 
                                          fontWeight: FontWeight.normal, 
                                          textColor: ColorGlobalVariables.blackColor
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                ]
                          ),
          ),
      ),
        ]
    ));
  }

  List<Map<String, dynamic>> recommendeds = [
    {
      "productImage": "${ImageStringGlobalVariables.imagePath}honda_civic_temporary.png",
      "productType": "FEATURED",
      "productNature": "New",
      "isLiked": false,
      "cost": "400,000",
      "productName": "BMW 8 Series",
      "mileage": 3,
      "productLogo": "${ImageStringGlobalVariables.imagePath}bmw_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"  
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}black_car_temporary.png",
      "productType": "PROMOTION",
      "productNature": "New",
      "isLiked": true,
      "cost": "600,000",
      "productName": "Mercedes Benz GCL 300",
      "mileage": 2,
      "productLogo": "${ImageStringGlobalVariables.imagePath}mercedes_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
  ];

  Widget _buildFlexibleSpace() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Main background image , currently working here
        CustomImage(
          imagePath: item['images'] is List 
          ? getImageUrl(item['images'].first) 
          : '${ImageStringGlobalVariables.imagePath}car_placeholder.png', 
          isAssetImage: item['images'] is List ? false : true, 
          fit: BoxFit.cover,
          isImageBorderRadiusRequired: false
          ),

        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.transparent,
              ],
            ),
          ),
        ),

        // Title
        // const Align(
        //   alignment: Alignment.bottomLeft,
        //   child: Padding(
        //     padding: EdgeInsets.all(16.0),
        //     child: Text(
        //       '2023 Tesla Model S',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 24,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ),

        // Horizontal image stack
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: item['images'].length,
              itemBuilder: (context, index) {
                final specialOffer = item['images'][index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CustomImage(
                      imagePath: item['images'] is List 
                      ? getImageUrl(specialOffer) 
                      : '${ImageStringGlobalVariables.imagePath}car_placeholder.png', 
                      isAssetImage: item['images'] is List ? false : true,
                      imageWidth: 120,
                      useShimmerEffect: false,
                      isImageBorderRadiusRequired: false
                      ),                    
                    // Image.network(
                    //   imageUrlList[index],
                    //   width: 120,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}