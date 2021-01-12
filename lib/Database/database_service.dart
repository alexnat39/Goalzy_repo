// import 'dart:html';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:goalzy_app/Models/User.dart';
// import 'package:goalzy_app/Models/goal_class.dart';
// import 'package:goalzy_app/Models/idea_class.dart';
// import 'package:goalzy_app/Models/plan_class.dart';
//
//
//
// class DatabaseService {
//   CollectionReference users = FirebaseFirestore.instance.collection("users");
//
//   Future<void> createUserInFirestore(OurUser currentUser) async {
//     try {
//       return users.add({
//         'name': currentUser.fullName,
//         'email': currentUser.email,
//         'goals': List<Goal>(),
//         'plans': List<Plan>(),
//         'ideas': List<Idea>(),
//       });
//     } catch(e) {
//
//     }
//   }
//
//
//
// }