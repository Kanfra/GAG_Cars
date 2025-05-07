import 'package:flutter/material.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Text('Good bye world'),
    );
  }
}