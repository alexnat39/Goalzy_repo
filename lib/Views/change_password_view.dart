import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Services/database_service.dart';

class ChangePasswordPage extends StatefulWidget {
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  var _databaseService = DatabaseService();


  final _originalPasswordFormKey = GlobalKey<FormState>();
  TextEditingController _originalPasswordController = TextEditingController();
  bool _originalPasswordIsValid = false;

  final _newPasswordFormKey = GlobalKey<FormState>();
  TextEditingController _newPasswordController = TextEditingController();
  bool _newPasswordIsValid = false;

  final _rePasswordFormKey = GlobalKey<FormState>();
  TextEditingController _rePasswordController = TextEditingController();
  bool _rePasswordIsValid = false;


  @override
  build(BuildContext build) {

    final currentPasswordTitle = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Enter your current password", style: TextStyle(color: Colors.white70, fontSize: 15),),
          ],
        ),
      ],
    );

    final newPasswordTitle = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Enter a new password", style: TextStyle(color: Colors.white70, fontSize: 15),),
          ],
        ),
      ],
    );

    final rePasswordTitle = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Re-Enter a new password", style: TextStyle(color: Colors.white70, fontSize: 15),),
          ],
        ),
      ],
    );


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
            _originalPasswordFormKey.currentState.validate();
            _newPasswordFormKey.currentState.validate();
            _rePasswordFormKey.currentState.validate();
            if (_originalPasswordIsValid && _newPasswordIsValid && _rePasswordIsValid) {
              try {
                await _databaseService.updatePasswordInFirebaseAuth(_newPasswordController.text.trim());
                MyUser.password = _newPasswordController.text.trim();
                Flushbar(
                  backgroundColor: Colors.blueGrey[400],
                  title: "Password Updated!",
                  message: "Your new password has been updated.",
                  icon: Icon(
                    Icons.info_outline,
                    size: 28,
                    color: Colors.yellow[200],
                  ),
                  duration: Duration(seconds: 2),
                )..show(context);
                MyUser.password = _newPasswordController.text.trim();
              } catch(e) {
                print(e);
                String _errorMessage =
                "$e".substring("$e".lastIndexOf("]") + 2, "$e".length);
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

    final originalPasswordField = Form(
        key: _originalPasswordFormKey,
        child: TextFormField(
          maxLines: 1,
          validator: (value) {
            if (value.trim().isEmpty) {
              _originalPasswordIsValid = false;
              return "You can't have an empty password";
            } else if (value.trim() != MyUser.password) {
              _originalPasswordIsValid = false;
              return "Enter your current password";
            } else {
              _originalPasswordIsValid = true;
              return null;
            }
          },
          controller: _originalPasswordController,
          obscureText: true,
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
            labelText: "Current password",
            hintText: "password",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ));

    final newPasswordField = Form(
        key: _newPasswordFormKey,
        child: TextFormField(
          maxLines: 1,
          validator: (value) {
            if (value.trim().isEmpty) {
              _newPasswordIsValid = false;
              return "You can't have an empty password";
            } else if (value.trim() == MyUser.password) {
              _newPasswordIsValid = false;
              return "This is your current password";
            } else {
              _newPasswordIsValid = true;
              return null;
            }
          },
          controller: _newPasswordController,
          obscureText: true,
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
            labelText: "New password",
            hintText: "password",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ));

    final rePasswordField = Form(
        key: _rePasswordFormKey,
        child: TextFormField(
          maxLines: 1,
          validator: (value) {
            if (value.trim().isEmpty) {
              _rePasswordIsValid = false;
              return "You can't have an empty password";
            } else if (value.trim() != _newPasswordController.text.trim()) {
              _rePasswordIsValid = false;
              return "Passwords don't match";
            } else {
              _rePasswordIsValid = true;
              return null;
            }
          },
          controller: _rePasswordController,
          obscureText: true,
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
            labelText: "Re-Enter password",
            hintText: "password",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ));

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
                  currentPasswordTitle,
                  originalPasswordField,
                  SizedBox(height: 20),
                  newPasswordTitle,
                  newPasswordField,
                  SizedBox(height: 20),
                  rePasswordTitle,
                  rePasswordField,
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