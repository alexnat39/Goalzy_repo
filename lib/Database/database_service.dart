import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/goal_class.dart';
import 'package:goalzy_app/Models/idea_class.dart';
import 'package:goalzy_app/Models/plan_class.dart';

class DatabaseService {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

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
  void finishGoalInFirestore(Goal goal) {
    users
        .doc("${MyUser.uid}")
        .collection('goals')
        .doc("${goal.id}")
        .update({"finished": 1});
  }

  void finishPlanInFirestore(Plan plan) {
    users
        .doc("${MyUser.uid}")
        .collection('plans')
        .doc("${plan.id}")
        .update({"finished": 1});
  }
  /**
   * functions for restore finishing tasks in firestore
   */
  void restoreGoalInFirestore(Goal goal) {
    users
        .doc("${MyUser.uid}")
        .collection('goals')
        .doc("${goal.id}")
        .update({"finished": 0});
  }

  void restorePlanInFirestore(Plan plan) {
    users
        .doc("${MyUser.uid}")
        .collection('plans')
        .doc("${plan.id}")
        .update({"finished": 0});
  }
}
