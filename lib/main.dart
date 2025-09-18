import 'package:ahwa_manager_app/core/helpers/sql_helper.dart';
import 'package:ahwa_manager_app/features/orders/logic/order_cubit/order_cubit.dart';
import 'package:ahwa_manager_app/features/orders/logic/order_repos/order_repo_implementation.dart';
import 'package:ahwa_manager_app/features/orders/presentation/views/all_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlHelper().inialDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(OrderRepoImplementation())..getOrders(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: AllOrders()),
    );
  }
}
