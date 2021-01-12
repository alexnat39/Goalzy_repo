import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/ChartWidgets/three_progress_widgets.dart';
import 'package:goalzy_app/CustomWidgets/custom_drawer.dart';
import 'package:goalzy_app/ChartWidgets/plan_bar_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_line_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_percent_indicator.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Services/goal_service.dart';
import 'package:goalzy_app/Services/idea_service.dart';
import 'package:goalzy_app/Services/plan_service.dart';
import 'package:goalzy_app/Views/add_task_goal_view.dart';
import 'package:goalzy_app/fill_arrays_functions.dart';
import '../CustomWidgets/custom_widgets_home_view.dart';
import '../Models/goal_class.dart';
import '../Models/idea_class.dart';
import '../constants.dart';
import '../main.dart';


//NON_URGENT
//todo add priority to task + goal type (long term/short term)
//todo let user choose widget colors


class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
  HomePage();
}


class HomePageState extends State<HomePage> {
  List<Widget> goalWidgetsArray = new List();
  List<Widget> planWidgetsArray = new List();
  List<Widget> ideaWidgetsArray = new List();


  @override
  initState() {
    super.initState();

    //clearUserPlanArrays();
    // getAllGoals();
    // getAllPlans();
    // getAllIdeas();
  }


  @override
  Widget build(BuildContext context) {
     List<Goal> _goalList = MyUser.allGoals;
     List<Plan> _planList = MyUser.allPlans;
     List<Idea> _ideaList = MyUser.allIdeas;


    //emptying array before filling them (to avoid duplicated widgets)
    goalWidgetsArray.clear();
    planWidgetsArray.clear();
    ideaWidgetsArray.clear();

    //filling in widgets arrays
    _fillGoalWidgetsArray(context, _goalList, goalWidgetsArray);
    _fillPlanWidgetsArray(context, _planList, planWidgetsArray);
    _fillIdeaWidgetsArray(context, _ideaList, ideaWidgetsArray);

    return WillPopScope(
      onWillPop: () async =>
      !Navigator
          .of(context)
          .userGestureInProgress,
      child: Scaffold(
        drawer: Drawer(
          child: CustomDrawer(
            navigateFunction: () =>
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage())),
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
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
              left: MediaQuery
                  .of(context)
                  .size
                  .width * 0.03,
              right: MediaQuery
                  .of(context)
                  .size
                  .width * 0.03),
          child: SingleChildScrollView(
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
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.1,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: goalWidgetsArray.length,
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    return Container(
                                      child: goalWidgetsArray[index],
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
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.1,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: planWidgetsArray.length,
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    return Container(
                                      child: planWidgetsArray[index],
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
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.1,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: ideaWidgetsArray.length,
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    return Container(
                                      child: ideaWidgetsArray[index],
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
                    margin: EdgeInsets.only(
                        top: MediaQuery
                            .of(context)
                            .size
                            .height * 0.015),
                    child: buildThreeProgressWidgets(
                        context,
                        MediaQuery
                            .of(context)
                            .size
                            .height * 0.25,
                        PlanPercentIndicatorHomePage(5.0, 0.0),
                        PlanBarChartPerformanceWidget()),
                  ),
                ),
              ]),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height * 0.01),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.13,
                        child: LineChartPlanWidget()),
                  ),
                ],
              )
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            AddTaskGoalView(
              context,
              navigateFunction: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage())),
            );
          },
          label: Text('ADD'),
          icon: Icon(Icons.add_circle_outline),
          backgroundColor: Colors.lightBlueAccent.withOpacity(0.8),
        ),
      ),
    );
  }


  /**
   * funciton for filling in goalWidgetsArray
   */
  void _fillGoalWidgetsArray(BuildContext context, var list,
      _goalWidgetsArray) {
    if (activeGoalsCounter == 0) {
      _goalWidgetsArray.add(CustomAddGoalButton(
          navigateFunction: () =>
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => HomePage()))));
    } else {
      for (int i = 0; i < list.length; i++) {
        Goal currentGoal = list[i];
        if (currentGoal.finished == 0) {
          _goalWidgetsArray.add(CustomGoalHomeWidget(currentGoal));
        } else {
          continue;
        }
      }
    }
  }

  /**
   * funciton for filling in planWidgetsArray
   */
  void _fillPlanWidgetsArray(BuildContext context, var list,
      var _planWidgetsArray) {
    if (activePlansCounter == 0) {
      _planWidgetsArray.add(CustomAddPlanButton(
        navigateFunction: () =>
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => HomePage())),
      ));
    } else {
      for (int i = 0; i < list.length; i++) {
        Plan currentPlan = list[i];
        if (currentPlan.finished == 0) {
          _planWidgetsArray.add(CustomPlanHomeWidget(currentPlan));
        } else {
          continue;
        }
      }
    }
  }

  /**
   * funciton for filling in ideaWidgetsArray
   */
  void _fillIdeaWidgetsArray(BuildContext context, var list,
      var _ideaWidgetsArray) {
    if (list.length == 0) {
      _ideaWidgetsArray.add(CustomAddIdeaButton(
        navigateFunction: () =>
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => HomePage())),
      ));
    } else {
      for (int i = 0; i < list.length; i++) {
        Idea currentIdea = list[i];
        _ideaWidgetsArray.add(CustomIdeaHomeWidget(currentIdea));
      }
    }
  }
}
