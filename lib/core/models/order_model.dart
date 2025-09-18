enum OrderStatus { pending, completed }

class OrderModel {
   String? id;
  final String customerName;
  final String drinkId;
  final String specialInstructions;
  final DateTime createdAt;
  OrderStatus status;

  OrderModel({
     this.id,
    required this.customerName,
    required this.drinkId,
    required this.specialInstructions,
    required this.createdAt,
    this.status = OrderStatus.pending,
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