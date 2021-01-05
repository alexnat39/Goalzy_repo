import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_drawer.dart';
import 'package:goalzy_app/CustomWidgets/custom_widget_all_tasks_view.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_home_view.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Services/goal_service.dart';
import 'package:goalzy_app/Services/idea_service.dart';
import 'package:goalzy_app/Services/plan_service.dart';
import 'package:goalzy_app/Views/add_task_idea_view.dart';
import 'package:goalzy_app/Views/add_task_plan_view.dart';
import '../Models/goal_class.dart';
import '../sort_functions.dart';
import 'add_task_goal_view.dart';
import 'home_view.dart';
import '../Models/idea_class.dart';

class AllTasksPage extends StatefulWidget {
  int currentIndex;

  var goalListToDisplay;
  var planListToDisplay;
  var ideaListToDisplay;

  AllTasksPage(this.currentIndex, this.goalListToDisplay, this.planListToDisplay, this.ideaListToDisplay);
  _AllTasksPageState createState() => _AllTasksPageState();
}

List<Goal> goalList = new List<Goal>();
List<Plan> planList = new List<Plan>();
List<Idea> ideaList = new List<Idea>();



List<Widget> _goalWidgetsArray = new List();
List<Widget> _planWidgetsArray = new List();
List<Widget> _ideaWidgetsArray = new List();

class _AllTasksPageState extends State<AllTasksPage> {


  @override
  initState() {
    super.initState();
    activeGoalsCounter = 0;
    activePlansCounter = 0;
    if (widget.goalListToDisplay == null) {
      getAllGoals();
    } else {
      goalList = widget.goalListToDisplay;
    } if (widget.planListToDisplay == null) {
      getAllPlans();
    } else {
      planList = widget.planListToDisplay;
    }
    if (widget.ideaListToDisplay == null) {
      getAllIdeas();
    } else {
      ideaList = widget.ideaListToDisplay;
    }
  }
  @override
  Widget build(BuildContext context) {

    final List<Tab> _tabs = [
      Tab(text: "Goals"),
      Tab(text: "Plans"),
      Tab(text: "Ideas")
    ];

    //emptying the arrays to avoid duplicated widgets
    _goalWidgetsArray.clear();
    _planWidgetsArray.clear();
    _ideaWidgetsArray.clear();

    //filling in the arrays with new widgets
    _fillGoalWidgetsArray(goalList);
    _fillPlanWidgetsArray(planList);
    _fillIdeaWidgetsArray(ideaList);

    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: DefaultTabController(
        initialIndex: widget.currentIndex,
        length: _tabs.length,
        child: Scaffold(
          backgroundColor: Colors.blueGrey[700],
          drawer: Drawer(
            child: CustomDrawer(
              navigateFunction: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllTasksPage(0, null, null, null))),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[800],
            title: Text("My Tasks"),
            actions: <Widget>[
              PopupMenuButton(
                  onSelected: (value) {
                    choiceAction(context, widget.currentIndex, value);
                  },
                  color: Colors.blueGrey[700],
                  itemBuilder: (BuildContext context) {
                    if (widget.currentIndex == 0 || widget.currentIndex == 1) {
                      return [
                        PopupMenuItem(
                          enabled: false,
                          height: MediaQuery.of(context).size.height * 0.005,
                          child: Row(
                            children: [
                              Text("Sort By", style: TextStyle(fontSize: 10, color: Colors.grey[500]),),
                              Spacer(),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Ascending Date Added",
                          child: Row(
                            children: [
                              Text("Date Added", style: TextStyle(color: Colors.white38)),
                              Spacer(),
                              Icon(
                                Icons.arrow_upward,
                                color: Colors.white38,
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Descending Date Added",
                          child: Row(
                            children: [
                              Text("Date Added", style: TextStyle(color: Colors.white38)),
                              Spacer(),
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.white38,
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Ascending Deadline",
                          child: Row(
                            children: [
                              Text("Deadline", style: TextStyle(color: Colors.white38)),
                              Spacer(),
                              Icon(
                                Icons.arrow_upward,
                                color: Colors.white38,
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Descending Deadline",
                          child: Row(
                            children: [
                              Text("Deadline", style: TextStyle(color: Colors.white38)),
                              Spacer(),
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.white38,
                              ),
                            ],
                          ),
                        )
                      ];
                    } else {
                      return [
                        PopupMenuItem(
                          enabled: false,
                          height: MediaQuery.of(context).size.height * 0.005,
                          child: Row(
                            children: [
                              Text("Sort By", style: TextStyle(fontSize: 10, color: Colors.grey[500]),),
                              Spacer(),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Ascending Date Added",
                          child: Row(
                            children: [
                              Text("Date Added", style: TextStyle(color: Colors.white38)),
                              Spacer(),
                              Icon(
                                Icons.arrow_upward,
                                color: Colors.white38,
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Descending Date Added",
                          child: Row(
                            children: [
                              Text("Date Added", style: TextStyle(color: Colors.white38)),
                              Spacer(),
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.white38,
                              ),
                            ],
                          ),
                        ),
                      ];
                    }
                  }),
            ],
            bottom: TabBar(
              onTap: (index) {
                widget.currentIndex = index;
              },
              tabs: _tabs,
            ),
          ),
          body: TabBarView(children: [
            AllTasksGoals(),
            AllTasksPlans(),
            AllTasksIdeas(),
          ]),
        ),
      ),
    );
  }
  GoalService _goalService;
  //reads all the goals from the SQL database
  getAllGoals() async {
    _goalService = GoalService();
    goalList = List<Goal>();
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
          goalList.insert(0, currentGoal);
        }
      });
    });
  }


  //reads all the plans from the SQL database
  PlanService _planService;
  getAllPlans() async {
    _planService = PlanService();
    planList = List<Plan>();
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
        if (currentPlan.finished == 0) {
          activePlansCounter++;
          planList.insert(0, currentPlan);
        }
      });
    });
  }

  //reads all the ideas from the SQL database
  IdeaService _ideaService;
  getAllIdeas() async {
    _ideaService = IdeaService();
    ideaList = List<Idea>();
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
        ideasCounter++;
        ideaList.insert(0, currentIdea);
      });
    });
  }
}


