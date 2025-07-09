import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/DotSeparator/dotSeparator.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textLarge.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:get/get.dart';

class EVPage extends StatefulWidget {
  // final String imagePath;
  // final String imageHeader;
  // final String imageDetails;
  // final String noOfComments;
  // final String noOfLikes;
  // final VoidCallback onLikeClickFunction;
  // final VoidCallback onMessageClickFunction;
  // final VoidCallback onUploadClickFunction;

  const EVPage({
    super.key,
    // required this.imagePath,
    // required this.imageHeader,
    // required this.imageDetails,
    // required this.noOfComments,
    // required this.noOfLikes,
    // required this.onLikeClickFunction,
    // required this.onMessageClickFunction,
    // required this.onUploadClickFunction
    });

  @override
  State<EVPage> createState() => _EVPageState();
}

class _EVPageState extends State<EVPage> {
  final List<Map<String, dynamic>> alls = [
    {
      "imagePath": "${ImageStringGlobalVariables.imagePath}all_image_one_temporary.png",
      "imageHeader": "Tesla Haults its car production",
      "imageDetail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore,Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
      "noOfComments": 96,
      "noOfLikes": 1.2,
      "userImage": "${ImageStringGlobalVariables.imagePath}user_profile_temporary.png",
      "userType": "Admin",
      "timePosted": "4 hours ago" 
    },
    {
      "imagePath": "${ImageStringGlobalVariables.imagePath}all_image_two_temporary.png",
      "imageHeader": "Range Rover's 2030 Model M",
      "imageDetail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
      "noOfComments": 96,
      "noOfLikes": 1.2,
      "userImage": "${ImageStringGlobalVariables.imagePath}user_profile_temporary.png",
       "userType": "Admin",
      "timePosted": "4 hours ago"
    },
    {
      "imagePath": "${ImageStringGlobalVariables.imagePath}all_image_one_temporary.png",
      "imageHeader": "Tesla Haults its car production",
      "imageDetail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
      "noOfComments": 96,
      "noOfLikes": 1.2,
      "userImage": "${ImageStringGlobalVariables.imagePath}user_profile_temporary.png",
       "userType": "Admin",
      "timePosted": "4 hours ago"
    },
    {
      "imagePath": "${ImageStringGlobalVariables.imagePath}all_image_two_temporary.png",
      "imageHeader": "Range Rover's 2030 Model M",
      "imageDetail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
      "noOfComments": 96,
      "noOfLikes": 1.2,
      "userImage": "${ImageStringGlobalVariables.imagePath}user_profile_temporary.png",
       "userType": "Admin",
      "timePosted": "4 hours ago"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alls.length,
      shrinkWrap: ColorGlobalVariables.trueValue,
      primary: ColorGlobalVariables.falseValue,
      itemBuilder: (context, index){
        final all = alls[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GestureDetector(
            onTap: (){
              Get.toNamed(
                RouteClass.getMainNewsPage(), 
                arguments: all
                );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ColorGlobalVariables.fadedBlackColor,
                  width: 0.08,
                ),
                color: ColorGlobalVariables.textFieldColor,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey,
                //     spreadRadius: 0.1,
                //     blurRadius: 0.1,
                //     offset: Offset(0.1, 0.1),
                //   )
                // ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //image
                  CustomImage(
                    imagePath: all["imagePath"],
                    imageHeight: 200,
                    imageWidth: double.infinity, 
                    imageBorderRadius: 12,
                    isAssetImage: true, 
                    fit: BoxFit.cover,
                    isImageBorderRadiusRequired: ColorGlobalVariables.trueValue,
                    ),
                  const SizedBox(height: 8,),
                  // header
                  TextLarge(
                    title: all["imageHeader"], 
                    fontWeight: FontWeight.bold, 
                    textColor: ColorGlobalVariables.blackColor
                    ),
                  const SizedBox(height: 2,),
                  // details
                  TextSmall(
                    title: all["imageDetail"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, 
                    fontWeight: FontWeight.normal, 
                    textColor: ColorGlobalVariables.blackColor
                    ),
                  const SizedBox(height: 5,),
                  //row for icons and comment, likes section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // icons section
                      Row(
                        children: [
                          // love
                          GestureDetector(
                            onTap: (){},
                            child: CustomIcon(
                              iconData: Icons.favorite_outline, 
                              isFaIcon: false, 
                              iconSize: 24,
                              iconColor: ColorGlobalVariables.redColor
                              ),
                          ),
                          const SizedBox(width: 10,),
                          // message
                          GestureDetector(
                            onTap: (){},
                            child: CustomIcon(
                              iconData: Icons.message_outlined, 
                              iconSize: 24,
                              isFaIcon: ColorGlobalVariables.falseValue, 
                              iconColor: ColorGlobalVariables.fadedBlackColor
                              ),
                          ),
                          const SizedBox(width: 10,),
                          // upload
                          GestureDetector(
                            onTap: (){},
                            child: CustomIcon(
                              iconData: FontAwesomeIcons.upload, 
                              iconSize: 24,
                              isFaIcon: true, 
                              iconColor: ColorGlobalVariables.fadedBlackColor
                              ),
                          ),
                        ],
                      ),
                      // comments, likes section
                      Row(
                        children: [
                          // comment
                          TextExtraSmall(
                            title: "${all["noOfComments"]} Comments ", 
                            textColor: ColorGlobalVariables.fadedBlackColor
                            ),
                          //const SizedBox(width: 1,),
                          DotSeparator(),
                          //const SizedBox(width: 1,),
                          // likes
                          TextExtraSmall(
                            title: " ${all["noOfLikes"]}k Likes", 
                            textColor: ColorGlobalVariables.fadedBlackColor
                            ),
                        ],
                      ),
                    ],
                  ),
                
                ],
                ),
            ),
          ),
        );
      }
      );
  }
}