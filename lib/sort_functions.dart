import 'Models/goal_class.dart';
import 'Models/idea_class.dart';
import 'Models/plan_class.dart';


/**
 * sorting goals and plans by deadline
 */
// List sortGoalsInAscendingDeadlineOrder(List<Goal> list) {
//   list.sort((a,b) => a.getDeadline().compareTo(b.getDeadline()));
//   return list;
// }
// List sortPlansInAscendingDeadlineOrder(List<Plan> list) {
//   list.sort((a, b) => a.getDeadline().compareTo(b.getDeadline()));
//   return list;
// }
// List sortGoalsInDescendingDeadlineOrder(List<Goal> list) {
//   list.sort((b,a) => a.getDeadline().compareTo(b.getDeadline()));
//   return list;
// }
// List sortPlansInDescendingDeadlineOrder(List<Plan> list) {
//   list.sort((b,a) => a.getDeadline().compareTo(b.getDeadline()));
//   return list;
// }


/**
 * sorting goals and plans by date added
 */
List sortGoalsInAscendingDateAddedOrder(List<Goal> list) {
  list.sort((a,b) => a.dateAdded.compareTo(b.dateAdded));
  return list;
}
List sortPlansInAscendingDateAddedOrder(List<Plan> list) {
  list.sort((a,b) => a.dateAdded.compareTo(b.dateAdded));
  return list;
}
List sortIdeasInAscendingDateAddedOrder(List<Idea> list) {
  list.sort((a,b) => a.dateAdded.compareTo(b.dateAdded));
  return list;
}
List sortGoalsInDescendingDateAddedOrder(List<Goal> list) {
  list.sort((b,a) => a.dateAdded.compareTo(b.dateAdded));
  return list;
}
List sortPlansInDescendingDateAddedOrder(List<Plan> list) {
  list.sort((b,a) => a.dateAdded.compareTo(b.dateAdded));
  return list;
}
List sortIdeasInDescendingDateAddedOrder(List<Idea> list) {
  list.sort((b,a) => a.dateAdded.compareTo(b.dateAdded));
  return list;
}











