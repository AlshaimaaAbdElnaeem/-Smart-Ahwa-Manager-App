import 'package:ahwa_manager_app/core/models/order_model.dart';
import 'package:ahwa_manager_app/features/orders/logic/order_repos/order_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  OrderRepo orderRepo;
  TextEditingController customerController = TextEditingController();
  TextEditingController drinkController = TextEditingController();
  TextEditingController spacialInstructionsController = TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey();
  Future<void> addOrder() async {
    emit(AddOrderLoading());
    await orderRepo.addOrder(
      OrderModel(
        customerName: customerController.text,
        drinkId: drinkController.text,
        specialInstructions: spacialInstructionsController.text,
        createdAt: DateTime.now(),
      ),
    );
    emit(AddOrderSuccess());
  }
}
