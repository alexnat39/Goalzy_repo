import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/all_tasks_view.dart';
import 'package:goalzy_app/Views/active_task_single_view.dart';

import '../Views/add_task_goal_view.dart';
import '../Views/add_task_idea_view.dart';
import '../Views/add_task_plan_view.dart';
import '../Models/goal_class.dart';
import '../Views/home_view.dart';
import '../Models/idea_class.dart';


List colorsForGoalWidgets = [
  Colors.red[300],
  Colors.teal[300],
  Colors.yellow[300],
  Colors.green[300],
  Colors.blue[300],
  Colors.pinkAccent[100],
  Colors.orange[300],
];
List colorsForPlanWidgets = [
  Colors.blue[300],
  Colors.orange[300],
  Colors.green[300],
  Colors.pinkAccent[100],
  Colors.red[300],
  Colors.yellow[300],
  Colors.teal[300],
];
List colorsForIdeaWidgets = [
  Colors.pinkAccent[100],
  Colors.orange[300],
  Colors.blue[300],
  Colors.teal[300],
  Colors.green[300],
  Colors.red[300],
  Colors.yellow[300],
];


/**
 * custom widget for goal (used in all_goals_view)
 */
class CustomGoalAllTasksWidget extends StatefulWidget {

  String title;
  String subtitle;
  String description;
  String deadlineString = "";
  Color color;
  Goal goal;

  CustomGoalAllTasksWidget(this.title, this.subtitle, this.deadlineString, this.description, this.color, this.goal);

  @override
  _CustomGoalAllTasksWidgetState createState() => _CustomGoalAllTasksWidgetState();
}
class _CustomGoalAllTasksWidgetState extends State<CustomGoalAllTasksWidget> {

  @override
  Widget build(BuildContext context) {
    //goal widget
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.95,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.transparent)),
        color: widget.color,
        onPressed: () {
          GoalViewPopUp(widget.goal, navigateFunction: () => Navigator.push(context,
                   MaterialPageRoute(builder: (context) => AllTasksPage(0))),).build(context);
        },
        child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Text(
                            widget.title + ": ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            widget.subtitle,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.description,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01,
                        bottom: MediaQuery.of(context).size.height * 0.01),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      widget.deadlineString,
                      style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

}


/**
 * custom widget for plan (used in all_tasks_view)
 */
class CustomPlanAllTasksWidget extends StatefulWidget{
  
  Color color;
  String title;
  String subtitle;
  String description;
  String deadlineDateString = "";
  String deadlineTimeString = "";

  Plan plan;

  CustomPlanAllTasksWidget(this.title, this.subtitle, this.description, this.deadlineDateString,
      this.deadlineTimeString, this.color, this.plan);
  @override
  _CustomPlanAllTasksWidgetState createState() => _CustomPlanAllTasksWidgetState();
}
class _CustomPlanAllTasksWidgetState extends State<CustomPlanAllTasksWidget> {

  @override
  Widget build(BuildContext context) {
    //goal widget
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.95,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.transparent)),
        color: widget.color,
        onPressed: () {
          PlanViewPopUp(widget.plan, navigateFunction: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AllTasksPage(1))),).build(context);        },
        child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Text(
                            widget.title + ": ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            widget.subtitle,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.description,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      widget.deadlineDateString,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01,
                        bottom: MediaQuery.of(context).size.height * 0.01),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      widget.deadlineTimeString,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

}

/**
* custom widget for idea (used in all_tasks_view)
*/
class CustomIdeaAllTasksWidget extends StatefulWidget{

  Color color;
  String title;
  String subtitle;
  String description;

  Idea idea;


  CustomIdeaAllTasksWidget(this.title, this.subtitle, this.description, this.color, this.idea);
  
  @override
  _CustomIdeaAllTasksWidgetState createState() => _CustomIdeaAllTasksWidgetState();
}
class _CustomIdeaAllTasksWidgetState extends State<CustomIdeaAllTasksWidget> {

  @override
  Widget build(BuildContext context) {
    //goal widget
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.95,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.transparent)),
        color: widget.color,
        onPressed: () {
          IdeaViewPopUp(widget.idea, navigateFunction: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AllTasksPage(2))),).build(context);
        },
        child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Text(
                            widget.title + ": ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            widget.subtitle,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.description,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}





