import 'package:ahwa_manager_app/core/models/order_model.dart';
import 'package:ahwa_manager_app/features/orders/logic/order_repos/order_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());
  OrderRepo orderRepo;
  TextEditingController customerController = TextEditingController();
  TextEditingController spacialInstructionsController = TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey();
 List<String> drinksList = [
  "choose a drink",
  "Shai",
  "Turkish Coffee",
  "Hibiscus Tea",
  "Espresso",
];
  String ? dropdownValue;
  void changeDrink(String? value) {
  dropdownValue = value;
  emit(OrderDrinkChanged());
}
  Future<void> addOrder() async {
    emit(OrderLoading());
    await orderRepo.addOrder(
      OrderModel(
        customerName: customerController.text,
        drinkId: dropdownValue!,
        specialInstructions: spacialInstructionsController.text,
        createdAt:DateFormat('d MMMM yyyy').format(DateTime.now()).toString(),
      ),
    );
    emit(OrderSuccess());
  }
  
  Future<void> getOrders() async {
    emit(OrderLoading());
    final orders = await orderRepo.getOrders();
    emit(GetOrdersSuccess(orders));
  }
  Future <void> deleteOrder(int id) async {
    emit(OrderLoading());
    await orderRepo.deleteOrder(id);
    emit(OrderSuccess());
  }
  Future<void> updateOrder(OrderModel order) async {
    emit(OrderLoading());
    await orderRepo.updateOrder(order);
    emit(OrderSuccess());
  }
  void clearForm() {
    customerController.clear();
    spacialInstructionsController.clear();
    dropdownValue = null;
   
  }
}