//this function determines which sorting function to perform
void choiceAction(BuildContext context, var currentIndex, String value) {
  if (value == "Ascending Date Added") {
    //ascending is swapped with descending because we reverse a widgets array
    if (currentIndex == 0) {
      var newGoalList = sortGoalsInDescendingDateAddedOrder(goalList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(0, newGoalList, null, null)));
    }
    if (currentIndex == 1) {
      var newPlanList = sortPlansInDescendingDateAddedOrder(planList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(1, null, newPlanList, null)));
    }
    if (currentIndex == 2) {
      var newIdeaList = sortIdeasInDescendingDateAddedOrder(ideaList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(2, null, null, newIdeaList)));
    }

  } else if (value == "Descending Date Added") {
    //descending is swapped with ascending because we reverse a widgets array
    if (currentIndex == 0) {
      var newGoalList = sortGoalsInAscendingDateAddedOrder(goalList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(0, newGoalList, null, null)));
    }
    if (currentIndex == 1) {
      var newPlanList = sortPlansInAscendingDateAddedOrder(planList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(1, null, newPlanList, null)));
    }
    if (currentIndex == 2) {
      var newIdeaList = sortIdeasInAscendingDateAddedOrder(ideaList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(2, null, null, newIdeaList)));
    }
  } else if (value == "Ascending Deadline") {
    //ascending is swapped with descending because we reverse a widgets array
    if (currentIndex == 0) {
      var newGoalList = sortGoalsInDescendingDeadlineOrder(goalList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(0, newGoalList, null, null)));
    }
    if (currentIndex == 1) {
      var newPlanList = sortPlansInDescendingDeadlineOrder(planList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(1, null, newPlanList, null)));
    }
  } else if (value == "Descending Deadline") {
    if (currentIndex == 0) {
      //descending is swapped with ascending because we reverse a widgets array
      var newGoalList = sortGoalsInAscendingDeadlineOrder(goalList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(0, newGoalList, null, null)));
    }
    if (currentIndex == 1) {
      var newPlanList  = sortPlansInAscendingDeadlineOrder(planList);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(1, null, newPlanList, null)));
    }
  }
}

class AllTasksGoals extends StatefulWidget {
  @override
  _AllTasksGoalsState createState() => _AllTasksGoalsState();
}

