import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.prefixImage});
final String hintText;
final  String prefixImage;
  @override
  Widget build(BuildContext context) {
    return    Container(
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(50, 50, 71, 0.05),
                        offset: Offset(0, 3),
                        blurRadius: 8,
                        spreadRadius: -1,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(12, 26, 75, 0.24),
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(fontWeight: FontWeight.w600,fontSize:16 ,color: Color.fromRGBO(168, 175, 185, 1) ),
                      
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset(
                          prefixImage, // 👈 Replace with your image path
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                );
                
  }
}