part of 'order_cubit.dart';
abstract  class OrderState {}

final class OrderInitial extends OrderState {}
final class OrderSuccess extends OrderState {}
final class OrderLoading extends OrderState {}
class GetOrdersSuccess extends OrderState {
  final List<OrderModel> orders;
  GetOrdersSuccess(this.orders);

}
