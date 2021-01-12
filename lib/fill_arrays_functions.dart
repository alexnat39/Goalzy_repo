import 'package:intl/intl.dart';
import 'Models/User.dart';

addToAppropriateArrayOfPlans(currentPlan) {
  final now = DateTime.now();
  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  //gets dates when current week starts and ends
  final startOfWeek = getDate(now.subtract(Duration(days: now.weekday - 1)));
  final endOfWeek =
  getDate(now.add(Duration(days: DateTime.daysPerWeek - now.weekday + 1)));

  DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(currentPlan.deadline);




  if (tempDate.year == DateTime.now().year && tempDate.month == DateTime.now().month) {
    switch (tempDate.day) {
      case 1: {
        MyUser.day1Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day1PlansFinished.add(currentPlan);
        }
        break;
      }
      case 2: {
        MyUser.day2Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day2PlansFinished.add(currentPlan);
        }
        break;

      }
      case 3: {
        MyUser.day3Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day3PlansFinished.add(currentPlan);
        }
        break;
      }
      case 4:
        {
          MyUser.day4Plans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.day4PlansFinished.add(currentPlan);
          }
          break;
        }
      case 5: {
        MyUser.day5Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day5PlansFinished.add(currentPlan);
        }
        break;

      }
      case 6: {
        MyUser.day6Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day6PlansFinished.add(currentPlan);
        }
        break;

      }
      case 7: {
        MyUser.day7Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day7PlansFinished.add(currentPlan);
        }
        break;

      }
      case 8: {
        MyUser.day8Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day8PlansFinished.add(currentPlan);
        }
        break;
      }
      case 9: {
        MyUser.day9Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day9PlansFinished.add(currentPlan);
        }
        break;

      }
      case 10: {
        MyUser.day10Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day10PlansFinished.add(currentPlan);
        }
        break;

      }
      case 11:
        MyUser.day11Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day11PlansFinished.add(currentPlan);
        }
        {
          break;
        }
      case 12: {
        MyUser.day12Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day12PlansFinished.add(currentPlan);
        }
        break;

      }
      case 13: {
        MyUser.day13Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day13PlansFinished.add(currentPlan);
        }
        break;

      }
      case 14: {
        MyUser.day14Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day14PlansFinished.add(currentPlan);
        }
        break;

      }
      case 15: {
        MyUser.day15Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day15PlansFinished.add(currentPlan);
        }
        break;
      }
      case 16: {
        MyUser.day16Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day16PlansFinished.add(currentPlan);
        }
        break;

      }
      case 17: {
        MyUser.day17Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day17PlansFinished.add(currentPlan);
        }
        break;

      }
      case 18:
        {
          MyUser.day18Plans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.day18PlansFinished.add(currentPlan);
          }
          break;
        }
      case 19: {
        MyUser.day19Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day19PlansFinished.add(currentPlan);
        }
        break;

      }
      case 20: {
        MyUser.day20Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day20PlansFinished.add(currentPlan);
        }
        break;

      }
      case 21: {
        MyUser.day21Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day21PlansFinished.add(currentPlan);
        }
        break;

      }
      case 22: {
        MyUser.day22Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day22PlansFinished.add(currentPlan);
        }
        break;
      }
      case 23: {
        MyUser.day23Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day23PlansFinished.add(currentPlan);
        }
        break;

      }
      case 24: {
        MyUser.day24Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day24PlansFinished.add(currentPlan);
        }
        break;

      }
      case 25:
        {
          MyUser.day25Plans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.day25PlansFinished.add(currentPlan);
          }
          break;
        }
      case 26: {
        MyUser.day26Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day26PlansFinished.add(currentPlan);
        }
        break;

      }
      case 27: {
        MyUser.day27Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day27PlansFinished.add(currentPlan);
        }
        break;

      }
      case 28: {
        MyUser.day28Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day28PlansFinished.add(currentPlan);
        }
        break;

      }
      case 29:
        {
          MyUser.day29Plans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.day29PlansFinished.add(currentPlan);
          }
          break;
        }
      case 30: {
        MyUser.day30Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day30PlansFinished.add(currentPlan);
        }
        break;
      }
      case 31: {
        MyUser.day31Plans.add(currentPlan);
        if (currentPlan.finished == 1) {
          MyUser.day31PlansFinished.add(currentPlan);
        }
        break;
      }
    }
  }
  //adds currentPlan to todayPlans and todayFinishedPlans
  if (DateFormat('YYYYMMDD').format(tempDate) == DateFormat('YYYYMMDD').format(DateTime.now())) {
    MyUser.todayPlans.add(currentPlan);
    if (currentPlan.finished == 1) {
      MyUser.todayFinishedPlans.add(currentPlan);
    }
  }

  //adds currentPlan to an appropriate day of the week
  if (tempDate.isAfter(startOfWeek) &&
      tempDate.isBefore(endOfWeek) || tempDate.isAtSameMomentAs(startOfWeek)) {

    MyUser.thisWeekPlans.add(currentPlan);
    if (currentPlan.finished == 1) {
      MyUser.thisWeekFinishedPlans.add((currentPlan));
    }
    switch (DateFormat('EEEE').format(tempDate)) {
      case "Monday":
        {
          MyUser.mondayPlans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.finishedMondayPlans.add(currentPlan);
          }
          break;
        }
      case "Tuesday":
        {
          MyUser.tuesdayPlans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.finishedTuesdayPlans.add(currentPlan);
          }
          break;
        }
      case "Wednesday":
        {
          MyUser.wednesdayPlans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.finishedWednesdayPlans.add(currentPlan);
          }
          break;
        }
      case "Thursday":
        {
          MyUser.thursdayPlans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.finishedThursdayPlans.add(currentPlan);
          }
          break;
        }
      case "Friday":
        {
          MyUser.fridayPlans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.finishedFridayPlans.add(currentPlan);
          }
          break;
        }
      case "Saturday":
        {
          MyUser.saturdayPlans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.finishedSaturdayPlans.add(currentPlan);
          }
          break;
        }
      case "Sunday":
        {
          MyUser.sundayPlans.add(currentPlan);
          if (currentPlan.finished == 1) {
            MyUser.finishedSundayPlans.add(currentPlan);
          }
          break;
        }
    }
  }
}

