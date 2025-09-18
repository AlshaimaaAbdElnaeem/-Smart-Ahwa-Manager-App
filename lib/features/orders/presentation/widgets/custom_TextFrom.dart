import 'package:flutter/material.dart';

class CustomTextfrom extends StatelessWidget {
  const CustomTextfrom(
      {super.key,
      required this.labelText,
      required this.controller,
 
      this.maxLines
      });
  final String labelText;
  final TextEditingController controller;

   final int? maxLines ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.deepOrangeAccent,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepOrangeAccent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepOrangeAccent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
     
        border: const OutlineInputBorder(
          
          borderRadius: BorderRadius.all(
            
            Radius.circular(15),
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return "please , Enter $labelText";
        } else {
          return null;
        }
      },
    );
  }
}
