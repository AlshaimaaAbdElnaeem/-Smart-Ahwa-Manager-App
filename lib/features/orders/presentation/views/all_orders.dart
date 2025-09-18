import 'package:ahwa_manager_app/core/helpers/app_responsive.dart';
import 'package:ahwa_manager_app/core/widgets/custom_appbar.dart';
import 'package:ahwa_manager_app/features/orders/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppResponsive.height(context, value: 50)),
        child: CustomAppBar(title: "All Orders")),
        body: ListView(
          children: const [
            CustomContainer(),
          ],
        )
    );
  }
}