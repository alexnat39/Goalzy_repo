import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_widget_all_tasks_view.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Services/goal_service.dart';
import 'package:goalzy_app/Services/idea_service.dart';
import 'package:goalzy_app/Services/plan_service.dart';
import 'package:goalzy_app/Views/add_task_goal_view.dart';
import 'package:goalzy_app/Views/edit_task_single_view.dart';
import 'package:intl/intl.dart';
import '../CustomWidgets/custom_widgets_single_task_view.dart';
import '../Models/User.dart';
import '../Models/goal_class.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../Models/idea_class.dart';

/**
 * this class displays a goal information in a pop-up view
 */
class GoalViewPopUp extends StatelessWidget {
  final VoidCallback navigateFunction;
  var _goalService = GoalService();
  Goal goalPassedIn;

  GoalViewPopUp(this.goalPassedIn, {this.navigateFunction});

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
                      width: MediaQuery.of(context).size.width * 0.75,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                      ),
                      height: MediaQuery.of(context).size.height * 0.05,

                      child: AutoSizeText(
                        goalPassedIn.title,
                        style: TextStyle(fontSize: 40, color: Colors.black54),
                        maxLines: 1,
                      ))
                ]),
                Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.04,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: AutoSizeText(
                      goalPassedIn.subtitle,
                       maxLines: 1,
                       style: TextStyle(fontSize: 30, color: Colors.black54)
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
                                : goalPassedIn.description, style: TextStyle(color: Colors.black54),
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
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                    maxLines: 1,
                  ),
                ),
                Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: CustomEditButton(
                              navigateFunction: () => GoalEditViewPopUp(
                                    goalPassedIn,
                                    navigateFunction: navigateFunction,
                                  ).build(context)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: CustomDeleteButton(
                              deleteFunction: () {
                                _goalService.deleteGoal(goalPassedIn.id);
                                _goalService.deleteGoal(goalPassedIn.id);
                              },
                              navigateFunction: navigateFunction),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: CustomFinishedButton(
                            finishedFunction: () async {
                              var goalFromSQL = await _goalService.readGoalById(goalPassedIn.id);
                              goalPassedIn.id = goalFromSQL[0]['id'];
                              goalPassedIn.finished = 1;
                              await _goalService.updateGoal(goalPassedIn);
                            },
                            navigateFunction: navigateFunction,
                          ),
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
class PlanViewPopUp extends StatelessWidget {

  var _planService = PlanService();
  Plan planPassedIn;


  final VoidCallback navigateFunction;

  PlanViewPopUp(this.planPassedIn, {this.navigateFunction});

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
                        style: TextStyle(fontSize: 40, color: Colors.black54,),
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
                        style: TextStyle(fontSize: 30, color: Colors.black54),
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
                                : planPassedIn.description, style: TextStyle(color: Colors.black54)
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
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                        maxLines: 1,
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: Text(
                        planPassedIn.deadline
                            .substring(0, planPassedIn.deadline.indexOf(" ")),
                        style: TextStyle(fontSize: 20, color: Colors.black54),
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
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: CustomEditButton(
                              navigateFunction: () => PlanEditViewPopUp(
                                planPassedIn,
                                navigateFunction: navigateFunction,
                              ).build(context)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: CustomDeleteButton(
                              deleteFunction: () {
                                _planService.deletePlan(planPassedIn.id);
                              },
                              navigateFunction: navigateFunction),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: CustomFinishedButton(
                            finishedFunction: () async {
                              var planFromSQL = await _planService.readPlanById(planPassedIn.id);
                              planPassedIn.id = planFromSQL[0]['id'];
                              planPassedIn.finished = 1;
                              await _planService.updatePlan(planPassedIn);
                            },
                            navigateFunction: navigateFunction,
                          ),
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
 * this class displays an idea information in a pop-up view
 */
class IdeaViewPopUp extends StatelessWidget {

  var _ideaService = IdeaService();
  Idea idea;
  final VoidCallback navigateFunction;

  IdeaViewPopUp(this.idea, {this.navigateFunction});

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
            height: MediaQuery.of(context).size.height * 0.37,
            width: MediaQuery.of(context).size.width * 0.75,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02),
            child: Column(
              children: [
                Row(children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.05,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
                      child: AutoSizeText(
                        idea.title,
                        style: TextStyle(fontSize: 40, color: Colors.black54),
                        maxLines: 1,
                      ))
                ]),
                Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.04,
                    padding: EdgeInsets.only(
                         left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
                    child: AutoSizeText(
                      idea.subtitle,
                      maxLines: 1,
                      style: TextStyle(fontSize: 30, color: Colors.black54),
                    ),
                  )
                ]),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.20,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.width * 0.01),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            (idea.description == null ||
                                idea.description == "")
                                ? "No description available"
                                : idea.description, style: TextStyle(color: Colors.black54)
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.375,
                          child: CustomEditButton(
                              navigateFunction: () => IdeaEditViewPopUp(
                                idea,
                                navigateFunction: navigateFunction,
                              ).build(context)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.375,
                          child: CustomDeleteButton(
                              deleteFunction: () {
                                _ideaService.deleteIdea(idea.id);
                              },
                              navigateFunction: navigateFunction),
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


void finishTask(var task) {
  if (task is Goal) {
   // task.setFinished(true);
    MyUser.finishedGoals.add(task);
    MyUser.remainingGoals.remove(task);
  } else if (task is Plan) {
    //task.setFinished(true);
    MyUser.finishedPlans.add(task);
    MyUser.remainingPlans.remove(task);
  } else {
    print("nothing has been removed");
  }
}
