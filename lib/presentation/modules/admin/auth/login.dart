import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:food365/domain/services/auth_service.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:food365/utils/strings.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/custom_style.dart';



class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
backgroundColor: Colors.white70,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(

        title: Text("",style: CustomStyle.appbarTitleStyle,),
        backgroundColor: CustomColor.primaryColor,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowAltCircleLeft, color: CustomColor.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //headingText: "Home",
        //height: 0,
        actions: [
        ],
      ),
      body:Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 30),

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 230,
                height: 200,
                alignment: Alignment.center,
                child: Image.asset(
               Strings.logoUri
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: emailEditingController,
                showCursor: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF666666),
                    size: defaultIconSize,
                  ),
                  fillColor: Color(0xFFF2F3F5),
                  hintStyle: TextStyle(
                      color: Color(0xFF666666),
                      fontFamily: defaultFontFamily,
                      fontSize: defaultFontSize),
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordEditingController,
                showCursor: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color(0xFF666666),
                    size: defaultIconSize,
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Color(0xFF666666),
                    size: defaultIconSize,
                  ),
                  fillColor: Color(0xFFF2F3F5),
                  hintStyle: TextStyle(
                    color: Color(0xFF666666),
                    fontFamily: defaultFontFamily,
                    fontSize: defaultFontSize,
                  ),
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontFamily: defaultFontFamily,
                    fontSize: defaultFontSize,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: CustomColor.primaryColor,
                    ),
                    BoxShadow(
                      color:CustomColor.primaryColor2,
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [CustomColor.primaryColor, Color(0xFFfbab66)],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Color(0xFFf7418c),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: ()  {

                    AuthService().signIn(email:emailEditingController.text , password: passwordEditingController.text);
                }),
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


