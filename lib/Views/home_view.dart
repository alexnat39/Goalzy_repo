import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/ChartWidgets/three_progress_widgets.dart';
import 'package:goalzy_app/CustomWidgets/custom_drawer.dart';
import 'package:goalzy_app/ChartWidgets/plan_bar_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_line_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_percent_indicator.dart';
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


//NON_URGENT
//todo add priority to task + goal type (long term/short term)
//todo let user choose widget colors




class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();

}
int activeGoalsCounter = 0;
int activePlansCounter = 0;
int ideasCounter = 0;

class HomePageState extends State<HomePage> {
  List<Widget> goalWidgetsArray = new List();
  List<Widget> planWidgetsArray = new List();
  List<Widget> ideaWidgetsArray = new List();

  List<Goal> _goalList = new List<Goal>();
  List<Plan> _planList = new List<Plan>();
  List<Idea> _ideaList = new List<Idea>();




  @override
  initState() {
    super.initState();
    activeGoalsCounter = 0;
    activePlansCounter = 0;
    ideasCounter = 0;
    clearUserPlanArrays();
    getAllGoals();
    getAllPlans();
    getAllIdeas();
  }



  @override
  Widget build(BuildContext context) {

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
                      MaterialPageRoute(builder: (context) => HomePage())),
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
                        MaterialPageRoute(builder: (context) => HomePage())),
              );
            },
            label: Text('ADD'),
            icon: Icon(Icons.add_circle_outline),
            backgroundColor: Colors.lightBlueAccent.withOpacity(0.8),
          ),
        ),
      );
  }

  GoalService _goalService;
  //reads all the goals from the SQL database
  getAllGoals() async {
    _goalService = GoalService();
    _goalList = List<Goal>();
    var goals = await _goalService.readGoals();
    goals.forEach((goal) {
      setState(() {
        var currentGoal = new Goal();
        currentGoal.id = goal['id'];
        currentGoal.title = goal['title'];
        currentGoal.subtitle = goal['subtitle'];
        currentGoal.description = goal['description'];
        currentGoal.finished = goal['finished'];
        currentGoal.deadline = goal['deadline'];
        currentGoal.dateAdded = goal['dateAdded'];
        currentGoal.color = goal['color'];
        //adding goal to the goal widgets array
        if (currentGoal.finished == 0) {
          activeGoalsCounter++;
          _goalList.insert(0, currentGoal);
        }
      });
    });
  }

  //reads all the plans from the SQL database
  PlanService _planService;
  getAllPlans() async {
    _planService = PlanService();
    _planList = List<Plan>();
    var plans = await _planService.readPlans();
    plans.forEach((plan) {
      setState(() {
        var currentPlan = new Plan();
        currentPlan.id = plan['id'];
        currentPlan.title = plan['title'];
        currentPlan.subtitle = plan['subtitle'];
        currentPlan.description = plan['description'];
        currentPlan.finished = plan['finished'];
        currentPlan.deadline = plan['deadline'];
        currentPlan.dateAdded = plan['dateAdded'];
        currentPlan.color = plan['color'];
        //adding goal to the goal widgets array

        addToAppropriateArrayOfPlans(currentPlan);
        if (currentPlan.finished == 0) {
          activePlansCounter++;
          _planList.insert(0, currentPlan);
        }
      });
    });
  }

  //reads all the ideas from the SQL database
  IdeaService _ideaService;
  getAllIdeas() async {
    _ideaService = IdeaService();
    _ideaList = List<Idea>();
    var ideas = await _ideaService.readIdeas();
    ideas.forEach((idea) {
      setState(() {
        var currentIdea = new Idea();
        currentIdea.id = idea['id'];
        currentIdea.title = idea['title'];
        currentIdea.subtitle = idea['subtitle'];
        currentIdea.description = idea['description'];
        currentIdea.dateAdded = idea['dateAdded'];
        currentIdea.color = idea['color'];
        //adding goal to the goal widgets array
        _ideaList.insert(0, currentIdea);
        ideasCounter++;
      });
    });
  }
}

/**
 * funciton for filling in goalWidgetsArray
 */
void _fillGoalWidgetsArray(BuildContext context, var list, _goalWidgetsArray) {
  if (activeGoalsCounter == 0) {
    _goalWidgetsArray.add(CustomAddGoalButton(
        navigateFunction: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()))));
  } else {
    for (int i = 0; i < list.length; i++) {
      Goal currentGoal = list[i];
      if (currentGoal.finished == 0) {
        String deadlineString = currentGoal.deadline
            .substring(0, currentGoal.deadline.indexOf(" "));
        _goalWidgetsArray.add(CustomGoalHomeWidget(
            currentGoal.title,
            currentGoal.subtitle,
            deadlineString,
            Color(currentGoal.color),
            currentGoal));
      } else {
        continue;
      }
    }
  }
}

/**
 * funciton for filling in planWidgetsArray
 */
void _fillPlanWidgetsArray(
    BuildContext context, var list, var _planWidgetsArray) {
  if (activePlansCounter == 0) {
    _planWidgetsArray.add(CustomAddPlanButton(
      navigateFunction: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage())),
    ));
  } else {
    for (int i = 0; i < list.length; i++) {
      Plan currentPlan = list[i];
      if (currentPlan.finished == 0) {
        String deadlineDateString = currentPlan.deadline
            .substring(0, currentPlan.deadline.indexOf(" "));
        String deadlineTimeString = currentPlan.deadline.substring(
            currentPlan.deadline.indexOf(" ") + 1,
            currentPlan.deadline.lastIndexOf(":"));

        _planWidgetsArray.add(CustomPlanHomeWidget(
            currentPlan.title,
            currentPlan.subtitle,
            deadlineDateString,
            deadlineTimeString,
            Color(currentPlan.color),
            currentPlan));
      } else {
        continue;
      }
    }
  }
}

/**
 * funciton for filling in ideaWidgetsArray
 */
void _fillIdeaWidgetsArray(
    BuildContext context, var list, var _ideaWidgetsArray) {
  if (list.length == 0) {
    _ideaWidgetsArray.add(CustomAddIdeaButton(
      navigateFunction: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage())),
    ));
  } else {
    for (int i = 0; i < list.length; i++) {
      Idea currentIdea = list[i];
      _ideaWidgetsArray.add(CustomIdeaHomeWidget(currentIdea.title,
          currentIdea.subtitle, Color(currentIdea.color), currentIdea));
    }
  }
}
