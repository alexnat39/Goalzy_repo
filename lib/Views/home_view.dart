import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/ChartWidgets/three_progress_widgets.dart';
import 'package:goalzy_app/CustomWidgets/custom_drawer.dart';
import 'package:goalzy_app/ChartWidgets/plan_bar_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_line_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_percent_indicator.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/plan_class.dart';
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
  List<Widget> _goalWidgetsArray = new List();
  List<Widget> _planWidgetsArray = new List();
  List<Widget> _ideaWidgetsArray = new List();

  @override
  Widget build(BuildContext context) {

    activeGoalsCounter = 0;
    activePlansCounter = 0;
    ideasCounter = 0;

    clearUserPlanArrays();

    //emptying array before filling them (to avoid duplicated widgets)
    _goalWidgetsArray.clear();
    _planWidgetsArray.clear();
    _ideaWidgetsArray.clear();

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
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.015),
                    child: buildThreeProgressWidgets(
                        context,
                        MediaQuery.of(context).size.height * 0.25,
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
                            top: MediaQuery.of(context).size.height * 0.01),
                        height: MediaQuery.of(context).size.height * 0.13,
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

  /**
   * funciton for filling in goalWidgetsArray
   */
  void _fillGoalWidgetsArray(BuildContext context) {
    MyUser.allGoalsMap.forEach((key, value) {
      Goal currentGoal = MyUser.allGoalsMap["$key"];
      addToAppropriateArrayOfGoals(currentGoal);
      if (currentGoal.finished == 0) {
        activeGoalsCounter++;
        _goalWidgetsArray.insert(0, CustomGoalHomeWidget(currentGoal));
      }
    });
    if (_goalWidgetsArray.length == 0) {
      _goalWidgetsArray.insert(
          0,
          CustomAddGoalButton(
            navigateFunction: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())),
          ));
    }
  }

  /**
   * funciton for filling in planWidgetsArray
   */
  void _fillPlanWidgetsArray(BuildContext context) {
    MyUser.allPlansMap.forEach((key, value) {
      Plan currentPlan = MyUser.allPlansMap["$key"];
      addToAppropriateArrayOfPlans(currentPlan);
      if (currentPlan.finished == 0) {
        activePlansCounter++;
        _planWidgetsArray.insert(0, CustomPlanHomeWidget(currentPlan));
      }
    });
    if (_planWidgetsArray.length == 0) {
      _planWidgetsArray.insert(
          0,
          CustomAddPlanButton(
            navigateFunction: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())),
          ));
    }
  }

  /**
   * funciton for filling in ideaWidgetsArray
   */
  void _fillIdeaWidgetsArray(BuildContext context) {
    MyUser.allIdeasMap.forEach((key, value) {
      ideasCounter++;
      Idea currentIdea = MyUser.allIdeasMap["$key"];
      _ideaWidgetsArray.insert(0, CustomIdeaHomeWidget(currentIdea));
    });
    if (_ideaWidgetsArray.length == 0) {
      _ideaWidgetsArray.insert(
          0,
          CustomAddIdeaButton(
            navigateFunction: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())),
          ));
    }
  }
}
