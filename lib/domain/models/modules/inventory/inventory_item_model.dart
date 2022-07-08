class InventoryItemModel {
  String? itemID;
  String itemName;
  int quantity;
  DateTime boughtDate;
  DateTime expiryDate;

  InventoryItemModel({
    //required this.itemID,
    required this.itemName,
    required this.quantity,
    required this.boughtDate,
    required this.expiryDate,
  });

  factory InventoryItemModel.fromJson({
    required json,
    //required key,
  }) {
    return InventoryItemModel(
     // itemID: key,
      itemName: json['item_name'],
      boughtDate: DateTime.parse(json['bought_date']),
      expiryDate: DateTime.parse(json['expiry_date']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
       // "itemID": itemID,
        "item_name": itemName,
        "bought_date": boughtDate.toIso8601String(),
        "expiry_date": expiryDate.toIso8601String(),
        "quantity": quantity,
        //"menuItemTime": menuItemTime
      };
}
