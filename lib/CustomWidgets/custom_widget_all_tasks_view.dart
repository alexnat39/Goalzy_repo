import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/all_tasks_view.dart';
import 'package:goalzy_app/Views/active_task_single_view.dart';

import '../Views/add_task_goal_view.dart';
import '../Views/add_task_idea_view.dart';
import '../Views/add_task_plan_view.dart';
import '../Models/goal_class.dart';
import '../Views/home_view.dart';
import '../Models/idea_class.dart';





/**
 * custom widget for goal (used in all_goals_view)
 */
class CustomGoalAllTasksWidget extends StatefulWidget {


  Goal goal;

  CustomGoalAllTasksWidget(this.goal);

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
        color: Color(widget.goal.color),
        onPressed: () {
          GoalViewPopUp(widget.goal, navigateFunction: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AllTasksPage(0))),).build(context);
        },
        child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: (widget.goal.description.length == 0) ? MainAxisAlignment.center : MainAxisAlignment.start , //Center Column contents vertically,
                        crossAxisAlignment: (widget.goal.description.length == 0) ? CrossAxisAlignment.center : CrossAxisAlignment.start, //Center Column contents horizontally,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: AutoSizeText(
                                  widget.goal.title + ": ",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Flexible(
                                child: AutoSizeText(
                                  widget.goal.subtitle,
                                  style: TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: AutoSizeText(
                                  widget.goal.description,
                                  style: TextStyle(
                                      fontSize: 10, fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: (MediaQuery.of(context).size.height > 750) ? 3 : 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                        crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.goal.deadlineToDateDeadline(),
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
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

  Plan plan;

  CustomPlanAllTasksWidget(this.plan);
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
        color: Color(widget.plan.color),
        onPressed: () {
          PlanViewPopUp(widget.plan, navigateFunction: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AllTasksPage(1))),).build(context);
          },
        child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            child: Row(
            children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          mainAxisAlignment: (widget.plan.description.length == 0) ? MainAxisAlignment.center : MainAxisAlignment.start , //Center Column contents vertically,
                          crossAxisAlignment: (widget.plan.description.length == 0) ? CrossAxisAlignment.center : CrossAxisAlignment.start, //Center Column contents horizontally,
                          children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      widget.plan.title + ": ",
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      widget.plan.subtitle,
                                      style: TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.normal),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: AutoSizeText(
                                    widget.plan.description,
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.normal),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: (MediaQuery.of(context).size.height > 750) ? 3 : 2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                Row(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.plan.deadlineToDateDeadline(),
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.plan.deadlineToTimeDeadline(),
                                style: TextStyle(fontSize: (MediaQuery.of(context).size.height > 750) ? 12 : 10, fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
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

  Idea idea;
  CustomIdeaAllTasksWidget(this.idea);
  
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
        color: Color(widget.idea.color),
        onPressed: () {
          IdeaViewPopUp(widget.idea, navigateFunction: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AllTasksPage(2))),).build(context);
        },
        child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            child: Column(
              mainAxisAlignment: (widget.idea.description.length == 0) ? MainAxisAlignment.center : MainAxisAlignment.start , //Center Column contents vertically,
              crossAxisAlignment: (widget.idea.description.length == 0) ? CrossAxisAlignment.center : CrossAxisAlignment.start, //Center Column contents horizontally,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              widget.idea.title + ": ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Flexible(
                            child: AutoSizeText(
                              widget.idea.subtitle,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.normal),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        widget.idea.description,
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





