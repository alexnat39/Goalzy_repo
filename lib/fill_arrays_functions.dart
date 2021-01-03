import 'package:goalzy_app/Models/goal_class.dart';
import 'package:intl/intl.dart';
import 'Models/User.dart';
import 'Models/plan_class.dart';

/**
 * this function is used for creating a PlanBarChart
 */
// void fillOutPlansArrays() {
//
//
//   User.thisWeekPlans.clear();
//   User.thisWeekFinishedPlans.clear();
//
//   User.mondayPlans.clear();
//   User.tuesdayPlans.clear();
//   User.wednesdayPlans.clear();
//   User.thursdayPlans.clear();
//   User.fridayPlans.clear();
//   User.saturdayPlans.clear();
//   User.sundayPlans.clear();
//   User.thisWeekPlans.clear();
//
//   User.finishedMondayPlans.clear();
//   User.finishedTuesdayPlans.clear();
//   User.finishedWednesdayPlans.clear();
//   User.finishedThursdayPlans.clear();
//   User.finishedFridayPlans.clear();
//   User.finishedSaturdayPlans.clear();
//   User.finishedSundayPlans.clear();
//
//   User.remainingPlans.clear();
//
//   User.todayPlans.clear();
//   User.todayFinishedPlans.clear();
//
//   User.day1Plans.clear();
//   User.day2Plans.clear();
//   User.day3Plans.clear();
//   User.day4Plans.clear();
//   User.day5Plans.clear();
//   User.day6Plans.clear();
//   User.day7Plans.clear();
//   User.day8Plans.clear();
//   User.day9Plans.clear();
//   User.day10Plans.clear();
//   User.day11Plans.clear();
//   User.day12Plans.clear();
//   User.day13Plans.clear();
//   User.day14Plans.clear();
//   User.day15Plans.clear();
//   User.day16Plans.clear();
//   User.day17Plans.clear();
//   User.day18Plans.clear();
//   User.day19Plans.clear();
//   User.day20Plans.clear();
//   User.day21Plans.clear();
//   User.day22Plans.clear();
//   User.day23Plans.clear();
//   User.day24Plans.clear();
//   User.day25Plans.clear();
//   User.day26Plans.clear();
//   User.day27Plans.clear();
//   User.day28Plans.clear();
//   User.day29Plans.clear();
//   User.day30Plans.clear();
//   User.day31Plans.clear();
//
//   User.day1PlansFinished.clear();
//   User.day2PlansFinished.clear();
//   User.day3PlansFinished.clear();
//   User.day4PlansFinished.clear();
//   User.day5PlansFinished.clear();
//   User.day6PlansFinished.clear();
//   User.day7PlansFinished.clear();
//   User.day8PlansFinished.clear();
//   User.day9PlansFinished.clear();
//   User.day10PlansFinished.clear();
//   User.day11PlansFinished.clear();
//   User.day12PlansFinished.clear();
//   User.day13PlansFinished.clear();
//   User.day14PlansFinished.clear();
//   User.day15PlansFinished.clear();
//   User.day16PlansFinished.clear();
//   User.day17PlansFinished.clear();
//   User.day18PlansFinished.clear();
//   User.day19PlansFinished.clear();
//   User.day20PlansFinished.clear();
//   User.day21PlansFinished.clear();
//   User.day22PlansFinished.clear();
//   User.day23PlansFinished.clear();
//   User.day24PlansFinished.clear();
//   User.day25PlansFinished.clear();
//   User.day26PlansFinished.clear();
//   User.day27PlansFinished.clear();
//   User.day28PlansFinished.clear();
//   User.day29PlansFinished.clear();
//   User.day30PlansFinished.clear();
//   User.day31PlansFinished.clear();
//
//
//   final now = DateTime.now();
//   DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
//
//   //gets dates when current week starts and ends
//   final startOfWeek = getDate(now.subtract(Duration(days: now.weekday - 1)));
//   final endOfWeek =
//       getDate(now.add(Duration(days: DateTime.daysPerWeek - now.weekday + 1)));
//
//   for (int i = 0; i < User.allPlans.length; i++) {
//     Plan currentPlan = User.allPlans[i];
//
//     if (currentPlan.getDeadline().year == DateTime.now().year && currentPlan.getDeadline().month == DateTime.now().month) {
//       switch (currentPlan.getDeadline().day) {
//         case 1: {
//           User.day1Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day1PlansFinished.add(currentPlan);
//           }
//           break;
//         }
//         case 2: {
//           User.day2Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day2PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 3: {
//           User.day3Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day3PlansFinished.add(currentPlan);
//           }
//           break;
//         }
//         case 4:
//           {
//             User.day4Plans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.day4PlansFinished.add(currentPlan);
//             }
//             break;
//           }
//         case 5: {
//           User.day5Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day5PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 6: {
//           User.day6Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day6PlansFinished.add(currentPlan);
//           }
//           break;
//
//       }
//         case 7: {
//           User.day7Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day7PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 8: {
//           User.day8Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day8PlansFinished.add(currentPlan);
//           }
//           break;
//         }
//         case 9: {
//           User.day9Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day9PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 10: {
//           User.day10Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day10PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 11:
//           User.day11Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day11PlansFinished.add(currentPlan);
//           }
//           {
//             break;
//           }
//         case 12: {
//           User.day12Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day12PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 13: {
//           User.day13Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day13PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 14: {
//           User.day14Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day14PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 15: {
//           User.day15Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day15PlansFinished.add(currentPlan);
//           }
//           break;
//         }
//         case 16: {
//           User.day16Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day16PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 17: {
//           User.day17Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day17PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 18:
//           {
//             User.day18Plans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.day18PlansFinished.add(currentPlan);
//             }
//             break;
//           }
//         case 19: {
//           User.day19Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day19PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 20: {
//           User.day20Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day20PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 21: {
//           User.day21Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day21PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 22: {
//           User.day22Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day22PlansFinished.add(currentPlan);
//           }
//           break;
//         }
//         case 23: {
//           User.day23Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day23PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 24: {
//           User.day24Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day24PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 25:
//           {
//             User.day25Plans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.day25PlansFinished.add(currentPlan);
//             }
//             break;
//           }
//         case 26: {
//           User.day26Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day26PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 27: {
//           User.day27Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day27PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 28: {
//           User.day28Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day28PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//         case 29:
//           {
//             User.day29Plans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.day29PlansFinished.add(currentPlan);
//             }
//             break;
//           }
//         case 30: {
//           User.day30Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day30PlansFinished.add(currentPlan);
//           }
//           break;
//           break;
//
//         }
//         case 31: {
//           User.day31Plans.add(currentPlan);
//           if (currentPlan.isFinished()) {
//             User.day31PlansFinished.add(currentPlan);
//           }
//           break;
//
//         }
//       }
//     }
//
//     //adds currentPlan to todayPlans and todayFinishedPlans
//     if (DateFormat('YYYYMMDD').format(currentPlan.getDeadline()) == DateFormat('YYYYMMDD').format(DateTime.now())) {
//       User.todayPlans.add(currentPlan);
//       if (currentPlan.isFinished()) {
//         User.todayFinishedPlans.add(currentPlan);
//       }
//     }
//     //adds currentPlans to remainingPlans
//     if (!currentPlan.isFinished()) {
//       User.remainingPlans.add(currentPlan);
//     }
//
//     //adds currentPlan to an appropriate day of the week
//     if (currentPlan.getDeadline().isAfter(startOfWeek) &&
//         currentPlan.getDeadline().isBefore(endOfWeek)) {
//       User.thisWeekPlans.add(currentPlan);
//       if (currentPlan.isFinished()) {
//         User.thisWeekFinishedPlans.add((currentPlan));
//       }
//       switch (DateFormat('EEEE').format(currentPlan.getDeadline())) {
//         case "Monday":
//           {
//             User.mondayPlans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.finishedMondayPlans.add(currentPlan);
//             }
//             break;
//           }
//         case "Tuesday":
//           {
//             User.tuesdayPlans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.finishedTuesdayPlans.add(currentPlan);
//             }
//             break;
//           }
//         case "Wednesday":
//           {
//             User.wednesdayPlans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.finishedWednesdayPlans.add(currentPlan);
//             }
//             break;
//           }
//         case "Thursday":
//           {
//             User.thursdayPlans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.finishedThursdayPlans.add(currentPlan);
//             }
//             break;
//           }
//         case "Friday":
//           {
//             User.fridayPlans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.finishedFridayPlans.add(currentPlan);
//             }
//             break;
//           }
//         case "Saturday":
//           {
//             User.saturdayPlans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.finishedSaturdayPlans.add(currentPlan);
//             }
//             break;
//           }
//         case "Sunday":
//           {
//             User.sundayPlans.add(currentPlan);
//             if (currentPlan.isFinished()) {
//               User.finishedSundayPlans.add(currentPlan);
//             }
//             break;
//           }
//       }
//     }
//   }
// }
//
// void fillRemainingPlans() {
//
//   User.remainingPlans.clear();
//
//   for (int i = 0; i < User.allPlans.length; i++) {
//     if (!User.allPlans[i].isFinished()) {
//       User.remainingPlans.add(User.allPlans[i]);
//     }
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
// /**
//  * this function is used for creating a GoalBarChart and GoalPercentIndicator
//  */
// void fillOutGoalsArrays() {
//
//   User.januaryGoals.clear();
//   User.februaryGoals.clear();
//   User.marchGoals.clear();
//   User.aprilGoals.clear();
//   User.mayGoals.clear();
//   User.juneGoals.clear();
//   User.julyGoals.clear();
//   User.augustGoals.clear();
//   User.septemberGoals.clear();
//   User.octoberGoals.clear();
//   User.novemberGoals.clear();
//   User.decemberGoals.clear();
//
//   User.finishedJanuaryGoals.clear();
//   User.finishedFebruaryGoals.clear();
//   User.finishedMarchGoals.clear();
//   User.finishedAprilGoals.clear();
//   User.finishedMayGoals.clear();
//   User.finishedJuneGoals.clear();
//   User.finishedJulyGoals.clear();
//   User.finishedAugustGoals.clear();
//   User.finishedSeptemberGoals.clear();
//   User.finishedOctoberGoals.clear();
//   User.finishedNovemberGoals.clear();
//   User.finishedDecemberGoals.clear();
//
//
//   User.thisMonthFinishedGoals.clear();
//   User.thisMonthGoals.clear();
//
//   User.thisYearGoals.clear();
//   User.thisYearFinishedGoals.clear();
//
//
//
//   for (int i = 0; i < User.allGoals.length; i++) {
//     Goal currentGoal = User.allGoals[i];
//
//     //adds currentGoal to thisMonthGoals and thisMonthFinishedGoals
//     if (DateFormat('YYYYMM').format(currentGoal.getDeadline()) == DateFormat('YYYYMM').format(DateTime.now())) {
//       User.thisMonthGoals.add(currentGoal);
//       if (currentGoal.isFinished()) {
//         User.thisMonthFinishedGoals.add(currentGoal);
//       }
//     }
//
//     //adds currentGoal to remainingGoals
//     if (!currentGoal.isFinished()) {
//       User.remainingGoals.add(currentGoal);
//     }
//
//     //adds currentGoal to an appropriate month
//     if (currentGoal.getDeadline().year == DateTime.now().year) {
//       User.thisYearGoals.add(currentGoal);
//
//       //adds current goal to thisYearFinishedGoals list
//       if (currentGoal.isFinished()) {
//         User.thisYearFinishedGoals.add(currentGoal);
//       }
//
//       switch (DateFormat('MM').format(currentGoal.getDeadline())) {
//         case "1":
//           {
//             User.januaryGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedJanuaryGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "2":
//           {
//             User.februaryGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedFebruaryGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "3":
//           {
//             User.marchGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedMarchGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "4":
//           {
//             User.aprilGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedAprilGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "5":
//           {
//             User.mayGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedMayGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "6":
//           {
//             User.juneGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedJuneGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "7":
//           {
//             User.julyGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedJulyGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "8":
//           {
//             User.augustGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedAugustGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "9":
//           {
//             User.septemberGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedSeptemberGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "10":
//           {
//             User.octoberGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedOctoberGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "11":
//           {
//             User.novemberGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedNovemberGoals.add(currentGoal);
//             }
//             break;
//           }
//         case "12":
//           {
//             User.decemberGoals.add(currentGoal);
//             if (currentGoal.isFinished()) {
//               User.finishedDecemberGoals.add(currentGoal);
//             }
//             break;
//           }
//
//       }
//     }
//   }
// }
//
// void fillRemainingGoals() {
//   User.remainingGoals.clear();
//   for (int i = 0; i < User.allGoals.length; i++) {
//     if (!User.allGoals[i].isFinished()) {
//       User.remainingGoals.add(User.allGoals[i]);
//     }
//   }
// }
//
