import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_widget_all_tasks_view.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/add_task_goal_view.dart';
import 'package:goalzy_app/Views/edit_task_single_view.dart';
import 'package:goalzy_app/Views/performance_view.dart';
import 'package:intl/intl.dart';
import '../CustomWidgets/custom_widgets_single_task_view.dart';
import '../Models/User.dart';
import '../Models/goal_class.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../Models/idea_class.dart';

/**
 * this class displays a goal information in a pop-up view
 */
class FinishedGoalViewPopUp extends StatelessWidget {

  Goal goal;
  String deadlineString;

FinishedGoalViewPopUp(this.goal) {
    deadlineString = "" + DateFormat('yyyy-MM-dd').format(goal.getDeadline());
  }

  @override
  Widget build(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          elevation: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[700],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              children: [
                Row(children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: AutoSizeText(
                        goal.getTitle(),
                        style: TextStyle(fontSize: 40, color: Colors.grey[400]),
                      ))
                ]),
                Row(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: AutoSizeText(
                        goal.getSubTitle(),
                        minFontSize: 15,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 25, color: Colors.grey[400])
                    ),
                  )
                ]),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.01,
                      top: MediaQuery.of(context).size.width * 0.01),
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          AutoSizeText(
                            (goal.getDescription() == null ||
                                goal.getDescription() == "")
                                ? "No description available"
                                : goal.getDescription(), style: TextStyle(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.01,
                  ),
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    deadlineString,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                  ),
                ),
                Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.375,
                          child: CustomCancelButton(),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.375,
                          child: CustomRestoreButton(
                              restoreFunction: () {
                                goal.setFinished(false);
                                User.finishedGoals.remove(goal);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PerformancePage(0)));
                              }),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/**
 * this class displays a plan information in a pop-up view
 */
class FinishedPlanViewPopUp extends StatelessWidget {
  Plan plan;
  String deadlineDateString;
  String deadlineTimeString;

  FinishedPlanViewPopUp(this.plan) {
    deadlineDateString =
        "" + DateFormat('yyyy-MM-dd').format(plan.getDeadline());
    deadlineTimeString = "" + DateFormat.Hm().format(plan.getDeadline());
  }

  @override
  Widget build(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          elevation: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[700],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            height: MediaQuery.of(context).size.height * 0.39,
            width: MediaQuery.of(context).size.width * 0.75,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,),
            child: Column(
              children: [
                Row(children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: AutoSizeText(
                        plan.getTitle(),
                        style: TextStyle(fontSize: 40, color: Colors.grey[400]),
                      ))
                ]),
                Row(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: AutoSizeText(
                      plan.getSubTitle(),
                      minFontSize: 15,
                      overflow: TextOverflow.ellipsis,

                      // style: TextStyle(fontSize: 25)
                    ),
                  )
                ]),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.01,
                      top: MediaQuery.of(context).size.width * 0.01,
                      bottom: MediaQuery.of(context).size.width * 0.005),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          AutoSizeText(
                            (plan.getDescription() == null ||
                                plan.getDescription() == "")
                                ? "No description available"
                                : plan.getDescription(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.01),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    deadlineDateString,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.01,),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    deadlineTimeString,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                  ),
                ),
                Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.375,
                          child: CustomCancelButton(),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.375,
                          child: CustomRestoreButton(
                              restoreFunction: () {
                                plan.setFinished(false);
                                User.finishedPlans.remove(plan);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PerformancePage(1)));
                              }),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

