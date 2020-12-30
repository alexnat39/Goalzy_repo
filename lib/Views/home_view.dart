import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_drawer.dart';
import 'package:goalzy_app/ChartWidgets/plan_bar_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_line_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_percent_indicator.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/add_task_goal_view.dart';
import 'package:goalzy_app/Views/performance_view.dart';
import 'package:goalzy_app/fill_arrays_functions.dart';
import '../Models/User.dart';
import '../sort_functions.dart';
import 'all_tasks_view.dart';
import '../CustomWidgets/custom_widgets_home_view.dart';
import '../Models/goal_class.dart';
import '../Models/idea_class.dart';
import 'package:intl/intl.dart';

//URGENT
//todo add graph for showing effectiveness of set plans + goals (y-axis is percentage of tasks completed in a day, x-axis is 7 days(1 week))

//NON_URGENT
//todo add priority to task + goal type (long term/short term)
//todo make the plan container fit all the needed text

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

List<Widget> _goalWidgetsArray = new List();
List<Widget> _planWidgetsArray = new List();
List<Widget> _ideaWidgetsArray = new List();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    fillOutPlansArrays();


    //emptying array before filling them (to avoid duplicated widgets)
    _goalWidgetsArray.removeRange(0, _goalWidgetsArray.length);
    _planWidgetsArray.removeRange(0, _planWidgetsArray.length);
    _ideaWidgetsArray.removeRange(0, _ideaWidgetsArray.length);

    //filling in widgets arrays
    _fillGoalWidgetsArray(context);
    _fillPlanWidgetsArray(context);
    _fillIdeaWidgetsArray(context);


    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
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
                  "Goalzy",
                ),
              ],
            ),
          ),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03),
          child: Column(children: [
            //this is container for containing row of goal title and goal widgets
            Container(
              //container for goals text
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Goals",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: _goalWidgetsArray.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: _goalWidgetsArray[index],
                              );
                            }),
                      )),
                    ],
                  )
                ],
              ),
            ),

            //this is container for containing row of plan title and plan widgets
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Plans",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: _planWidgetsArray.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: _planWidgetsArray[index],
                              );
                            }),
                      )),
                    ],
                  )
                ],
              ),
            ),

            //this is container for containing row of idea title and idea widgets
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Ideas",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: _ideaWidgetsArray.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: _ideaWidgetsArray[index],
                              );
                            }),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
                  child: buildThreeProgressWidgets(
                        context, MediaQuery.of(context).size.height * 0.25, PlanPercentIndicatorHomePage(5.0,0.0)),
                ),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                    height: MediaQuery.of(context).size.height * 0.13,
                      child: LineChartPlanWidget()),
                ),
              ],
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            AddTaskGoalView(
              context,
              navigateFunction: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage())),
            );
          },
          label: Text('ADD'),
          icon: Icon(Icons.add_circle_outline),
          backgroundColor: Colors.lightBlueAccent.withOpacity(0.8),
        ),
      ),
    );
  }
}

/**
 * funciton for filling in goalWidgetsArray
 */
void _fillGoalWidgetsArray(BuildContext context) {
  if (User.allGoals.length == 0 || User.finishedGoals.length == User.allGoals.length) {
    _goalWidgetsArray.add(CustomAddGoalButton(
      navigateFunction: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()))));


  } else {
    for (int i = 0; i < User.allGoals.length; i++) {
      Goal currentGoal = User.allGoals[i];
      if (currentGoal.isFinished() == false) {
        String deadlineString = "" + DateFormat('yyyy-MM-dd').format(currentGoal.getDeadline());
        _goalWidgetsArray.add(CustomGoalHomeWidget(
            currentGoal.getTitle(),
            currentGoal.getSubTitle(),
            deadlineString,
            currentGoal.color,
            currentGoal));
      } else {
        continue;
      }
    }
    _goalWidgetsArray = new List.from(_goalWidgetsArray.reversed);
  }
}

/**
 * funciton for filling in planWidgetsArray
 */
void _fillPlanWidgetsArray(BuildContext context) {
  if (User.allPlans.length == 0 || User.finishedPlans.length == User.allPlans.length) {
    _planWidgetsArray.add(CustomAddPlanButton(
      navigateFunction: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage())),
    ));
  } else {
    for (int i = 0; i < User.allPlans.length; i++) {
      Plan currentPlan = User.allPlans[i];
      if (currentPlan.isFinished() == false) {
        String deadlineDateString =
            "" + DateFormat('yyyy-MM-dd').format(currentPlan.getDeadline());
        String deadlineTimeString =
            "" + DateFormat.Hm().format(currentPlan.getDeadline());
        _planWidgetsArray.add(CustomPlanHomeWidget(
            currentPlan.getTitle(),
            currentPlan.getSubTitle(),
            deadlineDateString,
            deadlineTimeString,
            currentPlan.color,
            currentPlan));
      } else {
        continue;
      }
    }
    _planWidgetsArray = new List.from(_planWidgetsArray.reversed);
  }
}

/**
 * funciton for filling in ideaWidgetsArray
 */
void _fillIdeaWidgetsArray(BuildContext context) {
  if (User.allIdeas.length == 0) {
    _ideaWidgetsArray.add(CustomAddIdeaButton(
      navigateFunction: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage())),
    ));
  } else {
    for (int i = 0; i < User.allIdeas.length; i++) {
      Idea currentIdea = User.allIdeas[i];
      _ideaWidgetsArray.add(CustomIdeaHomeWidget(currentIdea.getTitle(),
          currentIdea.getSubtitle(), currentIdea.color, currentIdea));
    }
    _ideaWidgetsArray = new List.from(_ideaWidgetsArray.reversed);
  }
}

