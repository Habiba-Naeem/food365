import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/admin/admin.dart';
import 'package:food365/domain/services/admin_service.dart';
import 'package:food365/domain/services/auth_service.dart';
import 'package:food365/presentation/modules/admin/admin_screen.dart';
import 'package:food365/presentation/modules/admin/auth/login.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatelessWidget {
  static const String id = 'authenticate screen';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print(AuthService().getUser());
          if (snapshot.hasData) {
            AuthService().getUser();
            return AdminScreen();
          }

          return LogIn();
        });
  }
}
