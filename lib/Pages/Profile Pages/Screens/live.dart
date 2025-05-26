import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/CardContainers/carCard.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  List<Map<String, String?>> cars = [
    {
      "image": "assets/images/audi.png",
      "name": "Audi A3",
      "price": "GH 170,000",
      "logo": "assets/images/audi_logo.png",
      "carType": "Automatic",
      "promoted": "Promoted"
    },
    {
      "image": "assets/images/benz.png",
      "name": "Audi A3",
      "price": "GH 170,000",
      "logo": "assets/images/mercedes_logo.png",
      "carType": "Automatic",
      "promoted": null,
    },
    {
      "image": "assets/images/audi.png",
      "name": "Audi A3",
      "price": "GH 170,000",
      "logo": "assets/images/audi_logo.png",
      "carType": "Automatic",
      "promoted": null,
    },
    {
      "image": "assets/images/audi.png",
      "name": "Audi A3",
      "price": "GH 170,000",
      "logo": "assets/images/audi_logo.png",
      "carType": "Automatic",
      "promoted": null,
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine how many columns based on the screen width
    int crossAxisCount = 2;
    if(screenWidth <= 400){
      crossAxisCount = 1;
    }
    if (screenWidth >= 800) {
      crossAxisCount = 3; // On larger screens, show 3 columns
    }
    if (screenWidth >= 1200) {
      crossAxisCount = 4; // On extra-large screens, show 4 columns
    }

    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            var car = cars[index];
            return SizedBox(
              width: screenWidth / crossAxisCount - 20,
              child: CarCard(
                image: car["image"]!,
                name: car["name"]!,
                price: car["price"]!,
                logo: car["logo"]!,
                carType: car["carType"]!,
                promoted: car["promoted"],
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Dynamic column count
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.95, // Maintain square aspect ratio for the cards
          ),
        ),
      ),
    );
  }
}
