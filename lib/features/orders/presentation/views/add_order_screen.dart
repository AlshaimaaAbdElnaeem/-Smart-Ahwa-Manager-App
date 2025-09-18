import 'package:ahwa_manager_app/core/helpers/app_responsive.dart';
import 'package:ahwa_manager_app/core/widgets/custom_appbar.dart';
import 'package:ahwa_manager_app/features/orders/logic/order_cubit/order_cubit.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          AppResponsive.height(context, value: 50),
        ),
        child: CustomAppBar(title: 'Add Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
           if (state is OrderSuccess) {
            AppToast.showSuccessToast('Order Added Successfully');
            }
          },
          builder: (context, state){
           var cubit = context.read<OrderCubit>();
            return Form(
              key: cubit.formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextfrom(
                    controller: cubit.customerController,
                    labelText: 'Customer Name',
                    
                  ),
                  OrdersDropdownButton(
    
                  ),
                  CustomTextfrom(
                    controller: cubit.spacialInstructionsController,
                    labelText: 'Spicial Instructions',
                    maxLines: 5,
                  
                  ),
                 state is OrderLoading ? const Center(child: CircularProgressIndicator(),) :
                  CustomBotton(title: 'Add Order', onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                     cubit.addOrder();
                     cubit.clearForm();
                    }
                  }),
                ],
                            ),
            );
          }, ),
      ),
    );
  }
}
