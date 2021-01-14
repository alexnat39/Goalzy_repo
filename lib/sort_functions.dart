import 'Models/goal_class.dart';
import 'Models/idea_class.dart';
import 'Models/plan_class.dart';
import 'package:intl/intl.dart';


/**
 * sorting goals and plans by deadline
 */
List sortGoalsInAscendingDeadlineOrder(List<Goal> list) {
  list.sort((a,b) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.deadline).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.deadline)));
  return list;
}
List sortPlansInAscendingDeadlineOrder(List<Plan> list) {
  list.sort((a,b) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.deadline).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.deadline)));
  return list;
}
List sortGoalsInDescendingDeadlineOrder(List<Goal> list) {
  list.sort((b,a) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.deadline).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.deadline)));
  return list;
}
List sortPlansInDescendingDeadlineOrder(List<Plan> list) {
  list.sort((b,a) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.deadline).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.deadline)));
  return list;
}


/**
 * sorting goals and plans by date added
 */
List sortGoalsInAscendingDateAddedOrder(List<Goal> list) {
  list.sort((a,b) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.dateAdded)));
  return list;
}
List sortPlansInAscendingDateAddedOrder(List<Plan> list) {
  list.sort((a,b) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.dateAdded)));
  return list;
}
List sortIdeasInAscendingDateAddedOrder(List<Idea> list) {
  list.sort((a,b) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.dateAdded)));
  return list;
}
List sortGoalsInDescendingDateAddedOrder(List<Goal> list) {
  list.sort((b,a) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.dateAdded)));
  return list;
}
List sortPlansInDescendingDateAddedOrder(List<Plan> list) {
  list.sort((b,a) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.dateAdded)));
  return list;
}
List sortIdeasInDescendingDateAddedOrder(List<Idea> list) {
  list.sort((b,a) => DateFormat("yyyy-MM-dd hh:mm:ss").parse(a.dateAdded).compareTo(DateFormat("yyyy-MM-dd hh:mm:ss").parse(b.dateAdded)));
  return list;
}











