class NewOrderItemEntity {
  final String itemId;
  final int quantity;

  NewOrderItemEntity({required this.itemId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {'itemId': itemId, 'quantity': quantity};
  }
}
