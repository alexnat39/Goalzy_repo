import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_drawer.dart';
import 'package:goalzy_app/CustomWidgets/custom_widget_all_tasks_view.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_home_view.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/add_task_idea_view.dart';
import 'package:goalzy_app/Views/add_task_plan_view.dart';
import 'package:goalzy_app/fill_arrays_functions.dart';
import 'package:intl/intl.dart';
import '../Models/User.dart';
import '../Models/goal_class.dart';
import '../sort_functions.dart';
import 'add_task_goal_view.dart';
import 'home_view.dart';
import '../Models/idea_class.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AllTasksPage extends StatefulWidget {
  int currentIndex;

  AllTasksPage(this.currentIndex);

  _AllTasksPageState createState() => _AllTasksPageState();
}


List<Widget> _goalWidgetsArray = new List();
List<Widget> _planWidgetsArray = new List();
List<Widget> _ideaWidgetsArray = new List();

class _AllTasksPageState extends State<AllTasksPage> {
  @override
  Widget build(BuildContext context) {
    final List<Tab> _tabs = [
      Tab(text: "Goals"),
      Tab(text: "Plans"),
      Tab(text: "Ideas")
    ];
    
    fillRemainingGoals();
    fillRemainingPlans();

    //emptying the arrays to avoid duplicated widgets
    _goalWidgetsArray.removeRange(0, _goalWidgetsArray.length);
    _planWidgetsArray.removeRange(0, _planWidgetsArray.length);
    _ideaWidgetsArray.removeRange(0, _ideaWidgetsArray.length);

    //filling in the arrays with new widgets
    _fillGoalWidgetsArray();
    _fillPlanWidgetsArray();
    _fillIdeaWidgetsArray();

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
                  MaterialPageRoute(builder: (context) => AllTasksPage(0))),
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
}


//this function determines which sorting function to perform
void choiceAction(BuildContext context, var currentIndex, String value) {
  if (value == "Ascending Date Added") {
    //ascending is swapped with descending because we reverse a widgets array
    if (currentIndex == 0) {
      User.allGoals = sortGoalsInDescendingDateAddedOrder(User.allGoals);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(0)));
    }
    if (currentIndex == 1) {
      User.allPlans = sortPlansInDescendingDateAddedOrder(User.allPlans);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(1)));
    }
    if (currentIndex == 2) {
      User.allIdeas = sortIdeasInDescendingDateAddedOrder(User.allIdeas);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(2)));
    }

  } else if (value == "Descending Date Added") {
    //descending is swapped with ascending because we reverse a widgets array
    if (currentIndex == 0) {
      User.allGoals = sortGoalsInAscendingDateAddedOrder(User.allGoals);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(0)));
    }
    if (currentIndex == 1) {
      User.allPlans = sortPlansInAscendingDateAddedOrder(User.allPlans);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(1)));
    }
    if (currentIndex == 2) {
      User.allIdeas = sortIdeasInAscendingDateAddedOrder(User.allIdeas);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(2)));
    }
  } else if (value == "Ascending Deadline") {
    //ascending is swapped with descending because we reverse a widgets array
    if (currentIndex == 0) {
      User.allGoals = sortGoalsInDescendingDeadlineOrder(User.allGoals);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(0)));
    }
    if (currentIndex == 1) {
      User.allPlans = sortPlansInDescendingDeadlineOrder(User.allPlans);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(1)));
    }
  } else if (value == "Descending Deadline") {
    if (currentIndex == 0) {
      //descending is swapped with ascending because we reverse a widgets array
      User.allGoals = sortGoalsInAscendingDeadlineOrder(User.allGoals);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(0)));
    }
    if (currentIndex == 1) {
      User.allPlans = sortPlansInAscendingDeadlineOrder(User.allPlans);
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AllTasksPage(1)));
    }
  }
}

class AllTasksGoals extends StatefulWidget {
  @override
  _AllTasksGoalsState createState() => _AllTasksGoalsState();
}

