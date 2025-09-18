import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title,
  });
final String title ;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(title ,style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
      centerTitle: true,
      backgroundColor: Colors.deepOrangeAccent );
  }
}