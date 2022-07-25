import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food365/domain/models/modules/admin/admin.dart';

class AdminService {
  final String uid;
  AdminService({ this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<Admin> getUser() {
    DocumentReference documentReferencer = userCollection.doc(uid);
    return documentReferencer.get().then((snapshot) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return Admin(name: data['name'], uid: uid);
    });
  }
}
