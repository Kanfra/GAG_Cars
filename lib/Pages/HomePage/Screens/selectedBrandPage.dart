import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:get/get.dart';

class SelectedBrandPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const SelectedBrandPage({
    super.key,
    required this.allJson,
  });

  @override
  State<SelectedBrandPage> createState() => _SelectedBrandPageState();
}

class _SelectedBrandPageState extends State<SelectedBrandPage> {
  late final Map<String, dynamic> selectedBrand;
  late final String type;
  
  @override
  void initState(){
    super.initState();
    selectedBrand = widget.allJson['selectedBrand'];
    type = widget.allJson['type'];
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: Text(
          selectedBrand['name'],
          style: TextStyle(
            color: ColorGlobalVariables.brownColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_outlined, size: 24),
                color: Colors.black54,
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with results count
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "${recommendeds.length} vehicles found",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
              
              // Grid view
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: recommendeds.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isSmallScreen ? 1 : 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: isSmallScreen ? 1.6 : 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final recommended = recommendeds[index];
                    return _buildVehicleCard(recommended, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleCard(Map<String, dynamic> recommended, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product detail page
        print('Product tapped: ${recommended["productName"]}');
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
                Container(
                  height: 120,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      recommended["productImage"],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[100],
                          child: Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey[400]),
                          ),
                        );
                      },
                    ),
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
                      recommended["productType"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                // Favorite Button
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        recommended["isLiked"] = !recommended["isLiked"];
                      });
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
                        recommended["isLiked"] ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: recommended["isLiked"] 
                            ? ColorGlobalVariables.redColor 
                            : Colors.black54,
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
                          recommended["productName"],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: recommended["productNature"] == "New" 
                              ? Colors.green.withOpacity(0.1)
                              : Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          recommended["productNature"],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: recommended["productNature"] == "New" 
                                ? Colors.green
                                : Colors.blue,
                          ),
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
                        "GH₵${recommended["cost"]}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorGlobalVariables.redColor,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.speed, size: 14, color: Colors.grey[600]),
                          SizedBox(width: 4),
                          Text(
                            "${recommended["mileage"]} km",
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
                      // Brand logo
                      recommended["productLogo"].isEmpty 
                          ? SizedBox(width: 24)
                          : Container(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                recommended["productLogo"],
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.business,
                                    size: 16,
                                    color: Colors.grey[400],
                                  );
                                },
                              ),
                            ),
                      
                      // Transmission type
                      Row(
                        children: [
                          Icon(Icons.settings, size: 14, color: Colors.grey[600]),
                          SizedBox(width: 4),
                          Text(
                            recommended["driveType"],
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      
                      // Location
                      Flexible(
                        child: Row(
                          children: [
                            Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                recommended["location"],
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

  List<Map<String, dynamic>> recommendeds = [
    {
      "productImage": "${ImageStringGlobalVariables.imagePath}honda_civic_temporary.png",
      "productType": "Featured",
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
      "productType": "Featured",
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
      "productType": "Featured",
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
      "productType": "Featured",
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
      "productType": "Featured",
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
      "productType": "Featured",
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