import 'package:firebase_auth/firebase_auth.dart';
import 'package:food365/domain/models/modules/admin/admin.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signIn({ String email,  String password}) async {
    try {
      print("email");
      print(email);
      print(password);
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password:password,
      );
      print("signed in");
      return result;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signUp({ String email,  String password}) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //await signIn(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    await auth.signOut();
  }

  dynamic getUser() {
    final User user = auth.currentUser;
    return user != null ? user : null;
  }
}