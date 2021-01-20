import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/goal_class.dart';
import 'package:goalzy_app/Models/idea_class.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/home_view.dart';
import 'package:goalzy_app/Views/login_view.dart';
import 'package:goalzy_app/fill_arrays_functions.dart';
import 'package:intl/intl.dart';


import '../main.dart';
import '../sort_functions.dart';

class DatabaseService {

  CollectionReference users = FirebaseFirestore.instance.collection("users");
  var user = FirebaseAuth.instance.currentUser;


  /**
   * delete the user from firebase auth and firestore
   */
  Future deleteUserAccountFirebaseAuth() async {
    await user.delete();
  }
  Future deleteUserAccountFirestore(BuildContext context, String id) async {
    await users.doc(MyUser.uid).delete();
  }

  /**
   * edit the user name in firestore
   */
  Future updateUserNameInFirestore(String newName) async {
    await users.doc(MyUser.uid).update({"name" : newName});
  }
  /**
   * updates User email in firestore database and firebase auth
   */
  Future updateEmailInFirebaseAuth(String newEmail) async {
      await user.updateEmail(newEmail);
  }
  Future updateEmailInFirestore(String newEmail) async {
    await users.doc(MyUser.uid).update({"email": newEmail});
  }

  /**
   * updates User's password in firebase auth
   */
  Future updatePasswordInFirebaseAuth(String newPassword) async {
    await user.updatePassword(newPassword);
  }

  /**
   * function for sending reset password email
   */
  Future sendPasswordResetEmail(email) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }


  /**
   * function signs the user out of the app
   */
  Future<void> signOut(BuildContext context) async {

    MyUser.name = "";
    MyUser.email = "";
    MyUser.uid = "";
    MyUser.password = "";

    MyUser.allGoalsMap.clear();
    MyUser.allPlansMap.clear();
    MyUser.allIdeasMap.clear();

    clearUserPlanArrays();
    clearUserGoalArrays();

     Navigator.pop(context);
     Navigator.pop(context);

    activeGoalsCounter = 0;
    activePlansCounter = 0;
    ideasCounter = 0;

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LoginPage()));
    try {
      await FirebaseAuth.instance.signOut();
    } catch(e) {
      print(e);
    }
  }

  /**
   * delete funcitons for tasks from firestore
   */
  void deleteGoalFromFirestore(id) {
    users.doc("${MyUser.uid}").collection('goals').doc("${id}").delete();
  }

  void deletePlanFromFirestore(id) {
    users.doc("${MyUser.uid}").collection('plans').doc("${id}").delete();
  }

  void deleteIdeaFromFirestore(id) {
    users.doc("${MyUser.uid}").collection('ideas').doc("${id}").delete();
  }

  /**
   * update functions for tasks from firestore (used for editing & isFinished)
   */
  void updateGoalInFirestore(Goal updatedGoal) {
    users
        .doc("${MyUser.uid}")
        .collection('goals')
        .doc("${updatedGoal.id}")
        .update({
      "title": updatedGoal.title,
      "subtitle": updatedGoal.subtitle,
      "description": updatedGoal.description,
      "deadline": updatedGoal.deadline,
    });
  }

  void updatePlanInFirestore(Plan updatedPlan) {
    users
        .doc("${MyUser.uid}")
        .collection('plans')
        .doc("${updatedPlan.id}")
        .update({
      "title": updatedPlan.title,
      "subtitle": updatedPlan.subtitle,
      "description": updatedPlan.description,
      "deadline": updatedPlan.deadline,
    });
  }

  void updateIdeaInFirestore(Idea updatedIdea) {
    users
        .doc("${MyUser.uid}")
        .collection('ideas')
        .doc("${updatedIdea.id}")
        .update({
      "title": updatedIdea.title,
      "subtitle": updatedIdea.subtitle,
      "description": updatedIdea.description,
    });
  }

  /**
    * functions for finishing tasks in firestore
    */
  void finishGoalInFirestore(id) {
    users
        .doc("${MyUser.uid}")
        .collection('goals')
        .doc("${id}")
        .update({"finished": 1});
  }

  void finishPlanInFirestore(id) {
    users
        .doc("${MyUser.uid}")
        .collection('plans')
        .doc("${id}")
        .update({"finished": 1});
  }
  /**
   * functions for restore finishing tasks in firestore
   */
  void restoreGoalInFirestore(id) {
    users
        .doc("${MyUser.uid}")
        .collection('goals')
        .doc("${id}")
        .update({"finished": 0});
  }

  void restorePlanInFirestore(id) {
    users
        .doc("${MyUser.uid}")
        .collection('plans')
        .doc("${id}")
        .update({"finished": 0});
  }
  

  getUserDataFromFirestore(context, user) async {
    String uid = "";
    String name = "";
    String email = "";
    await FirebaseFirestore.instance
        .collection('users')
        .doc("${user.uid}")
        .get()
        .then((value) {
      name = value['name'];
      uid = value['uid'];
      email = value['email'];
    });

    MyUser.uid = uid;
    MyUser.name = name;
    MyUser.email = email;

    await fillUserArraysFromFirestore(user);

  }


  fillUserArraysFromFirestore(user) async {
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
        if (DateFormat("yyyy-MM-dd hh:mm:ss").parse(currentGoal.deadline).difference(DateTime.now()).inDays > 700) {
          deleteGoalFromFirestore(currentGoal.id);
        } else {
          if (currentGoal.finished == 0) {
            activeGoalsCounter++;
          }
          MyUser.allGoalsMap[doc.id.toString()] = currentGoal;
        }
      })
    });

    //filling in plans array
    await FirebaseFirestore.instance
        .collection('users')
        .doc("${user.uid}")
        .collection('plans')
        .get()
        .then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((doc) {
        var currentPlan = new Plan();
        currentPlan.id = doc.id.toString();
        currentPlan.title = doc['title'];
        currentPlan.subtitle = doc['subtitle'];
        currentPlan.description = doc['description'];
        currentPlan.finished = doc['finished'];
        currentPlan.deadline = doc['deadline'];
        currentPlan.dateAdded = doc['dateAdded'];
        currentPlan.color = doc['color'];
        if (DateFormat("yyyy-MM-dd hh:mm:ss").parse(currentPlan.deadline).difference(DateTime.now()).inDays > 400) {
          deletePlanFromFirestore(currentPlan.id);
        } else {
          if (currentPlan.finished == 0) {
            activePlansCounter++;
          }
          MyUser.allPlansMap[doc.id.toString()] = currentPlan;
        }
      })
    });

    //filling in ideas array
    await FirebaseFirestore.instance
        .collection('users')
        .doc("${user.uid}")
        .collection('ideas')
        .get()
        .then((QuerySnapshot querySnapshot) =>
    {
      querySnapshot.docs.forEach((doc) {
        var currentIdea = new Idea();
        currentIdea.id = doc.id.toString();
        currentIdea.title = doc['title'];
        currentIdea.subtitle = doc['subtitle'];
        currentIdea.description = doc['description'];
        currentIdea.dateAdded = doc['dateAdded'];
        currentIdea.color = doc['color'];
        ideasCounter++;
        MyUser.allIdeasMap[doc.id.toString()] = currentIdea;
      })
    });
    sortMyUserAllGoalsMapByDateAddedAscendingOrder();
    sortMyUserAllPlansMapByDateAddedAscendingOrder();
    sortMyUserAllIdeasMapByDateAddedAscendingOrder();
  }


}
