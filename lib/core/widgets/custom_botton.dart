import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.title, this.onPressed});
final String title ;
final void Function()?  onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
    color: Colors.deepOrangeAccent,
    onPressed: onPressed,
    padding: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
            title,
            style: TextStyle(color: Colors.white,
             fontSize: 20 ,
              fontWeight: FontWeight.bold),
            ),
            );
  }
}