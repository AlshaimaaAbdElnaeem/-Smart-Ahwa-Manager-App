import 'package:ahwa_manager_app/core/models/order_model.dart';
import 'package:ahwa_manager_app/features/orders/logic/order_repos/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());
  final OrderRepo orderRepo;




  Future<void> addOrder(OrderModel order) async {
    emit(OrderLoading());
    await orderRepo.addOrder(
       order 
    );
    await getOrders();
    emit(OrderSuccess());
  }

  Future<void> getOrders() async {
    emit(OrderLoading());
    final orders = await orderRepo.getOrders();
    emit(GetOrdersSuccess(orders));
  }

  Future<void> deleteOrder(int id) async {
    emit(OrderLoading());
    await orderRepo.deleteOrder(id);
    final orders = await orderRepo.getOrders();
    emit(GetOrdersSuccess(orders));
  }

  Future<void> updateOrder(OrderModel order) async {
    emit(OrderLoading());
    await orderRepo.updateOrder(order);
    final orders = await orderRepo.getOrders();
    emit(GetOrdersSuccess(orders));
  }
  
}
