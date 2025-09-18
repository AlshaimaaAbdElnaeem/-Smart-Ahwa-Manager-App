import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class OrdersDropdownButton extends StatefulWidget {
  const OrdersDropdownButton({super.key});

  @override
  State<OrdersDropdownButton> createState() => _OrdersDropdownButtonState();
}

class _OrdersDropdownButtonState extends State<OrdersDropdownButton> {
  String dropdownValue = list.first;

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 15),
      child: DropdownButton<String>(
        padding: EdgeInsets.all(12),
        value: dropdownValue,
        elevation: 16,
        style: const TextStyle(color: Colors.deepOrangeAccent),
        borderRadius: BorderRadius.circular(12),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
    
  }
}