class _AllTasksGoalsState extends State<AllTasksGoals> {
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
                    MaterialPageRoute(builder: (context) => AllTasksPage(0))),
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
                    MaterialPageRoute(builder: (context) => AllTasksPage(0))),
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
                              onDismissed: (direction) {
                                // Remove the item from the data source.
                                if (direction == DismissDirection.startToEnd) {
                                  setState(() {
                                    _goalWidgetsArray.removeAt(index);
                                  });
                                  var goalIndex = User.allGoals.indexOf(User
                                          .remainingGoals[
                                      User.remainingGoals.length - 1 - index]);
                                  User.remainingGoals.removeAt(
                                      User.remainingGoals.length - 1 - index);
                                  User.allGoals.removeAt(goalIndex);
                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  // Remove the item from the data source.
                                  setState(() {
                                    _goalWidgetsArray.removeAt(index);
                                  });
                                  var goalIndex = User.allGoals.indexOf(User
                                          .remainingGoals[
                                      User.remainingGoals.length - 1 - index]);
                                  User.finishedGoals.add(User.allGoals[
                                      User.remainingGoals.length - 1 - index]);
                                  User.remainingGoals.removeAt(
                                      User.remainingGoals.length - 1 - index);
                                  User.allGoals
                                      .elementAt(goalIndex)
                                      .setFinished(true);
                                  User.allGoals[
                                          User.allGoals.length - 1 - index]
                                      .setFinished(true);
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
                    MaterialPageRoute(builder: (context) => AllTasksPage(1))),
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
                    MaterialPageRoute(builder: (context) => AllTasksPage(1))),
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
                              onDismissed: (direction) {
                                // Remove the item from the data source.
                                if (direction == DismissDirection.startToEnd) {
                                  // Remove the item from the data source.
                                  setState(() {
                                    _planWidgetsArray.removeAt(index);
                                  });
                                  var planIndex = User.allPlans.indexOf(User
                                          .remainingPlans[
                                      User.remainingPlans.length - 1 - index]);
                                  User.remainingPlans.removeAt(
                                      User.remainingPlans.length - 1 - index);
                                  User.allPlans.removeAt(planIndex);
                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  // Remove the item from the data source.
                                  setState(() {
                                    _planWidgetsArray.removeAt(index);
                                  });
                                  var planIndex = User.allPlans.indexOf(User
                                          .remainingPlans[
                                      User.remainingPlans.length - 1 - index]);
                                  User.finishedPlans.add(User.allPlans[
                                      User.remainingPlans.length - 1 - index]);
                                  User.remainingPlans.removeAt(
                                      User.remainingPlans.length - 1 - index);
                                  User.allPlans
                                      .elementAt(planIndex)
                                      .setFinished(true);
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
                    MaterialPageRoute(builder: (context) => AllTasksPage(2))),
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
                    MaterialPageRoute(builder: (context) => AllTasksPage(2))),
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
                                if (direction == DismissDirection.startToEnd) {
                                  // Remove the item from the data source.
                                  setState(() {
                                    _ideaWidgetsArray.removeAt(index);
                                  });
                                  User.allIdeas.removeAt(
                                      User.allIdeas.length - 1 - index);
                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  // Remove the item from the data source.
                                  setState(() {
                                    _ideaWidgetsArray.removeAt(index);
                                  });
                                  User.allIdeas.removeAt(
                                      User.allIdeas.length - 1 - index);
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
void _fillGoalWidgetsArray() {
  for (int i = 0; i < User.allGoals.length; i++) {
    Goal currentGoal = User.allGoals[i];
    if (!currentGoal.isFinished()) {
      DateTime deadline = currentGoal.getDeadline();
      String deadlineString = "" + DateFormat('yyyy-MM-dd').format(deadline);
      _goalWidgetsArray.add(CustomGoalAllTasksWidget(
          currentGoal.getTitle(),
          currentGoal.getSubTitle(),
          deadlineString,
          currentGoal.getDescription(),
          currentGoal.color,
          currentGoal));
    }
  }
  _goalWidgetsArray = new List.from(_goalWidgetsArray.reversed);
}

/**
 * funciton for filling in planWidgetsArray
 */
void _fillPlanWidgetsArray() {
  for (int i = 0; i < User.remainingPlans.length; i++) {
    Plan currentPlan = User.remainingPlans[i];
    DateTime deadline = currentPlan.getDeadline();
    String deadlineDateString = "" + DateFormat('yyyy-MM-dd').format(deadline);
    String deadlineTimeString = "" + DateFormat.Hm().format(deadline);
    _planWidgetsArray.add(CustomPlanAllTasksWidget(
        currentPlan.getTitle(),
        currentPlan.getSubTitle(),
        currentPlan.getDescription(),
        deadlineDateString,
        deadlineTimeString,
        currentPlan.color,
        currentPlan));
  }
  _planWidgetsArray = new List.from(_planWidgetsArray.reversed);
}

/**
 * funciton for filling in planWidgetsArray
 */
void _fillIdeaWidgetsArray() {
  for (int i = 0; i < User.allIdeas.length; i++) {
    Idea currentIdea = User.allIdeas[i];
    _ideaWidgetsArray.add(CustomIdeaAllTasksWidget(
        currentIdea.getTitle(),
        currentIdea.getSubtitle(),
        currentIdea.getDescription(),
        currentIdea.color,
        currentIdea));
  }
  _ideaWidgetsArray = new List.from(_ideaWidgetsArray.reversed);
}
