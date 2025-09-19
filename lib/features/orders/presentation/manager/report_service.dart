import 'package:ahwa_manager_app/core/models/order_model.dart';
import 'package:ahwa_manager_app/features/orders/logic/model/daily_report_model.dart';
import 'package:intl/intl.dart';

class ReportService {
    Future<DailyReport> getDailyReport(List<OrderModel> orders) async{
    final today = DateFormat('d MMMM yyyy').format(DateTime.now()).toString();
 final List<OrderModel> todayOrders = orders.where((order) {
      return order.createdAt == today;
    }).toList();
    int totalOrdersLength = orders.length;
    final Map<String , int> drinksCount = {};
    for (var order in todayOrders) {
      if (drinksCount.containsKey(order.drinkId)) {
        drinksCount[order.drinkId] = drinksCount[order.drinkId]! + 1;
      } else {
        drinksCount[order.drinkId] = 1;
      }
    }
      String topDrink = drinksCount.isNotEmpty
        ? drinksCount.entries.reduce((a, b) => a.value > b.value ? a : b).key
        : "No Orders";
return DailyReport(date: today, totalOrders: totalOrdersLength, topDrink: topDrink);
  
  }
}