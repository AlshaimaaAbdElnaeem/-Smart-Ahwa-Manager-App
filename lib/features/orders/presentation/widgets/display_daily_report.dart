import 'package:ahwa_manager_app/features/orders/logic/model/daily_report_model.dart';
import 'package:flutter/material.dart';

class DisplayDailyReport extends StatelessWidget {
  const DisplayDailyReport({
    super.key,
    required this.dailyReport,
  });

  final DailyReport dailyReport;

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      color: Colors.deepOrangeAccent.shade100,
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: [
          const Text('Orders Today Count',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(dailyReport.totalOrders.toString(),
              style: const TextStyle(fontSize: 18)),
        ],
      ),
      Column(
        children: [
           Text("Top Drink",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(dailyReport.topDrink,
              style: const TextStyle(fontSize: 18)),
        ],
      ),
    ],
                        ),
                      ),
                    ),
        );
  }
}