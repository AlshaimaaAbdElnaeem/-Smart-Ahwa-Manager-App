import 'package:ahwa_manager_app/core/helpers/app_responsive.dart';
import 'package:ahwa_manager_app/core/widgets/custom_appbar.dart';
import 'package:ahwa_manager_app/features/orders/logic/model/daily_report_model.dart';
import 'package:ahwa_manager_app/features/orders/presentation/manager/report_service.dart';
import 'package:ahwa_manager_app/features/orders/presentation/views/add_order_screen.dart'
    show AddOrder;
import 'package:ahwa_manager_app/features/orders/presentation/widgets/custom_card.dart';
import 'package:ahwa_manager_app/features/orders/presentation/widgets/display_daily_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/order_cubit/order_cubit.dart'
    show OrderCubit, OrderLoading, OrderState, GetOrdersSuccess;

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrderCubit>().getOrders();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          AppResponsive.height(context, value: 50),
        ),
        child: CustomAppBar(title: "Report Orders"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddOrder()),
          );
        },
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetOrdersSuccess) {
            return FutureBuilder<DailyReport>(
              future: ReportService().getDailyReport(state.orders),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final dailyReport = snapshot.data!;

                return Column(
                  children: [
                    DisplayDailyReport(dailyReport: dailyReport),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.orders.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: CustomCard(order: state.orders[index]),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: Text("No Orders"));
          }
        },
      ),
    );
  }
}