class _AllTasksGoalsState extends State<AllTasksGoals> {
  var _goalService = GoalService();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      if (_goalWidgetsArray.length == 0) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAddGoalButton(
                navigateFunction: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllTasksPage(0, null, null, null))),
              ),
              Text("Add your first goal",
                  style: TextStyle(color: Colors.grey[300], fontSize: 25)),
            ],
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.blueGrey[700],
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              AddTaskGoalView(
                context,
                navigateFunction: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllTasksPage(0, null, null, null))),
              );
            },
            label: Text('ADD'),
            icon: Icon(Icons.add_circle_outline),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.03),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _goalWidgetsArray.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              child: Container(
                                child: _goalWidgetsArray[index],
                              ),
                              background: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                    right: MediaQuery.of(context).size.width *
                                        0.02),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Row(
                                  children: [
                                    Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.grey[300]),
                                    ),
                                    Icon(Icons.delete_forever_outlined,
                                        color: Colors.grey[300]),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.red[300],
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              secondaryBackground: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                    right: MediaQuery.of(context).size.width *
                                        0.02),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    //change here don't //worked
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Done ",
                                        style:
                                            TextStyle(color: Colors.grey[300]),
                                      ),
                                      Icon(
                                        Icons.done_outline,
                                        color: Colors.grey[300],
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.blue[300],
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              key: UniqueKey(),
                              onDismissed: (direction) async {
                                var _currentGoal = goalList[index];
                                goalList.removeAt(index);
                                if (direction == DismissDirection.startToEnd) {
                                  _goalService.deleteGoal(_currentGoal.id);
                                  setState(() {
                                    _goalWidgetsArray.removeAt(index);
                                  });
                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  // Remove the item from the database.
                                  var goalFromSQL = await _goalService.readGoalById(_currentGoal.id);
                                  _currentGoal.id = goalFromSQL[0]['id'];
                                  _currentGoal.finished = 1;
                                  await _goalService.updateGoal(_currentGoal);
                                  setState(() {
                                    _goalWidgetsArray.removeAt(index);
                                  });
                                }
                              },
                            );
                          })),
                ],
              )),
        );
      }
    });
  }
}

class AllTasksPlans extends StatefulWidget {
  @override
  _AllTasksPlansState createState() => _AllTasksPlansState();
}

class _AllTasksPlansState extends State<AllTasksPlans> {
  var _planService = PlanService();


  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      if (_planWidgetsArray.length == 0) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAddPlanButton(
                navigateFunction: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllTasksPage(1, null, null, null))),
              ),
              Text("Add your first plan",
                  style: TextStyle(color: Colors.grey[300], fontSize: 25)),
            ],
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.blueGrey[700],
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              AddTaskPlanView(
                context,
                navigateFunction: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllTasksPage(1, null, null, null))),
              );
            },
            label: Text('ADD'),
            icon: Icon(Icons.add_circle_outline),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.03),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _planWidgetsArray.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              child: Container(
                                child: _planWidgetsArray[index],
                              ),
                              background: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                    right: MediaQuery.of(context).size.width *
                                        0.02),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Row(
                                  children: [
                                    Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.grey[300]),
                                    ),
                                    Icon(Icons.delete_forever_outlined,
                                        color: Colors.grey[300]),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.red[300],
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              secondaryBackground: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                    right: MediaQuery.of(context).size.width *
                                        0.02),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    //change here don't //worked
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Done ",
                                        style:
                                            TextStyle(color: Colors.grey[300]),
                                      ),
                                      Icon(
                                        Icons.done_outline,
                                        color: Colors.grey[300],
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.blue[300],
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              key: UniqueKey(),
                              onDismissed: (direction) async {
                                var _currentPlan = planList[index];
                                print(planList);
                                print(_currentPlan.title);
                                print(planList[index].title);
                                planList.removeAt(index);
                                if (direction == DismissDirection.startToEnd) {
                                  _planService.deletePlan(_currentPlan.id);
                                  setState(() {
                                    _planWidgetsArray.removeAt(index);
                                  });

                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  // Remove the item from the database.
                                  var planFromSQL = await _planService.readPlanById(_currentPlan.id);
                                  _currentPlan.id = planFromSQL[0]['id'];
                                  _currentPlan.finished = 1;
                                  await _planService.updatePlan(_currentPlan);
                                  setState(() {
                                    _planWidgetsArray.removeAt(index);
                                  });
                                }
                              },
                            );
                          })),
                ],
              )),
        );
      }
    });
  }
}

