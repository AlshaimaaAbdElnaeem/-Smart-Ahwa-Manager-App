
import '../../../../core/models/order_model.dart';

abstract class OrderRepo {
  Future<void> addOrder(OrderModel order);
  Future<List<OrderModel>> getOrders();
  Future<void> updateOrder(OrderModel order);
  Future<void> deleteOrder(int id);
}