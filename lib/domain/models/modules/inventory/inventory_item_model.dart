class InventoryItemModel {
  String itemID;
  String itemName;
  int quantity;
  DateTime boughtDate;
  DateTime expiryDate;
  bool expired = false;

  InventoryItemModel(
      { this.itemID,
       this.itemName,
       this.quantity,
       this.boughtDate,
       this.expiryDate,
       this.expired});

  InventoryItemModel.postMenu({
     this.itemName,
     this.boughtDate,
     this.expiryDate,
     this.quantity,
  });

  factory InventoryItemModel.fromJson({
     json,
     key,
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
