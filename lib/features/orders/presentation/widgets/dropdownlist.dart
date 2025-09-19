import 'package:ahwa_manager_app/features/orders/presentation/manager/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrdersDropdownButton extends StatelessWidget {
  const OrdersDropdownButton({super.key});
  @override
  Widget build(BuildContext context) {
   var cubit = context.read<OrderCubit>();
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: DropdownButton<String>(
            isExpanded: true,
            padding: EdgeInsets.all(12),
            value: cubit.dropdownValue ?? cubit.drinksList.first,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
            onChanged: (String? value) => cubit.changeDrink(value),
            items: cubit.drinksList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        );
      },
    );
  }
}