clearUserPlanArrays() {
  MyUser.thisWeekPlans.clear();
  MyUser.thisWeekFinishedPlans.clear();

  MyUser.mondayPlans.clear();
  MyUser.tuesdayPlans.clear();
  MyUser.wednesdayPlans.clear();
  MyUser.thursdayPlans.clear();
  MyUser.fridayPlans.clear();
  MyUser.saturdayPlans.clear();
  MyUser.sundayPlans.clear();
  MyUser.thisWeekPlans.clear();

  MyUser.finishedMondayPlans.clear();
  MyUser.finishedTuesdayPlans.clear();
  MyUser.finishedWednesdayPlans.clear();
  MyUser.finishedThursdayPlans.clear();
  MyUser.finishedFridayPlans.clear();
  MyUser.finishedSaturdayPlans.clear();
  MyUser.finishedSundayPlans.clear();

  MyUser.todayPlans.clear();
  MyUser.todayFinishedPlans.clear();

  MyUser.day1Plans.clear();
  MyUser.day2Plans.clear();
  MyUser.day3Plans.clear();
  MyUser.day4Plans.clear();
  MyUser.day5Plans.clear();
  MyUser.day6Plans.clear();
  MyUser.day7Plans.clear();
  MyUser.day8Plans.clear();
  MyUser.day9Plans.clear();
  MyUser.day10Plans.clear();
  MyUser.day11Plans.clear();
  MyUser.day12Plans.clear();
  MyUser.day13Plans.clear();
  MyUser.day14Plans.clear();
  MyUser.day15Plans.clear();
  MyUser.day16Plans.clear();
  MyUser.day17Plans.clear();
  MyUser.day18Plans.clear();
  MyUser.day19Plans.clear();
  MyUser.day20Plans.clear();
  MyUser.day21Plans.clear();
  MyUser.day22Plans.clear();
  MyUser.day23Plans.clear();
  MyUser.day24Plans.clear();
  MyUser.day25Plans.clear();
  MyUser.day26Plans.clear();
  MyUser.day27Plans.clear();
  MyUser.day28Plans.clear();
  MyUser.day29Plans.clear();
  MyUser.day30Plans.clear();
  MyUser.day31Plans.clear();

  MyUser.day1PlansFinished.clear();
  MyUser.day2PlansFinished.clear();
  MyUser.day3PlansFinished.clear();
  MyUser.day4PlansFinished.clear();
  MyUser.day5PlansFinished.clear();
  MyUser.day6PlansFinished.clear();
  MyUser.day7PlansFinished.clear();
  MyUser.day8PlansFinished.clear();
  MyUser.day9PlansFinished.clear();
  MyUser.day10PlansFinished.clear();
  MyUser.day11PlansFinished.clear();
  MyUser.day12PlansFinished.clear();
  MyUser.day13PlansFinished.clear();
  MyUser.day14PlansFinished.clear();
  MyUser.day15PlansFinished.clear();
  MyUser.day16PlansFinished.clear();
  MyUser.day17PlansFinished.clear();
  MyUser.day18PlansFinished.clear();
  MyUser.day19PlansFinished.clear();
  MyUser.day20PlansFinished.clear();
  MyUser.day21PlansFinished.clear();
  MyUser.day22PlansFinished.clear();
  MyUser.day23PlansFinished.clear();
  MyUser.day24PlansFinished.clear();
  MyUser.day25PlansFinished.clear();
  MyUser.day26PlansFinished.clear();
  MyUser.day27PlansFinished.clear();
  MyUser.day28PlansFinished.clear();
  MyUser.day29PlansFinished.clear();
  MyUser.day30PlansFinished.clear();
  MyUser.day31PlansFinished.clear();
}













