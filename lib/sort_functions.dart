import 'Models/User.dart';
import 'Models/goal_class.dart';
import 'Models/idea_class.dart';
import 'Models/plan_class.dart';
import 'package:intl/intl.dart';

/**
 * sorting a map of goals and plans and ideas by date added
 */
void sortMyUserAllGoalsMapByDateAddedAscendingOrder() {
  var sortedKeys = MyUser.allGoalsMap.keys.toList(growable:false)
    ..sort((k1, k2) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allGoalsMap[k1].dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allGoalsMap[k2].dateAdded)));

  MyUser.allGoalsMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allGoalsMap[k]);
}
void sortMyUserAllGoalsMapByDateAddedDescendingOrder() {
  var sortedKeys = MyUser.allGoalsMap.keys.toList(growable:false)
    ..sort((k2, k1) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allGoalsMap[k1].dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allGoalsMap[k2].dateAdded)));

  MyUser.allGoalsMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allGoalsMap[k]);
}



void sortMyUserAllPlansMapByDateAddedAscendingOrder() {
  var sortedKeys = MyUser.allPlansMap.keys.toList(growable:false)
    ..sort((k1, k2) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allPlansMap[k1].dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allPlansMap[k2].dateAdded)));

  MyUser.allPlansMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allPlansMap[k]);
}
void sortMyUserAllPlansMapByDateAddedDescendingOrder() {
  var sortedKeys = MyUser.allPlansMap.keys.toList(growable:false)
    ..sort((k2, k1) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allPlansMap[k1].dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allPlansMap[k2].dateAdded)));

  MyUser.allPlansMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allPlansMap[k]);
}


void sortMyUserAllIdeasMapByDateAddedAscendingOrder() {
  var sortedKeys = MyUser.allIdeasMap.keys.toList(growable:false)
    ..sort((k1, k2) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allIdeasMap[k1].dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allIdeasMap[k2].dateAdded)));

  MyUser.allIdeasMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allIdeasMap[k]);
}
void sortMyUserAllIdeasMapByDateAddedDescendingOrder() {
  var sortedKeys = MyUser.allIdeasMap.keys.toList(growable:false)
    ..sort((k1, k2) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allIdeasMap[k1].dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allIdeasMap[k2].dateAdded)));

  MyUser.allIdeasMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allIdeasMap[k]);
}


/**
 * sort a map of goal and plans by deadline
 */
void sortMyUserAllGoalsMapByDeadlineAscendingOrder() {
  var sortedKeys = MyUser.allGoalsMap.keys.toList(growable:false)
    ..sort((k1, k2) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allGoalsMap[k1].deadline).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allGoalsMap[k2].deadline)));

  MyUser.allGoalsMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allGoalsMap[k]);
}
void sortMyUserAllGoalsMapByDeadlineDescendingOrder() {
  var sortedKeys = MyUser.allGoalsMap.keys.toList(growable:false)
    ..sort((k2, k1) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allGoalsMap[k1].deadline).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allGoalsMap[k2].deadline)));

  MyUser.allGoalsMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allGoalsMap[k]);
}


void sortMyUserAllPlansMapByDeadlineAscendingOrder() {
  var sortedKeys = MyUser.allPlansMap.keys.toList(growable:false)
    ..sort((k1, k2) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allPlansMap[k1].deadline).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allPlansMap[k2].deadline)));

  MyUser.allPlansMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allPlansMap[k]);
}
void sortMyUserAllPlansMapByDeadlineDescendingOrder() {
  var sortedKeys = MyUser.allPlansMap.keys.toList(growable:false)
    ..sort((k2, k1) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allPlansMap[k1].deadline).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(MyUser.allPlansMap[k2].deadline)));

  MyUser.allPlansMap = new Map
      .fromIterable(sortedKeys, key: (k) => k, value: (k) =>  MyUser.allPlansMap[k]);
}





