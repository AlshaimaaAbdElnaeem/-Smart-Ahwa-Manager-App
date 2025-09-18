import 'package:ahwa_manager_app/core/helpers/app_responsive.dart';
import 'package:ahwa_manager_app/core/widgets/custom_appbar.dart';
import 'package:ahwa_manager_app/features/orders/logic/cubit/add_order_cubit.dart';
import 'package:ahwa_manager_app/features/orders/logic/order_repos/order_repo_implementation.dart';
import 'package:ahwa_manager_app/features/orders/presentation/widgets/dropdownlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_toast.dart';
import '../../../../core/widgets/custom_botton.dart';
import '../widgets/custom_TextFrom.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({super.key});
  @override
  
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(OrderRepoImplementation()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            AppResponsive.height(context, value: 50),
          ),
          child: CustomAppBar(title: 'Add Order'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocConsumer<AddOrderCubit, AddOrderState>(
            listener: (context, state) {
             if (state is AddOrderSuccess) {
              AppToast.showSuccessToast('Order Added Successfully');
              }
            },
            builder: (context, state){
             var cubit = context.read<AddOrderCubit>();
              return ListView(
              children: [
                CustomTextfrom(
                  controller: cubit.customerController,
                  labelText: 'Customer Name',
                  fKey: cubit.formKey,
                ),
                OrdersDropdownButton(),
                CustomTextfrom(
                  controller: cubit.spacialInstructionsController,
                  labelText: 'Spicial Instructions',
                  maxLines: 5,
                  fKey: GlobalKey(),
                ),
                CustomBotton(title: 'Add Order', onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                   cubit.addOrder();
                  }
                }),
              ],
            );
         
            }, ),
        ),
      ),
    );
  }
}
