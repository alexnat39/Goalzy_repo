import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goalzy_app/Database/database_service.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/goal_class.dart';
import 'package:goalzy_app/Models/idea_class.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/home_view.dart';
import 'package:goalzy_app/Views/login_view.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

bool loadingRegister = false;

class _RegisterPageState extends State<RegisterPage> {
  var _databaseService = DatabaseService();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final _rePasswordFormKey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();

  bool _nameIsValid = false;
  bool _emailIsValid = false;
  bool _passwordIsValid = false;
  bool _rePasswordIsValid = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "Assets/Images/transparent_logo.png",
    );

    final usernameField = Form(
        key: _nameFormKey,
        child: TextFormField(
          validator: (value) {
            if (value.trim().isEmpty) {
              _nameIsValid = false;
              return "You can't have an empty name";
            } else {
              _nameIsValid = true;
              return null;
            }
          },
          controller: _usernameController,
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
            labelText: "Name",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ));

    final emailField = Form(
        key: _emailFormKey,
        child: TextFormField(
          validator: (value) {
            if (value.trim().isEmpty) {
              _nameIsValid = false;
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

    final passwordField = Form(
        key: _passwordFormKey,
        child: TextFormField(
          validator: (value) {
            if (value.trim().isEmpty) {
              _nameIsValid = false;
              return "You can't have an empty password";
            } else if (value.length < 6) {
              return "Must be at least 6 characters";
            } else {
              _passwordIsValid = true;
              return null;
            }
          },
          obscureText: true,
          controller: _passwordController,
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
            hintText: "Password",
            labelText: "Password",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ));

    final repasswordField = Form(
        key: _rePasswordFormKey,
        child: TextFormField(
          validator: (value) {
            if (value != _passwordController.text) {
              return "Passwords don't match";
            } else {
              _rePasswordIsValid = true;
              return null;
            }
          },
          obscureText: true,
          controller: _repasswordController,
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
            hintText: "Password",
            labelText: "Confirm Password",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ));

    final fields = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          usernameField,
          emailField,
          passwordField,
          repasswordField,
        ],
      ),
    );

    final registerButton = Container(
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white70,
          child: MaterialButton(
            minWidth: mq.size.width / 1.2,
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Text(
              "Register",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              _nameFormKey.currentState.validate();
              _emailFormKey.currentState.validate();
              _passwordFormKey.currentState.validate();
              _rePasswordFormKey.currentState.validate();
              if (_nameIsValid &&
                  _emailIsValid &&
                  _passwordIsValid &&
                  _rePasswordIsValid) {

                setState(() {
                  loadingRegister = true;
                });

                try {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await auth
                      .createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim())
                      .then((value) => FirebaseFirestore.instance
                      .collection('users')
                      .doc(value.user.uid)
                      .set({
                    'uid': value.user.uid,
                    'email': _emailController.text.trim(),
                    'name': _usernameController.text.trim(),
                  }));
                  MyUser.uid = auth.currentUser.uid.toString();
                  MyUser.name = _emailController.text.trim();
                  MyUser.email = _usernameController.text.trim();
                  setState(() {
                    loadingRegister = false;
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomePage()));
                } catch (e) {
                  setState(() {
                    loadingRegister = false;
                  });
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

                  _usernameController.text = "";
                  _emailController.text = "";
                  _passwordController.text = "";
                  _repasswordController.text = "";
                }

              }
            },
          ),
        ));

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        registerButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Already have an account?",
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
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final bodyProgress = Container(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
        ),
        alignment: AlignmentDirectional.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[300]),
                      value: null,
                      strokeWidth: 7.0,
                      backgroundColor: Colors.blueGrey[600],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    height: 100,
                    child: Text(
                      'Loading...',
                      style: TextStyle(decoration: TextDecoration.none, fontSize: 35, color: Colors.white70),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: loadingRegister ? bodyProgress : Scaffold(
        key: _scaffoldKey,
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
