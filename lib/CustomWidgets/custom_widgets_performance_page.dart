import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/goal_class.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/finished_task_single_view.dart';
import 'package:tinycolor/tinycolor.dart';




class CustomGoalPerformanceWidget extends StatefulWidget {

  String title;
  String subtitle;
  String description;
  String deadlineString = "";
  Color color;
  Goal goal;

  CustomGoalPerformanceWidget(this.title, this.subtitle, this.deadlineString, this.description, this.color, this.goal);

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
        color: widget.color.desaturate(75),
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
                        mainAxisAlignment: (widget.description.length == 0) ? MainAxisAlignment.center : MainAxisAlignment.start , //Center Column contents vertically,
                        crossAxisAlignment: (widget.description.length == 0) ? CrossAxisAlignment.center : CrossAxisAlignment.start, //Center Column contents horizontally,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: AutoSizeText(
                                  widget.title + ": ",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Flexible(
                                child: AutoSizeText(
                                  widget.subtitle,
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
                                  widget.description,
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
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.033),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                        crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.deadlineString,
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

  Color color;
  String title;
  String subtitle;
  String description;
  String deadlineDateString = "";
  String deadlineTimeString = "";
  Plan plan;

  CustomPlanPerformanceWidget(this.title, this.subtitle, this.description, this.deadlineDateString,
      this.deadlineTimeString, this.color, this.plan);
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
        color: widget.color.desaturate(75),
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
                        mainAxisAlignment: (widget.description.length == 0) ? MainAxisAlignment.center : MainAxisAlignment.start , //Center Column contents vertically,
                        crossAxisAlignment: (widget.description.length == 0) ? CrossAxisAlignment.center : CrossAxisAlignment.start, //Center Column contents horizontally,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: AutoSizeText(
                                  widget.title + ": ",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Flexible(
                                child: AutoSizeText(
                                  widget.subtitle,
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
                                  widget.description,
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
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.033),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                        crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.deadlineDateString,
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.deadlineTimeString,
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
