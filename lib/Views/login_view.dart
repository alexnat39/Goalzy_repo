import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/goal_class.dart';
import 'package:goalzy_app/Models/idea_class.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/home_view.dart';
import 'package:goalzy_app/Views/register_view.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  bool _passwordIsValid = false;
  bool _emailIsValid = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

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

    final passwordField = Column(
      children: <Widget>[
        Form(
          key: _passwordFormKey,
          child: TextFormField(
            validator: (value) {
              if (value.trim().isEmpty) {
                _passwordIsValid = false;
                return "You can't have an empty password";
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
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
                child: Text(
                  "Forgot Password",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.white),
                ),
                onPressed: () {
                  //showAlertDialog(context);
                }),
          ],
        ),
      ],
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          emailField,
          passwordField,
        ],
      ),
    );

    final loginButton = Container(
        margin: EdgeInsets.only(top: 15),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white70,
          child: MaterialButton(
            minWidth: mq.size.width / 1.2,
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              _emailFormKey.currentState.validate();
              _passwordFormKey.currentState.validate();
              if (_passwordIsValid && _emailIsValid) {
                loginUser(_emailController.text.trim(),
                    _passwordController.text.trim());
              }
            },
          ),
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
              "Don't have an account?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                  ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text(
                "Sign Up",
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

    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Form(
          key: _formKey,
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

  void loginUser(email, password) async {
    try {
      String uid = "";
      String name = "";
      activeGoalsCounter = 0;

      FirebaseAuth auth = FirebaseAuth.instance;
      User user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      uid = user.uid.toString();
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc("${user.uid}")
            .get()
            .then((value) {
          name = value['name'];
        });

        MyUser.uid = uid;
        MyUser.name = name;
        MyUser.email = email;
        MyUser.allGoals = new List<Goal>();
        MyUser.allPlans = new List<Plan>();
        MyUser.allIdeas = new List<Idea>();

        //filling in goals array
        await FirebaseFirestore.instance
            .collection('users')
            .doc("${user.uid}")
            .collection('goals')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((doc) {
                    var currentGoal = new Goal();
                    currentGoal.id = doc.id.toString();
                    currentGoal.title = doc['title'];
                    currentGoal.subtitle = doc['subtitle'];
                    currentGoal.description = doc['description'];
                    currentGoal.finished = doc['finished'];
                    currentGoal.deadline = doc['deadline'];
                    currentGoal.dateAdded = doc['dateAdded'];
                    currentGoal.color = doc['color'];
                    if (currentGoal.finished == 0) {
                      activeGoalsCounter++;
                    }
                    MyUser.allGoals.add(currentGoal);
                  })
                });
        print(activeGoalsCounter);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      String _errorMessage =
          "$e".substring("$e".lastIndexOf("]") + 2, "$e".length);
      if (_errorMessage ==
          "The password is invalid or the user does not have a password.") {
        _errorMessage = "The password is invalid.";
      } else if (_errorMessage ==
          "There is no user record corresponding to this identifier. The user may have been deleted.") {
        _errorMessage = "User not found.";
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
      _emailController.text = "";
      _passwordController.text = "";
      print(e);
    }
  }
}
