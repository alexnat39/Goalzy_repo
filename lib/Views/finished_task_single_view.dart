import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Services/goal_service.dart';
import 'package:goalzy_app/Services/plan_service.dart';
import 'package:goalzy_app/Views/performance_view.dart';
import '../CustomWidgets/custom_widgets_single_task_view.dart';
import '../Models/goal_class.dart';
import 'package:auto_size_text/auto_size_text.dart';

/**
 * this class displays a goal information in a pop-up view
 */
class FinishedGoalViewPopUp extends StatelessWidget {

  Goal goalPassedIn;
  String deadlineString;
  var _goalService = GoalService();

  FinishedGoalViewPopUp(this.goalPassedIn);

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
                        goalPassedIn.title,
                        style: TextStyle(fontSize: 40, color: Colors.grey[400]),
                        maxLines: 1,
                      ))
                ]),
                Row(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: AutoSizeText(
                        goalPassedIn.subtitle,
                        maxLines: 1,
                        style: TextStyle(fontSize: 30, color: Colors.grey[400])
                    ),
                  )
                ]),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.width * 0.01,
                      bottom: MediaQuery.of(context).size.width * 0.005),
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            (goalPassedIn.description == null ||
                                goalPassedIn.description == "")
                                ? "No description available"
                                : goalPassedIn.description, style: TextStyle(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.02,
                  ),
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    goalPassedIn.deadline.substring(0, goalPassedIn.deadline.indexOf(" ")),
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
                          child: CustomRestoreButton(restoreFunction: () async {
                            var planFromSQL = await _goalService.readGoalById(goalPassedIn.id);
                            goalPassedIn.id = planFromSQL[0]['id'];
                            goalPassedIn.finished = 0;
                            await _goalService.updateGoal(goalPassedIn);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PerformancePage(0)));
                          })
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
  Plan planPassedIn;
  var _planService = PlanService();
  FinishedPlanViewPopUp(this.planPassedIn);

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
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.05,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
                      child: AutoSizeText(
                        planPassedIn.title,
                        maxLines: 1,
                        style: TextStyle(fontSize: 40, color: Colors.grey[400],),
                      ))
                ]),
                Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: AutoSizeText(
                      planPassedIn.subtitle,
                      maxLines: 1,
                      style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                    ),
                  )
                ]),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.17,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.width * 0.01,
                      bottom: MediaQuery.of(context).size.width * 0.005),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            (planPassedIn.description == null ||
                                planPassedIn.description == "")
                                ? "No description available"
                                : planPassedIn.description,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.02,
                    left: MediaQuery.of(context).size.width * 0.02,
                  ),
                  child: Row(children: [
                    FittedBox(
                      child: Text(
                        planPassedIn.deadline.substring(
                            planPassedIn.deadline.indexOf(" "),
                            planPassedIn.deadline.lastIndexOf(":")),
                        style: TextStyle(fontSize: 20),
                        maxLines: 1,
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: Text(
                        planPassedIn.deadline
                            .substring(0, planPassedIn.deadline.indexOf(" ")),
                        style: TextStyle(fontSize: 20),
                        maxLines: 1,
                      ),
                    ),
                  ]),
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
                                var planFromSQL = await _planService.readPlanById(planPassedIn.id);
                                planPassedIn.id = planFromSQL[0]['id'];
                                planPassedIn.finished = 0;
                                await _planService.updatePlan(planPassedIn);
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




