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
    // this.orderItemID,
     this.cookingStatus,
     this.serviceStatus,
     this.readyStatus,
     this.menuItemID,
     this.menuName,
    // this.menuItemTime,
     this.quantity,
  });

  factory OrderItem.fromJson({
     json
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
    // this.orderItemID,
     this.menuItemID,
     this.menuName,
     this.quantity,
   //  this.menuItemTime,
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
