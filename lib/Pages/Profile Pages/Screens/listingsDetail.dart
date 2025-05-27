
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';

class ListingDetailPage extends StatefulWidget {
  const ListingDetailPage({super.key});

  @override
  State<ListingDetailPage> createState() => _ListingDetailPageState();
}

class _ListingDetailPageState extends State<ListingDetailPage> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> cars = [
    {
      "name": "Audi 23",
      "price": "GH₵ 170,000",
      "image": "assets/images/audi.png",
      "info": """Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      """,
      "highlights": [
        {"title": "Model Year", "value": "2020"},
        {"title": "Mileage", "value": "Used"},
        {"title": "Fuel Type", "value": "Petrol"},
        {"title": "Engine", "value": "Petrol"},
        {"title": "Drive", "value": "Petrol"},
      ],
      "specifications": [
        {"title": "Make", "value": "Audi"},
        {"title": "Model", "value": "Civic"},
        {"title": "Color", "value": "Red"},
        {"title": "Seats", "value": "4 Seats"},
        {"title": "Registered", "value": "No"},
      ],
    },
    {
      "name": "Toyota Camry",
      "price": "GH₵ 120,000",
      "image": "assets/images/benz.png",
      "info": "Reliable and fuel-efficient sedan. Good for city and long-distance driving.",
      "highlights": [
        {"title": "Model Year", "value": "2019"},
        {"title": "Mileage", "value": "Used"},
        {"title": "Fuel Type", "value": "Petrol"},
        {"title": "Engine", "value": "2.5L"},
        {"title": "Drive", "value": "FWD"},
      ],
      "specifications": [
        {"title": "Make", "value": "Audi"},
        {"title": "Model", "value": "Civic"},
        {"title": "Color", "value": "Ash"},
        {"title": "Seats", "value": "4 Seats"},
        {"title": "Registered", "value": "No"},
      ]
    },
    {
      "name": "BMW X5",
      "price": "GH₵ 250,000",
      "image": "assets/images/car.png",
      "info": "Luxury SUV with premium features and powerful engine.",
      "highlights": [
        {"title": "Model Year", "value": "2021"},
        {"title": "Mileage", "value": "New"},
        {"title": "Fuel Type", "value": "Diesel"},
        {"title": "Engine", "value": "3.0L"},
        {"title": "Drive", "value": "AWD"},
      ],
      "specifications": [
        {"title": "Make", "value": "Audi"},
        {"title": "Model", "value": "Civic"},
        {"title": "Color", "value": "Red"},
        {"title": "Seats", "value": "4 Seats"},
        {"title": "Registered", "value": "No"},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final car = cars[selectedIndex];
    final carHighlights = List<Map<String, String>>.from(car["highlights"] ?? []);
    final carSpecifications = List<Map<String, String>>.from(car["specifications"] ?? []);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          onLeadingIconClickFunction: () {},
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back_ios_new_outlined,
          titleText: car["name"] ?? "Car Details",
          titleTextColor: ColorGlobalVariables.redColor,
          centerTitle: true,
          appbarBackgroundColor: ColorGlobalVariables.whiteColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: ColorGlobalVariables.blackColor),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: ColorGlobalVariables.blackColor),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share, color: ColorGlobalVariables.blackColor),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: size * 0.25,
                  color: ColorGlobalVariables.whiteColor,
                  child: Image.asset(car["image"]!, fit: BoxFit.contain),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cars.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: index == selectedIndex ? Colors.orange : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(
                              cars[index]['image']!,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(car["name"]!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(car["price"]!, style: const TextStyle(color: ColorGlobalVariables.redColor)),
                const SizedBox(height: 15),
                Text(car["info"]!, style: const TextStyle(color: Colors.black26)),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(width: 10),
                    Text("Haatso, Greater Accra"),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.refresh_outlined),
                    SizedBox(width: 10),
                    Text("08 May 2024: Greater Accra"),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                        color: ColorGlobalVariables.greyColor,
                        child: const Text("Warranty"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                        color: Colors.lightBlueAccent,
                        child: const Row(
                          children: [
                            Text("Verified Seller"),
                            SizedBox(width: 6),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: ColorGlobalVariables.blueColor,
                              child: Icon(Icons.check, size: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Text("Highlights:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: carHighlights.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(carHighlights[index]["title"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(carHighlights[index]["value"]!),
                            const SizedBox(height: 8),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // const SizedBox(height: 15),
                const Text("Specifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: carSpecifications.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(carSpecifications[index]["title"]!, style: const TextStyle(color: Colors.black26),),
                            Text(carSpecifications[index]["value"]!,style:   const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: const Row(
                        children: [
                          Text("Mark as Sold",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                          SizedBox(width: 12,),
                          Icon(Icons.check,size: 25,)
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: const Row(
                        children: [
                          Text("Promote",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                          SizedBox(width: 12,),
                          Icon(FontAwesomeIcons.bullhorn,size: 25,)
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
