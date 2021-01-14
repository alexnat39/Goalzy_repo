import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/goal_class.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/finished_task_single_view.dart';
import 'package:tinycolor/tinycolor.dart';




class CustomGoalPerformanceWidget extends StatefulWidget {

  Goal goal;

  CustomGoalPerformanceWidget(this.goal);

  @override
  _CustomGoalPerformanceWidgetState createState() => _CustomGoalPerformanceWidgetState();
}
class _CustomGoalPerformanceWidgetState extends State<CustomGoalPerformanceWidget> {

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
        color: Color(widget.goal.color).desaturate(75),
        onPressed: () {
          FinishedGoalViewPopUp(widget.goal).build(context);
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





class CustomPlanPerformanceWidget extends StatefulWidget{

  Plan plan;

  CustomPlanPerformanceWidget(this.plan);
  @override
  _CustomPlanPerformanceWidgetState createState() => _CustomPlanPerformanceWidgetState();
}
class _CustomPlanPerformanceWidgetState extends State<CustomPlanPerformanceWidget> {

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
        color: Color(widget.plan.color).desaturate(75),
        onPressed: () {
          FinishedPlanViewPopUp(widget.plan).build(context);
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
                        crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
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
