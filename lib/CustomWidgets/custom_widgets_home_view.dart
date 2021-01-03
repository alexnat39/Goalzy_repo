import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/home_view.dart';
import 'package:goalzy_app/Views/active_task_single_view.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import '../Views/add_task_goal_view.dart';
import '../Views/add_task_idea_view.dart';
import '../Views/add_task_plan_view.dart';
import '../Models/goal_class.dart';
import '../Models/idea_class.dart';

//BUTTONS
//---------------------------------------------------------------
/**
 * custom add goal button (used in home_view_page)
 */
class CustomAddGoalButton extends StatefulWidget {
  final VoidCallback navigateFunction;
  CustomAddGoalButton({this.navigateFunction});

  @override
  _CustomAddGoalButtonState createState() => _CustomAddGoalButtonState();
}

class _CustomAddGoalButtonState extends State<CustomAddGoalButton> {
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: new CircleBorder(),
      onTap: () {
        AddTaskGoalView(context, navigateFunction: widget.navigateFunction,);
      },
      splashColor: Colors.red[300],
      child: new Icon(
        Icons.add_circle_outline_outlined,
        size: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey[400],
      ),
    );
  }
}

/**
 * custom add plan button (used in home_view_page)
 */
class CustomAddPlanButton extends StatefulWidget {
  final VoidCallback navigateFunction;
  CustomAddPlanButton({this.navigateFunction});

  @override
  _CustomAddPlanButtonState createState() => _CustomAddPlanButtonState();
}

class _CustomAddPlanButtonState extends State<CustomAddPlanButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: new CircleBorder(),
      onTap: () {
        AddTaskPlanView(context, navigateFunction: widget.navigateFunction,);
      },
      splashColor: Colors.green[300],
      child: new Icon(
        Icons.add_circle_outline_outlined,
        size: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey[400],
      ),
    );
  }
}

/**
 * custom add idea button (used in home_view_page)
 */
class CustomAddIdeaButton extends StatefulWidget {
  final VoidCallback navigateFunction;
  CustomAddIdeaButton({this.navigateFunction});

  @override
  _CustomAddIdeaButtonState createState() => _CustomAddIdeaButtonState();
}

class _CustomAddIdeaButtonState extends State<CustomAddIdeaButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: new CircleBorder(),
      onTap: () {
        AddTaskIdeaView(context, navigateFunction: widget.navigateFunction,);
      },
      splashColor: Colors.blue[300],
      child: new Icon(
        Icons.add_circle_outline_outlined,
        size: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey[400],
      ),
    );
  }
}

//---------------------------------------------------------------


//WIDGETS
//---------------------------------------------------------------

/**
 * class for custom goal widget (used in home_view page)
 */
class CustomGoalHomeWidget extends StatefulWidget {
  String title;
  String subtitle;
  String deadlineString = "";
  Color color;
  Goal goal;

  CustomGoalHomeWidget(this.title, this.subtitle, this.deadlineString, this.color, this.goal);
  @override
  _CustomGoalHomeWidgetState createState() => _CustomGoalHomeWidgetState();
}

class _CustomGoalHomeWidgetState extends State<CustomGoalHomeWidget> {
  @override
  Widget build(BuildContext context) {
    //goal widget
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
      width: MediaQuery.of(context).size.width * 0.305,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.transparent)),
        color: widget.color,
        onPressed: () {

          GoalViewPopUp(widget.goal, navigateFunction: () => Navigator.push(context,
                   MaterialPageRoute(builder: (context) => HomePage())),).build(context);
        },
        child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        widget.title,
                        style: TextStyle(
                            fontSize: (widget.title.length >= 10) ? 12 : 15, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.subtitle,
                        style: TextStyle(
                            fontSize: (widget.subtitle.length >= 13) ? 10 : 12, fontWeight: FontWeight.normal),
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
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: AutoSizeText(
                        widget.deadlineString,
                        style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
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
 * class for custom plan widget (used in home_view page)
 */
class CustomPlanHomeWidget extends StatefulWidget {

  String title;
  String subtitle;
  String deadlineDateString = "";
  String deadlineTimeString = "";
  Color color;
  Plan plan;

  CustomPlanHomeWidget(this.title, this.subtitle, this.deadlineDateString,
      this.deadlineTimeString, this.color, this.plan);

  @override
  _CustomPlanHomeWidgetState createState() => _CustomPlanHomeWidgetState();
}

class _CustomPlanHomeWidgetState extends State<CustomPlanHomeWidget> {
  @override
  Widget build(BuildContext context) {
    //goal widget
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
      width: MediaQuery.of(context).size.width * 0.305,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.transparent)),
        color: widget.color,
        onPressed: () {
          PlanViewPopUp(widget.plan, navigateFunction: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage())),).build(context);
        },
        child: Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.005),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: AutoSizeText(
                      widget.title,
                      style: TextStyle(
                          fontSize: (widget.title.length >= 10) ? 12 : 15, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      widget.subtitle,
                      style: TextStyle(
                          fontSize: (widget.subtitle.length >= 13) ? 10 : 12, fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                      maxLines: (MediaQuery.of(context).size.height > 750) ? 2 : 1,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.01),
                  alignment: Alignment.bottomRight,
                  child: FittedBox(
                    child: AutoSizeText(
                      widget.deadlineDateString,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  alignment: Alignment.bottomRight,
                  child: FittedBox(
                    child: AutoSizeText(
                      widget.deadlineTimeString,
                      style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * class for custom idea widget (used in home_view page)
 */
class CustomIdeaHomeWidget extends StatefulWidget {

  String title;
  String subtitle;
  Color color;
  Idea idea;

  CustomIdeaHomeWidget(this.title, this.subtitle, this.color, this.idea);

  @override
  _CustomIdeaHomeWidgetState createState() => _CustomIdeaHomeWidgetState();
}

class _CustomIdeaHomeWidgetState extends State<CustomIdeaHomeWidget> {
  @override
  Widget build(BuildContext context) {
    //goal widget
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.305,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.transparent)),
        color: widget.color,
        onPressed: () {
          IdeaViewPopUp(widget.idea, navigateFunction: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage())),).build(context);        },
        child: Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.005),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: AutoSizeText(
                      widget.title,
                      style: TextStyle(
                          fontSize: (widget.title.length >= 10) ? 12 : 15, fontWeight: FontWeight.bold),
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
                      widget.subtitle,
                      style: TextStyle(
                          fontSize: (widget.subtitle.length >= 20) ? 8 : 12, fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//---------------------------------------------------------------