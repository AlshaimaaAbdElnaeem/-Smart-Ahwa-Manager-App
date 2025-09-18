import 'package:ahwa_manager_app/core/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/order_cubit/order_cubit.dart' show OrderCubit;

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OrderCubit>();
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepOrangeAccent.withOpacity(0.9),
              Colors.orangeAccent.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Text(
                  order.createdAt,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.customerName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    final updatedOrder = OrderModel(
                      id: order.id,
                      customerName: order.customerName,
                      drinkId: order.drinkId,
                      specialInstructions: order.specialInstructions,
                      createdAt: order.createdAt,
                      status: "Completed",
                    );

                    cubit.updateOrder(updatedOrder);
                    cubit.getOrders();
                  },
                  child: Chip(
                    label: Text(
                      order.status,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: order.status == 'Completed'
                        ? Colors.green
                        : Colors.redAccent,

                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Drink type
            Text(
              "Drink: ${order.drinkId}",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 6),
            // Special instructions
            Text(
              "Instructions: ${order.specialInstructions}",
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