/**
 * this function is used for creating a GoalBarChart and GoalPercentIndicator
 */
clearUserGoalArrays() {
  MyUser.januaryGoals.clear();
  MyUser.februaryGoals.clear();
  MyUser.marchGoals.clear();
  MyUser.aprilGoals.clear();
  MyUser.mayGoals.clear();
  MyUser.juneGoals.clear();
  MyUser.julyGoals.clear();
  MyUser.augustGoals.clear();
  MyUser.septemberGoals.clear();
  MyUser.octoberGoals.clear();
  MyUser.novemberGoals.clear();
  MyUser.decemberGoals.clear();

  MyUser.finishedJanuaryGoals.clear();
  MyUser.finishedFebruaryGoals.clear();
  MyUser.finishedMarchGoals.clear();
  MyUser.finishedAprilGoals.clear();
  MyUser.finishedMayGoals.clear();
  MyUser.finishedJuneGoals.clear();
  MyUser.finishedJulyGoals.clear();
  MyUser.finishedAugustGoals.clear();
  MyUser.finishedSeptemberGoals.clear();
  MyUser.finishedOctoberGoals.clear();
  MyUser.finishedNovemberGoals.clear();
  MyUser.finishedDecemberGoals.clear();


  MyUser.thisMonthFinishedGoals.clear();
  MyUser.thisMonthGoals.clear();

  MyUser.thisYearGoals.clear();
  MyUser.thisYearFinishedGoals.clear();

}

addToAppropriateArrayOfGoals(currentGoal) {
  DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(currentGoal.deadline);

  //adds currentGoal to thisMonthGoals and thisMonthFinishedGoals
  if (DateFormat('YYYYMM').format(tempDate) == DateFormat('YYYYMM').format(DateTime.now())) {
    MyUser.thisMonthGoals.add(currentGoal);
    if (currentGoal.finished == 1) {
      MyUser.thisMonthFinishedGoals.add(currentGoal);
    }
  }

  //adds currentGoal to an appropriate month
  if (DateFormat('YYYY').format(tempDate) == DateFormat('YYYY').format(DateTime.now())) {

    //adds current goal to thisYearFinishedGoals list
    if (currentGoal.finished == 1) {
      MyUser.thisYearFinishedGoals.add(currentGoal);
    }

    switch (DateFormat('MM').format(tempDate)) {
      case "01":
        {
          MyUser.januaryGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedJanuaryGoals.add(currentGoal);
          }
          break;
        }
      case "02":
        {
          MyUser.februaryGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedFebruaryGoals.add(currentGoal);
          }
          break;
        }
      case "03":
        {
          MyUser.marchGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedMarchGoals.add(currentGoal);
          }
          break;
        }
      case "04":
        {
          MyUser.aprilGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedAprilGoals.add(currentGoal);
          }
          break;
        }
      case "05":
        {
          MyUser.mayGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedMayGoals.add(currentGoal);
          }
          break;
        }
      case "06":
        {
          MyUser.juneGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedJuneGoals.add(currentGoal);
          }
          break;
        }
      case "07":
        {
          MyUser.julyGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedJulyGoals.add(currentGoal);
          }
          break;
        }
      case "08":
        {
          MyUser.augustGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedAugustGoals.add(currentGoal);
          }
          break;
        }
      case "09":
        {
          MyUser.septemberGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedSeptemberGoals.add(currentGoal);
          }
          break;
        }
      case "10":
        {
          MyUser.octoberGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedOctoberGoals.add(currentGoal);
          }
          break;
        }
      case "11":
        {
          MyUser.novemberGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedNovemberGoals.add(currentGoal);
          }
          break;
        }
      case "12":
        {
          MyUser.decemberGoals.add(currentGoal);
          if (currentGoal.finished == 1) {
            MyUser.finishedDecemberGoals.add(currentGoal);
          }
          break;
        }

    }
  }

}
