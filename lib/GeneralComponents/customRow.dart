import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final IconData backIcon;
  const CustomRow({
    super.key,
    required this.icon,
    required this.text,
    this.backIcon = Icons.arrow_forward_ios});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
            Icon(icon,size: 30,),
            const SizedBox(width: 25,),
            Text(text,style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
          ],),
        ),
        Icon(backIcon,size: 20,color: Colors.red,)
      ],
    );
  }
}

