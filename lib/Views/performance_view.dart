import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/ChartWidgets/three_progress_widgets.dart';
import 'package:goalzy_app/CustomWidgets/custom_drawer.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_performance_page.dart';
import 'package:goalzy_app/ChartWidgets/goal_bar_chart.dart';
import 'package:goalzy_app/ChartWidgets/goal_line_chart.dart';
import 'package:goalzy_app/ChartWidgets/goal_linear_percent_indicator.dart';
import 'package:goalzy_app/ChartWidgets/plan_bar_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_line_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_percent_indicator.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/goal_class.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Services/goal_service.dart';
import 'package:goalzy_app/Services/plan_service.dart';
import 'package:intl/intl.dart';
import '../fill_arrays_functions.dart';
import '../main.dart';
import 'home_view.dart';



class PerformancePage extends StatefulWidget {

  int currentIndex;

  PerformancePage(this.currentIndex);
  _PerformancePageState createState() => _PerformancePageState();
}

List<Widget> _finishedPlanWidgetsArray = new List();
List<Widget> _finishedGoalWidgetsArray = new List();




class _PerformancePageState extends State<PerformancePage> {

  @override
  initState() {
    super.initState();
    clearUserPlanArrays();
    clearUserGoalArrays();

    activeGoalsCounter = 0;
    activePlansCounter = 0;

    _finishedPlanWidgetsArray.clear();
    _finishedGoalWidgetsArray.clear();

    distributeAllGoals();
    distributeAllPlans();
  }

  final List<Tab> _tabs = [
    Tab(text: "Goals"),
    Tab(text: "Plans"),
  ];
  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: DefaultTabController(
        initialIndex: widget.currentIndex,
        length: _tabs.length,
        child: Scaffold(
          drawer: Drawer(
            child: CustomDrawer(
              navigateFunction: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage())),
            ),
          ),
          backgroundColor: Colors.blueGrey[700],
          appBar: AppBar(
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Performance",
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.blueGrey[800],
            bottom: TabBar(
              tabs: _tabs,
            ),
          ),
          body: TabBarView(children: [
            GoalPerformancePage(),
            PlanPerformancePage(),
          ]),
        ),
      ),
    );
  }

  //distributes all the goals to appropriate arrays
  distributeAllGoals() async {

    MyUser.allGoalsMap.forEach((key, value) {
      Goal currentGoal = MyUser.allGoalsMap["$key"];
      addToAppropriateArrayOfGoals(currentGoal);
      if (currentGoal.finished == 0) {
        activeGoalsCounter++;
      }
      if (currentGoal.finished == 1) {
        _finishedGoalWidgetsArray.insert(0, CustomGoalPerformanceWidget(currentGoal));
      }

    });
  }

  //distributes all the plans to appropriate arrays
  distributeAllPlans() async {
    final now = DateTime.now();
    DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
    //gets dates when current week starts and ends
    final startOfWeek = getDate(now.subtract(Duration(days: now.weekday - 1)));
    final endOfWeek =
    getDate(now.add(Duration(days: DateTime.daysPerWeek - now.weekday + 1)));


    MyUser.allPlansMap.forEach((key, value) {
      Plan currentPlan = MyUser.allPlansMap["$key"];
      addToAppropriateArrayOfPlans(currentPlan);
      if (currentPlan.finished == 0) {
        activePlansCounter++;
      }
      if (currentPlan.finished == 1) {
        DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(currentPlan.deadline);
        if (tempDate.isAfter(startOfWeek) &&
            tempDate.isBefore(endOfWeek)) {
          _finishedPlanWidgetsArray.insert(0, CustomPlanPerformanceWidget(currentPlan));
        }
      }
    });
  }
}



class GoalPerformancePage extends StatefulWidget {
  _GoalPerformancePageState createState() => _GoalPerformancePageState();
}

class _GoalPerformancePageState extends State<GoalPerformancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: GoalBarChart(),
                ),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: LineChartGoalWidget()),
                ),
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
                    child: Text("This month - " + DateFormat.MMMM().format(DateTime.now()), style: TextStyle(fontSize: 20, color: Colors.grey[500] ),),
                  ),
                ]),
                Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.94,
                    // margin: EdgeInsets.only(
                    //     left: MediaQuery.of(context).size.width * 0.01),
                    child: GoalLinearPercentIndicator(),
                  ),
                ]),
                Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    children: [
                      Expanded(
                        child:buildListOfFinishedGoalWidgets(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}


class PlanPerformancePage extends StatefulWidget {
  _PlanPerformancePageState createState() => _PlanPerformancePageState();
}

class _PlanPerformancePageState extends State<PlanPerformancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              buildThreeProgressWidgets(context, MediaQuery.of(context).size.height * 0.3, PlanPercentIndicatorPerformancePage(5.0, 0.0), PlanBarChartPerformanceWidget()),
            ]),
            Column(
              children: [
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size. height * 0.015, bottom: MediaQuery.of(context).size.height * 0.01),
                    child: Text("This month - " + DateFormat.MMMM().format(DateTime.now()), style: TextStyle(fontSize: 20, color: Colors.grey[500] ),),
                  ),
                ]),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.94,
                          child: LineChartPlanWidget()),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              height: MediaQuery.of(context).size.height * 0.225,
              child: Column(
                children: [
                  Expanded(
                      child:buildListOfFinishedPlanWidgets(context),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


// /**
//  * funciton for filling in planWidgetsArray
//  */
// void _fillFinishedPlanWidgetsArray(list) {
//   final now = DateTime.now();
//   DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
//
//   //gets dates when current week starts and ends
//   final startOfWeek = getDate(now.subtract(Duration(days: now.weekday - 1)));
//   final endOfWeek =
//   getDate(now.add(Duration(days: DateTime.daysPerWeek - now.weekday + 1)));
//
//   for (int i = 0; i < list.length; i++) {
//       Plan currentPlan = list[i];
//       DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(currentPlan.deadline);
//       if (currentPlan.finished == 1 && tempDate.isAfter(startOfWeek) &&
//           tempDate.isBefore(endOfWeek)) {
//         _finishedPlanWidgetsArray.add(CustomPlanPerformanceWidget(currentPlan));
//       } else {
//         continue;
//       }
//     }
// }

// /**
//  * funciton for filling in goalWidgetsArray
//  */
// void _fillFinishedGoalWidgetsArray(list) {
//
//   for (int i = 0; i < list.length; i++) {
//     Goal currentGoal = list[i];
//     if (currentGoal.finished == 1) {
//       _finishedGoalWidgetsArray.add(CustomGoalPerformanceWidget(currentGoal));
//     }
//   }
// }




Widget buildListOfFinishedPlanWidgets(BuildContext context) {
  if (_finishedPlanWidgetsArray.length == 0) {
    return Center(
      child: Text(
          "You have no finished plans", style: TextStyle(color: Colors.grey[300], fontSize: 15)
      ),
    );

  } else {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _finishedPlanWidgetsArray.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: _finishedPlanWidgetsArray[index],
          );
        });
  }
}





Widget buildListOfFinishedGoalWidgets(BuildContext context) {
  if (_finishedGoalWidgetsArray.length == 0) {
    return Center(
      child: Text(
          "You have no finished goals", style: TextStyle(color: Colors.grey[300], fontSize: 15)
      ),
    );

  } else {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _finishedGoalWidgetsArray.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: _finishedGoalWidgetsArray[index],
          );
        });
  }
}