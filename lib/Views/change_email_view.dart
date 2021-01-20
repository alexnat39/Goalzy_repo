import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Services/database_service.dart';

class ChangeEmailPage extends StatefulWidget {
  _ChangeEmailPageState createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {

  final _emailFormKey = GlobalKey<FormState>();
  var _databaseService = DatabaseService();
  TextEditingController _emailController = TextEditingController();
  bool _emailIsValid = false;




  @override
  Widget build(BuildContext context) {
    //variable that stores email form field
    final emailField = Form(
        key: _emailFormKey,
        child: TextFormField(
          validator: (value) {
            if (value.trim().isEmpty) {
              _emailIsValid = false;
              return "You can't have an empty email";
            } if (value.trim() == MyUser.email) {
              _emailIsValid = false;
              return "This is your current email";
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white38,
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

    final submitButton = Container(
        margin: EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.05,
        child: RaisedButton(
          color: Colors.white70,
          // padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
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
            FocusScope.of(context).unfocus();
            _emailFormKey.currentState.validate();
            if (_emailIsValid) {
              try {
                await _databaseService.updateEmailInFirebaseAuth(_emailController.text.trim());
                await _databaseService.updateEmailInFirestore(_emailController.text.trim());
                  Flushbar(
                    backgroundColor: Colors.blueGrey[400],
                    title: "Email Saved!",
                    message: "Your new email: ${_emailController.text.trim()} has been updated",
                    icon: Icon(
                      Icons.info_outline,
                      size: 28,
                      color: Colors.yellow[200],
                    ),
                    duration: Duration(seconds: 2),
                  )..show(context);
                  MyUser.email = _emailController.text.trim();
              } catch(e) {
                print(e);
                String _errorMessage =
                "$e".substring("$e".lastIndexOf("]") + 2, "$e".length);
                if (_errorMessage ==
                    "There is no user record corresponding to this identifier. The user may have been deleted.") {
                  _errorMessage = "User with this email not found.";
                }
                print("This exception is caught");
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

    final title = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Enter a new Email address", style: TextStyle(color: Colors.white70, fontSize: 15),),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Settings",
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 36, right: 36, top: 20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  title,
                  emailField,
                  submitButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
