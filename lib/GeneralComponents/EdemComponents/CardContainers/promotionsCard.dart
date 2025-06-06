import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class PromotionCard extends StatelessWidget {
  final String startText;
  final String endText;

  const PromotionCard({
    super.key,
    required this.startText,
    required this.endText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorGlobalVariables.whiteColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 4), // bottom shadow
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(startText,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            Text(endText,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
          ],
        ),
      ),
    );


  }
}
