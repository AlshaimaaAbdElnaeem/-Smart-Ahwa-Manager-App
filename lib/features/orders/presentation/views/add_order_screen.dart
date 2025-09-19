import 'package:ahwa_manager_app/core/helpers/app_responsive.dart';
import 'package:ahwa_manager_app/core/models/order_model.dart';
import 'package:ahwa_manager_app/core/widgets/custom_appbar.dart';
import 'package:ahwa_manager_app/features/orders/presentation/manager/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_constant.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/widgets/custom_botton.dart';
import '../widgets/custom_TextFrom.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    customerController.dispose();
    spacialInstructionsController.dispose();
    super.dispose();
  }

  TextEditingController customerController = TextEditingController();
  TextEditingController spacialInstructionsController = TextEditingController();
  String? dropdownValue;
  GlobalKey<FormState> formKey = GlobalKey();
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
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            var cubit = context.read<OrderCubit>();
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextfrom(
                      controller: customerController,
                      labelText: 'Customer Name',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: DropdownButtonFormField<String>(
                        validator: (value) =>
                            value == null || value == 'choose a drink'
                            ? 'Required'
                            : null,
                        isExpanded: true,
                        padding: EdgeInsets.all(12),
                        value: dropdownValue ?? drinksList.first,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items: drinksList.map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    CustomTextfrom(
                      controller: spacialInstructionsController,
                      labelText: 'Spicial Instructions',
                      maxLines: 5,
                    ),
                    state is OrderLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomBotton(
                            title: 'Add Order',
                            onPressed: (){
                              if (formKey.currentState!.validate()) {
                                cubit.addOrder(
                                  OrderModel(
                                    customerName: customerController.text.trim(),
                                    drinkId: dropdownValue!,
                                    specialInstructions:
                                        spacialInstructionsController.text.trim(),
                                    createdAt: DateFormat(
                                      'd MMMM yyyy',
                                    ).format(DateTime.now()).toString(),
                                  ),
                                );
                                clearForm();
                              }
                            },
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void clearForm() {
    customerController.clear();
    spacialInstructionsController.clear();
    dropdownValue = null;
  }
}
