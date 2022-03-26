class OrderItem {
  bool cookingStatus = false;
  bool serviceStatus = false;
  bool readyStatus = false;
  String menuItemID;
  int quantity;

  OrderItem({
    required this.menuItemID,
    required this.quantity,
  });
  
}
