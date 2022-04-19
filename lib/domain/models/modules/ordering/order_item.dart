class OrderItem {
  bool cookingStatus = false;
  bool serviceStatus = false;
  bool readyStatus = false;
  String menuItemID;
  String menuName;
  int quantity;

  OrderItem({
    required this.menuItemID,
    required this.menuName,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        "menuItemID": menuItemID,
        "menuName": menuName,
        "cookingStatus": cookingStatus,
        "serviceStatus": serviceStatus,
        "readyStatus": readyStatus,
        "quantity": quantity,
      };
}
