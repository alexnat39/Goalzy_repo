import 'package:goalzy_app/Models/plan_class.dart';
import 'goal_class.dart';
import 'idea_class.dart';

class User {
  //these arrays store all goals & plans & ideas user has ever created (finished & unfinished)
  static List<Plan> _allPlans = new List();
  static List<Goal> _allGoals = new List();
  static List<Idea> _allIdeas = new List();

  //these arrays store all goals & plans user has not yet finished
  static List<Plan> _remainingPlans = new List();
  static List<Goal> _remainingGoals = new List();

  static List<Plan> _finishedPlans = new List();
  static List<Goal> _finishedGoals = new List();

  static List<Plan> _mondayPlans = new List();
  static List<Plan> _tuesdayPlans = new List();
  static List<Plan> _wednesdayPlans = new List();
  static List<Plan> _thursdayPlans = new List();
  static List<Plan> _fridayPlans = new List();
  static List<Plan> _saturdayPlans = new List();
  static List<Plan> _sundayPlans = new List();

  static List<Plan> _finishedMondayPlans = new List();
  static List<Plan> _finishedTuesdayPlans = new List();
  static List<Plan> _finishedWednesdayPlans = new List();
  static List<Plan> _finishedThursdayPlans = new List();
  static List<Plan> _finishedFridayPlans = new List();
  static List<Plan> _finishedSaturdayPlans = new List();
  static List<Plan> _finishedSundayPlans = new List();

  static List<Plan> _todayPlans = new List();
  static List<Plan> _todayFinishedPlans = new List();

  static List<Plan> _thisWeekPlans = new List();
  static List<Plan> _thisWeekFinishedPlans = new List();

  static List<Plan> _thisMonthPlans = new List();


  static List<Goal> _januaryGoals = new List();
  static List<Goal> _februaryGoals = new List();
  static List<Goal> _marchGoals = new List();
  static List<Goal> _aprilGoals = new List();
  static List<Goal> _mayGoals = new List();
  static List<Goal> _juneGoals = new List();
  static List<Goal> _julyGoals = new List();
  static List<Goal> _augustGoals = new List();
  static List<Goal> _septemberGoals = new List();
  static List<Goal> _octoberGoals = new List();
  static List<Goal> _novemberGoals = new List();
  static List<Goal> _decemberGoals = new List();


  static List<Goal> _finishedJanuaryGoals = new List();
  static List<Goal> _finishedFebruaryGoals = new List();
  static List<Goal> _finishedMarchGoals = new List();
  static List<Goal> _finishedAprilGoals = new List();
  static List<Goal> _finishedMayGoals = new List();
  static List<Goal> _finishedJuneGoals = new List();
  static List<Goal> _finishedJulyGoals = new List();
  static List<Goal> _finishedAugustGoals = new List();
  static List<Goal> _finishedSeptemberGoals = new List();
  static List<Goal> _finishedOctoberGoals = new List();
  static List<Goal> _finishedNovemberGoals = new List();
  static List<Goal> _finishedDecemberGoals = new List();

  static List<Goal> _thisMonthGoals = new List();
  static List<Goal> _thisMonthFinishedGoals = new List();

  static List<Goal> get thisYearGoals => _thisYearGoals;
  static List<Goal> _thisYearGoals = new List();
  static List<Goal> _thisYearFinishedGoals = new List();

  static List<Plan> _day1Plans = new List();
  static List<Plan> _day2Plans = new List();
  static List<Plan> _day3Plans = new List();
  static List<Plan> _day4Plans = new List();
  static List<Plan> _day5Plans = new List();
  static List<Plan> _day6Plans = new List();
  static List<Plan> _day7Plans = new List();
  static List<Plan> _day8Plans = new List();
  static List<Plan> _day9Plans = new List();
  static List<Plan> _day10Plans = new List();
  static List<Plan> _day11Plans = new List();
  static List<Plan> _day12Plans = new List();
  static List<Plan> _day13Plans = new List();
  static List<Plan> _day14Plans = new List();
  static List<Plan> _day15Plans = new List();
  static List<Plan> _day16Plans = new List();
  static List<Plan> _day17Plans = new List();
  static List<Plan> _day18Plans = new List();
  static List<Plan> _day19Plans = new List();
  static List<Plan> _day20Plans = new List();
  static List<Plan> _day21Plans = new List();
  static List<Plan> _day22Plans = new List();
  static List<Plan> _day23Plans = new List();
  static List<Plan> _day24Plans = new List();
  static List<Plan> _day25Plans = new List();
  static List<Plan> _day26Plans = new List();
  static List<Plan> _day27Plans = new List();
  static List<Plan> _day28Plans = new List();
  static List<Plan> _day29Plans = new List();
  static List<Plan> _day30Plans = new List();
  static List<Plan> _day31Plans = new List();

