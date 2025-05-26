import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String logo;
  final String carType;
  final String? promoted;
  final IconData icon;

  const CarCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.logo,
    required this.carType,
    this.promoted,
    this.icon = Icons.settings_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300), // ✅ Only limit width
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.black),
              ),
              // elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // ✅ Let column size naturally
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child:
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(10),
                      //   child: Image.asset(
                      //     image,
                      //     height: MediaQuery.of(context).size.height / 13,
                      //     width: MediaQuery.of(context).size.width * 0.3,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      AspectRatio(
                        aspectRatio: 16 / 9.5, // You can tweak this value based on your images
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    ),
                    const SizedBox(height: 8),
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          logo,
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child:
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 1,
                                      height: 15,
                                      color: Colors.black,
                                    ),
                                    Icon(icon, size: 12),
                                    Container(
                                      width: 1,
                                      height: 15,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      carType,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  price,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        if (promoted != null)
          Positioned(
            top: 10,
            left: 10,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6,),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.green,
              ),
              child: Text(promoted!,style:
              const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
            ),
          ),
      ],
    );
  }
}
