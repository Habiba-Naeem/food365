class InventoryItemModel {
  String? itemID;
  String itemName;
  int quantity;
  DateTime boughtDate;
  DateTime expiryDate;
  bool expired = false;

  InventoryItemModel(
      {required this.itemID,
      required this.itemName,
      required this.quantity,
      required this.boughtDate,
      required this.expiryDate,
      required this.expired});

  InventoryItemModel.postMenu({
    required this.itemName,
    required this.boughtDate,
    required this.expiryDate,
    required this.quantity,
  });

  factory InventoryItemModel.fromJson({
    required json,
    required key,
  }) {
    return InventoryItemModel(
        itemID: key,
        itemName: json['item_name'],
        boughtDate: DateTime.parse(json['bought_date']),
        expiryDate: DateTime.parse(json['expiry_date']),
        quantity: json['quantity'],
        expired: json['expired']);
  }

  Map<String, dynamic> toJson() => {
        // "itemID": itemID,
        "item_name": itemName,
        "bought_date": boughtDate.toIso8601String(),
        "expiry_date": expiryDate.toIso8601String(),
        "quantity": quantity,
        "expired": expired
        //"menuItemTime": menuItemTime
      };

  int get daysTillExpiry {
    return (expiryDate.difference(boughtDate).inHours / 24).round();
  }
}
