import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
              title: Text(
                "Customer Name",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  "Spacial Instructions",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 20,
                  ),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  )),
            );
  }
}