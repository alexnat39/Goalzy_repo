import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_drawer.dart';
import 'package:goalzy_app/CustomWidgets/custom_widget_all_tasks_view.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_home_view.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_performance_page.dart';
import 'package:goalzy_app/ChartWidgets/goal_bar_chart.dart';
import 'package:goalzy_app/ChartWidgets/goal_line_chart.dart';
import 'package:goalzy_app/ChartWidgets/goal_linear_percent_indicator.dart';
import 'package:goalzy_app/ChartWidgets/goal_percent_indicator.dart';
import 'package:goalzy_app/ChartWidgets/plan_bar_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_line_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_percent_indicator.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/goal_class.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../fill_arrays_functions.dart';
import 'home_view.dart';



class PerformancePage extends StatefulWidget {

  int currentIndex;

  PerformancePage(this.currentIndex);
  _PerformancePageState createState() => _PerformancePageState();
}


List<Widget> _finishedPlanWidgetsArray = new List();
List<Widget> _finishedGoalWidgetsArray = new List();


class _PerformancePageState extends State<PerformancePage> {
  final List<Tab> _tabs = [
    Tab(text: "Goals"),
    Tab(text: "Plans"),
  ];
  @override
  Widget build(BuildContext context) {
    // fillOutGoalsArrays();
    // fillOutPlansArrays();

    _finishedPlanWidgetsArray.clear();
    _finishedGoalWidgetsArray.clear();

    _fillPlanWidgetsArray();
    _fillGoalWidgetsArray();

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
        child: Column(children: [
          Row(children: [
            buildThreeProgressWidgets(context, MediaQuery.of(context).size.height * 0.3, PlanPercentIndicatorPerformancePage(5.0, 0.0)),
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
    );
  }
}


/**
 * this funtions builds out three widgets for plan performance (used in plan performance and home pages)
 */
Widget buildThreeProgressWidgets(BuildContext context, var customHeight, Widget indicator) {
  return Container(
    child: SizedBox(
        //MediaQuery.of(context).size.height * 0.3
      height: customHeight,
      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: PlanBarChartPerformanceWidget(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.34,
                      height: customHeight * 0.6,
                      child: indicator,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: customHeight * 0.4,
                      child: PlanPercentageRepresentationPerformancePage(0.0, 5.0),
                    ),
                  ],
                )
              ],
            )
          ]),
    ),
  );
}




/**
 * funciton for filling in planWidgetsArray
 */
void _fillPlanWidgetsArray() {
  final now = DateTime.now();
  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  //gets dates when current week starts and ends
  final startOfWeek = getDate(now.subtract(Duration(days: now.weekday - 1)));
  final endOfWeek =
  getDate(now.add(Duration(days: DateTime.daysPerWeek - now.weekday + 1)));
    for (int i = 0; i < User.finishedPlans.length; i++) {

      Plan currentPlan = User.allPlans[i];
  //     if (currentPlan.isFinished() == true && currentPlan.getDeadline().isAfter(startOfWeek) &&
  // currentPlan.getDeadline().isBefore(endOfWeek)) {
  //       String deadlineDateString =
  //           "" + DateFormat('yyyy-MM-dd').format(currentPlan.getDeadline());
  //       String deadlineTimeString =
  //           "" + DateFormat.Hm().format(currentPlan.getDeadline());
  //       _finishedPlanWidgetsArray.add(CustomPlanPerformanceWidget(
  //           currentPlan.getTitle(),
  //           currentPlan.getSubTitle(),
  //           currentPlan.getDescription(),
  //           deadlineDateString,
  //           deadlineTimeString,
  //           currentPlan.getColor(),
  //           currentPlan));
  //     } else {
  //       continue;
  //     }
    }
    _finishedPlanWidgetsArray = new List.from(_finishedPlanWidgetsArray.reversed);
}

/**
 * funciton for filling in goalWidgetsArray
 */
void _fillGoalWidgetsArray() {
  for (int i = 0; i < User.allGoals.length; i++) {
    Goal currentGoal = User.allGoals[i];
    // if (currentGoal.isFinished()) {
    //   DateTime deadline = currentGoal.getDeadline();
    //   String deadlineString = "" + DateFormat('yyyy-MM-dd').format(deadline);
    //   _finishedGoalWidgetsArray.add(CustomGoalPerformanceWidget(
    //       currentGoal.getTitle(),
    //       currentGoal.getSubTitle(),
    //       deadlineString,
    //       currentGoal.getDescription(),
    //       currentGoal.getColor(),
    //       currentGoal));
    // }
  }
  _finishedGoalWidgetsArray = new List.from(_finishedGoalWidgetsArray.reversed);
}




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