import 'package:flutter/material.dart';

import 'package:food365/domain/services/auth_service.dart';
import 'package:food365/utils/shared/loading.dart';

class LogIn extends StatelessWidget {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  LogIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                controller: emailEditingController,
                decoration: const InputDecoration(hintText: "Email"),
                onChanged: (v) {
                  print(emailEditingController.text);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordEditingController,
                decoration: const InputDecoration(hintText: "Password"),
                obscureText: true,
              ),
              ElevatedButton(
                child: Text("Sign In"),
                onPressed: () async {
                  print(emailEditingController.text);
                  print(passwordEditingController.text);
                  await AuthService().signIn(
                      email: emailEditingController.text,
                      password: passwordEditingController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  TextEditingController emailEditingController;
  EmailInput({
    Key key,
     this.emailEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailEditingController,
      decoration: const InputDecoration(hintText: "Email"),
      onChanged: (v) {
        print(emailEditingController.text);
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  TextEditingController passwordEditingController;
  PasswordInput({
    Key key,
     this.passwordEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordEditingController,
      decoration: const InputDecoration(hintText: "Password"),
      obscureText: true,
    );
  }
}

class SignInButton extends StatelessWidget {
  final email;
  final password;
  SignInButton({
    Key key,
    this.email,
    this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Sign In"),
      onPressed: () async {
        print(email);
        print(password);
        AuthService().signIn(email: email, password: password);
      },
    );
  }
}
