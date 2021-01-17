import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_drawer.dart';
import 'package:goalzy_app/CustomWidgets/custom_widget_all_tasks_view.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_home_view.dart';
import 'package:goalzy_app/Services/database_service.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/add_task_idea_view.dart';
import 'package:goalzy_app/Views/add_task_plan_view.dart';
import '../Models/goal_class.dart';
import '../main.dart';
import '../sort_functions.dart';
import 'add_task_goal_view.dart';
import 'home_view.dart';
import '../Models/idea_class.dart';

class AllTasksPage extends StatefulWidget {

  int currentPageIndex;



  AllTasksPage(this.currentPageIndex);

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
  Widget build(BuildContext context) {
    activeGoalsCounter = 0;
    activePlansCounter = 0;
    ideasCounter = 0;

    goalList.clear();
    planList.clear();
    ideaList.clear();



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
    _fillGoalWidgetsArray(widget);
    _fillPlanWidgetsArray(widget);
    _fillIdeaWidgetsArray(widget);

    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: DefaultTabController(
        initialIndex: widget.currentPageIndex,
        length: _tabs.length,
        child: Scaffold(
          backgroundColor: Colors.blueGrey[700],
          drawer: Drawer(
            child: CustomDrawer(
              navigateFunction: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllTasksPage(0))),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[800],
            title: Text("My Tasks"),
            actions: <Widget>[
              PopupMenuButton(
                  onSelected: (value) {
                    choiceAction(context, widget.currentPageIndex, value);
                  },
                  color: Colors.blueGrey[700],
                  itemBuilder: (BuildContext context) {
                    if (widget.currentPageIndex == 0 || widget.currentPageIndex == 1) {
                      return [
                        PopupMenuItem(
                          enabled: false,
                          height: MediaQuery.of(context).size.height * 0.005,
                          child: Row(
                            children: [
                              Text(
                                "Sort By",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey[500]),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Ascending Date Added",
                          child: Row(
                            children: [
                              Text("Date Added",
                                  style: TextStyle(color: Colors.white38)),
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
                              Text("Date Added",
                                  style: TextStyle(color: Colors.white38)),
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
                              Text("Deadline",
                                  style: TextStyle(color: Colors.white38)),
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
                              Text("Deadline",
                                  style: TextStyle(color: Colors.white38)),
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
                              Text(
                                "Sort By",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey[500]),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Ascending Date Added",
                          child: Row(
                            children: [
                              Text("Date Added",
                                  style: TextStyle(color: Colors.white38)),
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
                              Text("Date Added",
                                  style: TextStyle(color: Colors.white38)),
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
                widget.currentPageIndex = index;
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


}

//this function determines which sorting function to perform
void choiceAction(BuildContext context, var currentIndex, String value) {
  if (value == "Ascending Date Added") {
    //ascending is swapped with descending because we reverse a widgets array
    if (currentIndex == 0) {
      sortMyUserAllGoalsMapByDateAddedAscendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllTasksPage(0)));
    }
    if (currentIndex == 1) {
      sortMyUserAllPlansMapByDateAddedAscendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllTasksPage(1)));
    }
    if (currentIndex == 2) {
      sortMyUserAllIdeasMapByDateAddedAscendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllTasksPage(2)));
    }
  } else if (value == "Descending Date Added") {
    //descending is swapped with ascending because we reverse a widgets array
    if (currentIndex == 0) {
      sortMyUserAllGoalsMapByDateAddedDescendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllTasksPage(0)));
    }
    if (currentIndex == 1) {
      sortMyUserAllPlansMapByDateAddedDescendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllTasksPage(1)));
    }
    if (currentIndex == 2) {
      sortMyUserAllIdeasMapByDateAddedDescendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllTasksPage(2)));
    }
  } else if (value == "Ascending Deadline") {
    //ascending is swapped with descending because we reverse a widgets array
    if (currentIndex == 0) {
      sortMyUserAllGoalsMapByDeadlineAscendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(0)));
    }
    if (currentIndex == 1) {
      sortMyUserAllPlansMapByDeadlineAscendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllTasksPage(1)));
    }
  } else if (value == "Descending Deadline") {
    if (currentIndex == 0) {
      //descending is swapped with ascending because we reverse a widgets array
      sortMyUserAllGoalsMapByDeadlineDescendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllTasksPage(0)));
    }
    if (currentIndex == 1) {
      sortMyUserAllPlansMapByDeadlineDescendingOrder();
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllTasksPage(1)));
    }
  }
}

class AllTasksGoals extends StatefulWidget {
  @override
  _AllTasksGoalsState createState() => _AllTasksGoalsState();
}

