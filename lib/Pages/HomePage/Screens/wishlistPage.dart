import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getWishlistProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistToggleProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {

  bool isLiked = false;
  @override
  void initState(){
    super.initState();
    // isLiked = 
    WidgetsBinding.instance.addPostFrameCallback((_){
      // fetch wishlist items when page loads
      context.read<GetWishlistProvider>().fetchItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: (){
          Get.back();
        }, 
        isLeadingWidgetExist: ColorGlobalVariables.trueValue, 
        leadingIconData: Icons.arrow_back_ios,
        appbarBackgroundColor: ColorGlobalVariables.whiteColor,
        leadingIconDataColor: ColorGlobalVariables.fadedBlackColor,
        titleText: "My Wishlist",
        titleTextColor: ColorGlobalVariables.redColor,
        centerTitle: ColorGlobalVariables.trueValue,
        actions: [
          const SizedBox(width: 5,),
          // bell notification icon
          Stack(
            children: [
              CustomRoundIconButton(
                iconData: Icons.notifications, 
                iconSize: 18,
                buttonSize: 35,
                isBorderSlightlyCurved: ColorGlobalVariables.falseValue, 
                onIconButtonClickFunction: (){}
                ),
              Positioned(
                right: 2,
                top: 3,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red, // Dot color
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 8,
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 5,),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
            color: ColorGlobalVariables.whiteColor,
          ),
          child: Consumer<GetWishlistProvider>(
            builder: (context, wishlistProvider, _){
              if(wishlistProvider.isLoading){
                return const Center(
                  child: CircularProgressIndicator()
                );
              }

              if(wishlistProvider.isErrorMessage.isNotEmpty){
                return Center(
                  child: Text(
                    wishlistProvider.isErrorMessage,
                  ),
                );
              }

              if(wishlistProvider.items.isEmpty){
                return const Center(
                  child: Text("No items in your wishlist"),
                );
              }
              return Consumer<WishlistToggleProvider>(
                builder: (context, toggleProvider, _){
                  return GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: wishlistProvider.items.length,
          shrinkWrap: ColorGlobalVariables.trueValue,
          primary: ColorGlobalVariables.falseValue,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.75, // Adjust based on your card's height
          ),
          itemBuilder: (context, index) {
            final item = wishlistProvider.items[index];
            // final brandImage = item.brand?.image;
            return GestureDetector(
              onTap: (){
              Get.toNamed(
                          RouteClass.getDetailPage(),
                          arguments: {
                            'product': item is Map ? item : item.toJson(),
                            'item': item is Map ? item : item.toJson(), // Pass the entire object
                            'type': 'wishlist', // Optional: to identify the type in detail page
                          },

                        );
            },
              child: Container(
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
                          imagePath: getImageUrl("${item.item.images?.first}", null),
                          // imagePath: item.images?.first ?? '', 
                          isAssetImage: false, 
                          isImageBorderRadiusRequired: true,
                          imageBorderRadius: 8,
                          imageHeight: 120,
                          imageWidth: screenSize.width,
                          fit: BoxFit.cover,
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
                                title: item.item.buildType ?? "null", 
                                fontWeight: FontWeight.normal, 
                                textColor: ColorGlobalVariables.blackColor
                                ),
                            ),
                          ),
                        ),
                      // liked icon
                      Positioned(
                        top: 3, right: 4,
                        child: GestureDetector(
                          onTap: () async {
                          try{
                            await toggleProvider.toggleWishlistItem(
                            itemId: item.id,
                            );
                          // refresh wishlist after toggle
                          wishlistProvider.refresh();
                          } catch(e){
                            showCustomSnackBar(
                              title: "Error",
                              message: "Error: $e"
                            );
                          }
                        },
                          child: CustomIcon(
                            iconData: Icons.favorite, 
                            isFaIcon: false, 
                            iconSize: 25,
                            iconColor: ColorGlobalVariables.redColor,
                            ),
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
                            title: item.item.name ?? "Name expected here", 
                            fontWeight: FontWeight.normal, 
                            overflow: TextOverflow.ellipsis,
                            textColor: ColorGlobalVariables.blackColor
                            ),
                        ),
                        const SizedBox(width: 4,),
                        TextSmall(
                          title: item.item.condition ?? "Used", 
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
                            title: 'GH₵ ${formatNumber(shortenerRequired: true, number: int.parse(item.item.price!))}', 
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
                              title: "${formatNumber(shortenerRequired: true, number: item.item.mileage != null ? int.parse(item.item.mileage!) : 0)} km", 
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
                        item.item.images!.isNotEmpty ? CustomImage(
                          imagePath: getImageUrl("${item.item.images?.first}", null), 
                          isAssetImage: false, 
                          imageHeight: 25,
                          imageWidth: 25,
                          isImageBorderRadiusRequired: false
                          ) : const SizedBox(width: 16,),
                        // row for icon and driveType
                        if(item.item.transmission != null)
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
                              title: item.item.transmission!, 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.blackColor,
                              ),
                          ],
                        ),
                        //row for icon and location
                        if(item.item.location != null)
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIcon(
                                iconData: Icons.location_on, 
                                isFaIcon: false, 
                                iconColor: ColorGlobalVariables.redColor
                                ),
                              const SizedBox(width: 2,),
                              Flexible(
                                child: TextExtraSmall(
                                  title: item.item.location!, 
                                  fontWeight: FontWeight.normal, 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
                }
              );
          },
        );
            }
          ),
        ),
        ),
    );
  }

  List<Map<String, dynamic>> recommendeds = [
    {
      "productImage": "${ImageStringGlobalVariables.imagePath}honda_civic_temporary.png",
      "productType": "featured",
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
      "productType": "featured",
      "productNature": "New",
      "isLiked": true,
      "cost": "600,000",
      "productName": "Mercedes Benz GCL 300",
      "mileage": 2,
      "productLogo": "${ImageStringGlobalVariables.imagePath}mercedes_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}kollter_electric_motorbike_temporary.png",
      "productType": "featured",
      "productNature": "New",
      "isLiked": true,
      "cost": "400,000",
      "productName": "BMW Bike",
      "mileage": 2000,
      "productLogo": "${ImageStringGlobalVariables.imagePath}bmw_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}honda_civic_temporary.png",
      "productType": "featured",
      "productNature": "New",
      "isLiked": true,
      "cost": "170,000",
      "productName": "Honda Civic Sport",
      "mileage": 3,
      "productLogo": "${ImageStringGlobalVariables.imagePath}honda_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}ford_temporary.png",
      "productType": "featured",
      "productNature": "New",
      "isLiked": true,
      "cost": "400,000",
      "productName": "Ford Ranger",
      "mileage": 3,
      "productLogo": "${ImageStringGlobalVariables.imagePath}bmw_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}driving_mirror_temporary.png",
      "productType": "featured",
      "productNature": "Used",
      "isLiked": false,
      "cost": "2,000",
      "productName": "Corolla Side Mirror",
      "mileage": 3,
      "productLogo": "",
      "driveType": "Automatic",
      "location": "Accra"
    }
  ];
}
