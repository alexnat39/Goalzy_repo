import 'dart:io';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Services/database_service.dart';
import 'package:goalzy_app/Views/login_view.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailFormKey = GlobalKey<FormState>();
  var _databaseService = DatabaseService();
  TextEditingController _emailController = TextEditingController();
  bool _emailIsValid = false;


  @override
  Widget build(BuildContext context) {

    final logo = Image.asset(
      "Assets/Images/transparent_logo.png",
      //height: mq.size.height / 4,
    );

    final emailField = Form(
        key: _emailFormKey,
        child: TextFormField(
          validator: (value) {
            if (value.trim().isEmpty) {
              _emailIsValid = false;
              return "You can't have an empty email";
            } else {
              _emailIsValid = true;
              return null;
            }
          },
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.red[300]),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red[300])),
            focusedErrorBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.red[300]),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            hintText: "email@example.com",
            labelText: "Email",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ));
    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          emailField,
        ],
      ),
    );
    final loginButton = Container(
        margin: EdgeInsets.only(top: 15),
        child: RaisedButton(
          color: Colors.white70,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.transparent)),
          child: Text(
            "Submit",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            _emailFormKey.currentState.validate();
            if (_emailIsValid) {
              try {
                await _databaseService.sendPasswordResetEmail(
                    _emailController.text.trim());
                Flushbar(
                  backgroundColor: Colors.blueGrey[400],
                  title: "Email Sent",
                  message: "Email for resetting password has been sent",
                  icon: Icon(
                    Icons.info_outline,
                    size: 28,
                    color: Colors.yellow[200],
                  ),
                  duration: Duration(seconds: 2),
                )..show(context);
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              } catch(e) {
                String _errorMessage =
                "$e".substring("$e".lastIndexOf("]") + 2, "$e".length);
                if (_errorMessage ==
                    "There is no user record corresponding to this identifier. The user may have been deleted.") {
                  _errorMessage = "User with this email not found.";
                }
                Flushbar(
                  backgroundColor: Colors.blueGrey[400],
                  title: "Error",
                  message: "$_errorMessage",
                  icon: Icon(
                    Icons.error_outline,
                    size: 28,
                    color: Colors.red[300],
                  ),
                  duration: Duration(seconds: 2),
                )..show(context);
              }
            }
          },
        ));
    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Back to login page",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.white,
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Login Page",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[700],
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 36, right: 36),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  logo,
                  fields,
                  Padding(
                    padding: EdgeInsets.only(bottom: 150),
                    child: bottom,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
