import 'package:food365/domain/models/modules/inventory/inventory_item_model.dart';

class InventoryModel {
  List<InventoryItemModel> inventoryItems = [];

  InventoryModel({
    required this.inventoryItems,
  });
  factory InventoryModel.fromJson({
    required json,
    required key,
  }) {
    List<InventoryItemModel> items = json['items'] != null
        ? List<InventoryItemModel>.from(json['items']
            .map((x) => InventoryItemModel.fromJson(json: x))
            .toList())
        : [];

    return InventoryModel(inventoryItems: items);
  }

  Map<String, dynamic> toJson() => {
        "inventoryItems": inventoryItems,
      };
}
