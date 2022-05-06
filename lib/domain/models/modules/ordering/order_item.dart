class OrderItem {
  bool cookingStatus = false;
  bool serviceStatus = false;
  bool readyStatus = false;
  String menuItemID;
  String menuName;
  //Duration menuItemTime;

  int quantity;
  //int orderItemID;

  OrderItem({
    //required this.orderItemID,
    required this.cookingStatus,
    required this.serviceStatus,
    required this.readyStatus,
    required this.menuItemID,
    required this.menuName,
    //required this.menuItemTime,
    required this.quantity,
  });

  factory OrderItem.fromJson({
    required json
  }){
    return OrderItem(
cookingStatus: json['cookingStatus'],
              readyStatus: json['readyStatus'],
              serviceStatus: json['serviceStatus'],
              menuItemID: json['menuItemID'],
              menuName: json['menuName'],
              quantity: json['quantity'],

    );
}

  //factory OrderItem.fromJson(){};

  OrderItem.postOrderItem({
    //required this.orderItemID,
    required this.menuItemID,
    required this.menuName,
    required this.quantity,
   // required this.menuItemTime,
  });

  getStatus() {
    if (serviceStatus != true) {
      if (readyStatus != true) {
        if (cookingStatus != true) {
          return 0;
        } else {
          return 1;
        }
      } else {
        return 2;
      }
    } else {
      return 3;
    }
  }

  Map<String, dynamic> toJson() => {
        "menuItemID": menuItemID,
        "menuName": menuName,
        "cookingStatus": cookingStatus,
        "serviceStatus": serviceStatus,
        "readyStatus": readyStatus,
        "quantity": quantity,
        //"menuItemTime": menuItemTime
      };
}
