import 'package:ahwa_manager_app/core/helpers/sql_helper.dart';
import 'package:ahwa_manager_app/core/models/order_model.dart';
import 'package:ahwa_manager_app/features/orders/logic/order_repos/order_repo.dart';


class OrderRepoImplementation extends OrderRepo{
  @override
  Future<void> addOrder(OrderModel order) async{
try {
 await SqlHelper().insertData(order);
} catch (e) {
  print(e);
}
  }

  @override
  Future<List<OrderModel>> getOrders() async{
    try {
      return await SqlHelper().getData();
    } catch (e) {
      print(e);
      return [];
    }
    
  }
  
  @override
  Future<void> deleteOrder(int id) async{
    try {
      await SqlHelper().delete(id);
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Future<void> updateOrder(OrderModel order) async{
   try {
     await SqlHelper().update(order);
   } catch (e) {
     print(e);
   }
  }




}