class _AllTasksGoalsState extends State<AllTasksGoals> {
  var _databaseService = DatabaseService();

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
                navigateFunction: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AllTasksPage(0))),
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
                navigateFunction: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AllTasksPage(0))),
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
                                  MyUser.allGoalsMap.remove(_currentGoal.id);
                                  setState(() {
                                    _goalWidgetsArray.removeAt(index);
                                  });
                                   _databaseService
                                      .deleteGoalFromFirestore(_currentGoal.id);
                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  MyUser.allGoalsMap[_currentGoal.id].finished = 1;
                                  setState(() {
                                    _goalWidgetsArray.removeAt(index);
                                  });
                                  _databaseService
                                      .finishGoalInFirestore(_currentGoal.id);
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
  var _databaseService = DatabaseService();

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
                navigateFunction: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AllTasksPage(1))),
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
                navigateFunction: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AllTasksPage(1))),
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
                                planList.removeAt(index);
                                if (direction == DismissDirection.startToEnd) {
                                  MyUser.allPlansMap.remove(_currentPlan.id);
                                  setState(() {
                                    _planWidgetsArray.removeAt(index);
                                  });
                                  _databaseService
                                      .deletePlanFromFirestore(_currentPlan.id);
                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  MyUser.allPlansMap[_currentPlan.id].finished = 1;
                                  setState(() {
                                    _planWidgetsArray.removeAt(index);
                                  });
                                  _databaseService
                                      .finishPlanInFirestore(_currentPlan.id);
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
  var _databaseService = DatabaseService();

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
                    navigateFunction: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AllTasksPage(2))),
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
                    navigateFunction: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AllTasksPage(2))),
                  );
                },
                label: Text('ADD'),
                icon: Icon(Icons.add_circle_outline),
                backgroundColor: Colors.lightBlueAccent,
              ),
              body: Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery
                          .of(context)
                          .size
                          .width * 0.03,
                      right: MediaQuery
                          .of(context)
                          .size
                          .width * 0.03),
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
                                        top: MediaQuery
                                            .of(context)
                                            .size
                                            .height *
                                            0.01),
                                    padding: EdgeInsets.only(
                                        left: MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.02,
                                        right: MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.02),
                                    height:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.1,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Delete",
                                          style: TextStyle(
                                              color: Colors.grey[300]),
                                        ),
                                        Icon(Icons.delete_forever_outlined,
                                            color: Colors.grey[300]),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.red[300],
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                  ),
                                  secondaryBackground: Container(
                                    margin: EdgeInsets.only(
                                        top: MediaQuery
                                            .of(context)
                                            .size
                                            .height *
                                            0.01),
                                    padding: EdgeInsets.only(
                                        left: MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.02,
                                        right: MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.02),
                                    height:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
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
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                  ),
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    var _currentIdea = ideaList[index];
                                    ideaList.removeAt(index);
                                    if (direction ==
                                        DismissDirection.startToEnd) {
                                      MyUser.allIdeasMap.remove(_currentIdea.id);
                                      setState(() {
                                        _ideaWidgetsArray.removeAt(index);
                                      });
                                      _databaseService
                                          .deleteIdeaFromFirestore(
                                          _currentIdea.id);
                                    } else if (direction ==
                                        DismissDirection.endToStart) {
                                      MyUser.allIdeasMap.remove(_currentIdea.id);
                                      setState(() {
                                        _ideaWidgetsArray.removeAt(index);
                                      });
                                      _databaseService
                                          .deleteIdeaFromFirestore(
                                          _currentIdea.id);
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
  void _fillGoalWidgetsArray(widget) {
      MyUser.allGoalsMap.forEach((key, value) {
        Goal currentGoal = MyUser.allGoalsMap["$key"];
        if (currentGoal.finished == 0) {
          goalList.insert(0, currentGoal);
          activeGoalsCounter++;
          _goalWidgetsArray.insert(0, CustomGoalAllTasksWidget(currentGoal));
        }
      });
  }

  /**
   * funciton for filling in planWidgetsArray
   */
  void _fillPlanWidgetsArray(widget) {
    MyUser.allPlansMap.forEach((key, value) {
      Plan currentPlan = MyUser.allPlansMap["$key"];
      if (currentPlan.finished == 0) {
        planList.insert(0, currentPlan);
        activePlansCounter++;
        _planWidgetsArray.insert(0, CustomPlanAllTasksWidget(currentPlan));
      }
    });
  }

  /**
   * funciton for filling in planWidgetsArray
   */
  void _fillIdeaWidgetsArray(widget) {
    MyUser.allIdeasMap.forEach((key, value) {
      Idea currentIdea = MyUser.allIdeasMap["$key"];
      ideaList.insert(0, currentIdea);
        ideasCounter++;
      _ideaWidgetsArray.insert(0, CustomIdeaAllTasksWidget(currentIdea));
    });

  }
