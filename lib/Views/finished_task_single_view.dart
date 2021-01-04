import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_widget_all_tasks_view.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Services/goal_service.dart';
import 'package:goalzy_app/Services/plan_service.dart';
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
  var _goalService = GoalService();

  FinishedGoalViewPopUp(this.goal);

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
                    goal.deadline.substring(0, goal.deadline.indexOf(" ")),
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
                              restoreFunction: () async {
                                var goalFromSQL = await _goalService.readGoalById(goal.id);
                                goal.id = goalFromSQL[0]['id'];
                                goal.finished = 0;
                                await _goalService.updateGoal(goal);
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
  var _planService = PlanService();
  FinishedPlanViewPopUp(this.plan);

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
                    plan.deadline.substring(0, plan.deadline.indexOf(" ")),
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
                    plan.deadline.substring(plan.deadline.indexOf(" "), plan.deadline.lastIndexOf(":")),
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
                              restoreFunction: () async {
                                var planFromSQL = await _planService.readPlanById(plan.id);
                                plan.id = planFromSQL[0]['id'];
                                plan.finished = 0;
                                await _planService.updatePlan(plan);
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