  static List<Plan> _day1PlansFinished = new List();
  static List<Plan> _day2PlansFinished = new List();
  static List<Plan> _day3PlansFinished = new List();
  static List<Plan> _day4PlansFinished = new List();
  static List<Plan> _day5PlansFinished = new List();
  static List<Plan> _day6PlansFinished = new List();
  static List<Plan> _day7PlansFinished = new List();
  static List<Plan> _day8PlansFinished = new List();
  static List<Plan> _day9PlansFinished = new List();
  static List<Plan> _day10PlansFinished = new List();
  static List<Plan> _day11PlansFinished = new List();
  static List<Plan> _day12PlansFinished = new List();
  static List<Plan> _day13PlansFinished = new List();
  static List<Plan> _day14PlansFinished = new List();
  static List<Plan> _day15PlansFinished = new List();
  static List<Plan> _day16PlansFinished = new List();
  static List<Plan> _day17PlansFinished = new List();
  static List<Plan> _day18PlansFinished = new List();
  static List<Plan> _day19PlansFinished = new List();
  static List<Plan> _day20PlansFinished = new List();
  static List<Plan> _day21PlansFinished = new List();
  static List<Plan> _day22PlansFinished = new List();
  static List<Plan> _day23PlansFinished = new List();
  static List<Plan> _day24PlansFinished = new List();
  static List<Plan> _day25PlansFinished = new List();
  static List<Plan> _day26PlansFinished = new List();
  static List<Plan> _day27PlansFinished = new List();
  static List<Plan> _day28PlansFinished = new List();
  static List<Plan> _day29PlansFinished = new List();
  static List<Plan> _day30PlansFinished = new List();
  static List<Plan> _day31PlansFinished = new List();



  /**
   * getter functions
   */
  static List<Idea> get allIdeas => _allIdeas;
  static List<Goal> get allGoals => _allGoals;
  static List<Plan> get allPlans => _allPlans;

  static List<Plan> get finishedPlans => _finishedPlans;

  static List<Plan> get thisMonthPlans => _thisMonthPlans;

  static List<Plan> get thisWeekPlans => _thisWeekPlans;
  static List<Plan> get thisWeekFinishedPlans => _thisWeekFinishedPlans;


  static List<Plan> get todayPlans => _todayPlans;
  static List<Plan> get todayFinishedPlans => _todayFinishedPlans;




  static List<Plan> get sundayPlans => _sundayPlans;
  static List<Plan> get saturdayPlans => _saturdayPlans;
  static List<Plan> get fridayPlans => _fridayPlans;
  static List<Plan> get thursdayPlans => _thursdayPlans;
  static List<Plan> get wednesdayPlans => _wednesdayPlans;
  static List<Plan> get tuesdayPlans => _tuesdayPlans;
  static List<Plan> get mondayPlans => _mondayPlans;

  static List<Plan> get finishedSundayPlans => _finishedSundayPlans;
  static List<Plan> get finishedSaturdayPlans => _finishedSaturdayPlans;
  static List<Plan> get finishedFridayPlans => _finishedFridayPlans;
  static List<Plan> get finishedThursdayPlans => _finishedThursdayPlans;
  static List<Plan> get finishedWednesdayPlans => _finishedWednesdayPlans;
  static List<Plan> get finishedTuesdayPlans => _finishedTuesdayPlans;
  static List<Plan> get finishedMondayPlans => _finishedMondayPlans;

  static List<Goal> get remainingGoals => _remainingGoals;
  static List<Plan> get remainingPlans => _remainingPlans;

  static List<Goal> get decemberGoals => _decemberGoals;
  static List<Goal> get novemberGoals => _novemberGoals;
  static List<Goal> get octoberGoals => _octoberGoals;
  static List<Goal> get septemberGoals => _septemberGoals;
  static List<Goal> get augustGoals => _augustGoals;
  static List<Goal> get julyGoals => _julyGoals;
  static List<Goal> get juneGoals => _juneGoals;
  static List<Goal> get mayGoals => _mayGoals;
  static List<Goal> get aprilGoals => _aprilGoals;
  static List<Goal> get marchGoals => _marchGoals;
  static List<Goal> get februaryGoals => _februaryGoals;
  static List<Goal> get januaryGoals => _januaryGoals;


  static List<Goal> get finishedJanuaryGoals => _finishedJanuaryGoals;

  static List<Goal> get thisMonthGoals => _thisMonthGoals;

  static List<Goal> get finishedGoals => _finishedGoals;
  static List<Goal> get thisMonthFinishedGoals => _thisMonthFinishedGoals;
  static List<Goal> get thisYearFinishedGoals => _thisYearFinishedGoals;