class AllTasksIdeas extends StatefulWidget {
  @override
  _AllTasksIdeasState createState() => _AllTasksIdeasState();
}

class _AllTasksIdeasState extends State<AllTasksIdeas> {
  var _ideaService = IdeaService();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      if (_ideaWidgetsArray.length == 0) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAddIdeaButton(
                navigateFunction: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllTasksPage(2, null, null, null))),
              ),
              Text("Add your first idea",
                  style: TextStyle(color: Colors.grey[300], fontSize: 25)),
            ],
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.blueGrey[700],
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              AddTaskIdeaView(
                context,
                navigateFunction: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllTasksPage(2, null, null, null))),
              );
            },
            label: Text('ADD'),
            icon: Icon(Icons.add_circle_outline),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.03),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _ideaWidgetsArray.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              child: Container(
                                child: _ideaWidgetsArray[index],
                              ),
                              background: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                    right: MediaQuery.of(context).size.width *
                                        0.02),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Row(
                                  children: [
                                    Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.grey[300]),
                                    ),
                                    Icon(Icons.delete_forever_outlined,
                                        color: Colors.grey[300]),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.red[300],
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              secondaryBackground: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                    right: MediaQuery.of(context).size.width *
                                        0.02),
                                height:
                                MediaQuery.of(context).size.height * 0.1,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    //change here don't //worked
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Delete ",
                                        style:
                                        TextStyle(color: Colors.grey[300]),
                                      ),
                                      Icon(Icons.delete_forever_outlined,
                                          color: Colors.grey[300]),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.red[300],
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                var _currentIdea = ideaList[index];
                                ideaList.removeAt(index);
                                if (direction == DismissDirection.startToEnd) {
                                  // Remove the item from the database.
                                  _ideaService.deleteIdea(_currentIdea.id);
                                  setState(() {
                                    _ideaWidgetsArray.removeAt(index);
                                  });
                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  // Remove the item from the database.
                                  _ideaService.deleteIdea(_currentIdea.id);
                                  setState(() {
                                    _ideaWidgetsArray.removeAt(index);
                                  });
                                }
                              },
                            );
                          })),
                ],
              )),
        );
      }
    });
  }
}

/**
 * funciton for filling in goalWidgetsArray
 */
void _fillGoalWidgetsArray(list) {
  for (int i = 0; i < list.length; i++) {
    Goal currentGoal = list[i];
     if (currentGoal.finished == 0) {
       String deadlineDateString = currentGoal.deadline.substring(
           0, currentGoal.deadline.indexOf(" "));
      _goalWidgetsArray.add(CustomGoalAllTasksWidget(
          currentGoal.title,
          currentGoal.subtitle,
          deadlineDateString,
          currentGoal.description,
          Color(currentGoal.color),
          currentGoal));
     }
  }
}

/**
 * funciton for filling in planWidgetsArray
 */
void _fillPlanWidgetsArray(list) {
  for (int i = 0; i < list.length; i++) {
    Plan currentPlan = list[i];
    if (currentPlan.finished == 0) {
      String deadlineDateString = currentPlan.deadline.substring(
          0, currentPlan.deadline.indexOf(" "));
      String deadlineTimeString = currentPlan.deadline.substring(
          currentPlan.deadline.indexOf(" ") + 1,
          currentPlan.deadline.lastIndexOf(":"));
      _planWidgetsArray.add(CustomPlanAllTasksWidget(
          currentPlan.title,
          currentPlan.subtitle,
          currentPlan.description,
          deadlineDateString,
          deadlineTimeString,
          Color(currentPlan.color),
          currentPlan));
    }
  }
}

/**
 * funciton for filling in planWidgetsArray
 */
void _fillIdeaWidgetsArray(var list) {
  for (int i = 0; i < list.length; i++) {
    Idea currentIdea = list[i];
    _ideaWidgetsArray.add(CustomIdeaAllTasksWidget(
        currentIdea.title,
        currentIdea.subtitle,
        currentIdea.description,
        Color(currentIdea.color),
        currentIdea));
  }
}
