import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class ImageService {
  final storageRef = FirebaseStorage.instance.ref();

  getImage({
    menuItemId,
  }) async {
    print(menuItemId);
    final _firebaseStorage = FirebaseStorage.instance;
    final imageUrl = await _firebaseStorage
        .ref()
        .child("images/" + menuItemId)
        .getDownloadURL();
    // final imageUrl = "assets/images/menu_items/mexican.png";
    print(imageUrl);
    return imageUrl;
  }

  uploadImage({
    File image,
    menuItemId,
  }) async {
    final _firebaseStorage = FirebaseStorage.instance;
    //var file = File(image.path);
    print(image);
    if (image != null) {
      var snapshot =
          await _firebaseStorage.ref("images/" + menuItemId).putFile(image);
    } else {
      print('No Image Path Received');
    }
  }
}