  static List<Goal> get finishedFebruaryGoals => _finishedFebruaryGoals;
  static List<Goal> get finishedMarchGoals => _finishedMarchGoals;
  static List<Goal> get finishedAprilGoals => _finishedAprilGoals;
  static List<Goal> get finishedMayGoals => _finishedMayGoals;
  static List<Goal> get finishedJuneGoals => _finishedJuneGoals;
  static List<Goal> get finishedJulyGoals => _finishedJulyGoals;
  static List<Goal> get finishedAugustGoals => _finishedAugustGoals;
  static List<Goal> get finishedSeptemberGoals => _finishedSeptemberGoals;
  static List<Goal> get finishedOctoberGoals => _finishedOctoberGoals;
  static List<Goal> get finishedNovemberGoals => _finishedNovemberGoals;
  static List<Goal> get finishedDecemberGoals => _finishedDecemberGoals;






  /**
   * setter functions
   */
  static set remainingGoals(List<Goal> value) {
    _remainingGoals = value;
  }
  static set remainingPlans(List<Plan> value) {
    _remainingPlans = value;
  }

  static set allGoals(List<Goal> value) {
    _allGoals = value;
  }
  static set allPlans(List<Plan> value) {
    _allPlans = value;
  }
  static set allIdeas(List<Idea> value) {
    _allIdeas = value;
  }

  static List<Plan> get day1Plans => _day1Plans;
  static List<Plan> get day2Plans => _day2Plans;
  static List<Plan> get day3Plans => _day3Plans;
  static List<Plan> get day4Plans => _day4Plans;
  static List<Plan> get day5Plans => _day5Plans;
  static List<Plan> get day6Plans => _day6Plans;
  static List<Plan> get day7Plans => _day7Plans;
  static List<Plan> get day8Plans => _day8Plans;
  static List<Plan> get day9Plans => _day9Plans;
  static List<Plan> get day10Plans => _day10Plans;
  static List<Plan> get day11Plans => _day11Plans;
  static List<Plan> get day12Plans => _day12Plans;
  static List<Plan> get day13Plans => _day13Plans;
  static List<Plan> get day14Plans => _day14Plans;
  static List<Plan> get day15Plans => _day15Plans;
  static List<Plan> get day16Plans => _day16Plans;
  static List<Plan> get day17Plans => _day17Plans;
  static List<Plan> get day18Plans => _day18Plans;
  static List<Plan> get day19Plans => _day19Plans;
  static List<Plan> get day20Plans => _day20Plans;
  static List<Plan> get day21Plans => _day21Plans;
  static List<Plan> get day22Plans => _day22Plans;
  static List<Plan> get day23Plans => _day23Plans;
  static List<Plan> get day24Plans => _day24Plans;
  static List<Plan> get day25Plans => _day25Plans;
  static List<Plan> get day26Plans => _day26Plans;
  static List<Plan> get day27Plans => _day27Plans;
  static List<Plan> get day28Plans => _day28Plans;
  static List<Plan> get day29Plans => _day29Plans;
  static List<Plan> get day30Plans => _day30Plans;
  static List<Plan> get day31Plans => _day31Plans;

  static List<Plan> get day1PlansFinished => _day1PlansFinished;
  static List<Plan> get day2PlansFinished => _day2PlansFinished;
  static List<Plan> get day3PlansFinished => _day3PlansFinished;
  static List<Plan> get day4PlansFinished => _day4PlansFinished;
  static List<Plan> get day5PlansFinished => _day5PlansFinished;
  static List<Plan> get day6PlansFinished => _day6PlansFinished;
  static List<Plan> get day7PlansFinished => _day7PlansFinished;
  static List<Plan> get day8PlansFinished => _day8PlansFinished;
  static List<Plan> get day9PlansFinished => _day9PlansFinished;
  static List<Plan> get day10PlansFinished => _day10PlansFinished;
  static List<Plan> get day11PlansFinished => _day11PlansFinished;
  static List<Plan> get day12PlansFinished => _day12PlansFinished;
  static List<Plan> get day13PlansFinished => _day13PlansFinished;
  static List<Plan> get day14PlansFinished => _day14PlansFinished;
  static List<Plan> get day15PlansFinished => _day15PlansFinished;
  static List<Plan> get day16PlansFinished => _day16PlansFinished;
  static List<Plan> get day17PlansFinished => _day17PlansFinished;
  static List<Plan> get day18PlansFinished => _day18PlansFinished;
  static List<Plan> get day19PlansFinished => _day19PlansFinished;
  static List<Plan> get day20PlansFinished => _day20PlansFinished;
  static List<Plan> get day21PlansFinished => _day21PlansFinished;
  static List<Plan> get day22PlansFinished => _day22PlansFinished;
  static List<Plan> get day23PlansFinished => _day23PlansFinished;
  static List<Plan> get day24PlansFinished => _day24PlansFinished;
  static List<Plan> get day25PlansFinished => _day25PlansFinished;
  static List<Plan> get day26PlansFinished => _day26PlansFinished;
  static List<Plan> get day27PlansFinished => _day27PlansFinished;
  static List<Plan> get day28PlansFinished => _day28PlansFinished;
  static List<Plan> get day29PlansFinished => _day29PlansFinished;
  static List<Plan> get day30PlansFinished => _day30PlansFinished;
  static List<Plan> get day31PlansFinished => _day31PlansFinished;
}
