import 'package:flutter/material.dart';

class EVPage extends StatelessWidget {
  const EVPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.red),
      child: Text("hello world 1"),
    );
  }
}