enum OrderStatus { pending, completed }

class OrderModel {
   int? id;
  final String customerName;
  final String drinkId;
  final String specialInstructions;
  final String createdAt;
  String status;

  OrderModel({
     this.id,
    required this.customerName,
    required this.drinkId,
    required this.specialInstructions,
    required this.createdAt,
    this.status = "pending",
  });
  toMap() {
    return {
      'id': id,
      'customerName': customerName,
      'drinkId': drinkId,
      'specialInstructions': specialInstructions,
      'createdAt': createdAt,
      'status': status.toString(),
    };
  }
}