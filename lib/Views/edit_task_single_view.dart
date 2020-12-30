import 'package:auto_size_text/auto_size_text.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_single_task_view.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:intl/intl.dart';
import '../Models/goal_class.dart';
import '../Models/idea_class.dart';
import 'home_view.dart';

/**
 * this class displays a goal information in a pop-up view
 */
class GoalEditViewPopUp extends StatelessWidget {

  final VoidCallback navigateFunction;

  Goal goal;
  DateTime deadline;
  String description;
  String title;
  String subtitle;

  final _titleFormKey = GlobalKey<FormState>();
  final _subTitleFormKey = GlobalKey<FormState>();

  bool _titleIsValid = false;
  bool _subTitleIsValid = false;

  TextEditingController titleController = new TextEditingController();
  TextEditingController subTitleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  GoalEditViewPopUp(this.goal, {this.navigateFunction}) {
    title = goal.getTitle();
    subtitle = goal.getSubTitle();
    deadline = goal.getDeadline();
    description = goal.getDescription();
  }



  @override
  Widget build(BuildContext context) {
    titleController = new TextEditingController(text: title);
    subTitleController = new TextEditingController(text: subtitle);
    descriptionController = new TextEditingController(text: description);
    _titleIsValid = false;
    _subTitleIsValid = false;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),),
          elevation: 16,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.50,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.75,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: ListView(
                children: [
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03,
                left: MediaQuery.of(context).size.width * 0.03),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      child: Form(
                        key: _titleFormKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value
                                .trim()
                                .isEmpty) {
                              _titleIsValid = false;
                              return "You can't have an empty title";
                            } else if (value
                                .trim()
                                .length > 15) {
                              _titleIsValid = false;
                              return "Maximum length is 15 characters";
                            } else {
                              _titleIsValid = true;
                              return null;
                            }
                          },
                          controller: titleController,
                          style: TextStyle(
                              fontSize: 15),
                        ),
                      ),),
                  ]),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03,
                          left: MediaQuery.of(context).size.width * 0.03),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      child: Form(
                        key: _subTitleFormKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value
                                .trim()
                                .isEmpty) {
                              _subTitleIsValid = false;
                              return "You can't have an empty subtitle";
                            } else if (value
                                .trim()
                                .length > 30) {
                              _subTitleIsValid = false;
                              return "Maximum length is 30 characters";
                            } else {
                              _subTitleIsValid = true;
                              return null;
                            }
                          },
                          controller: subTitleController,
                          style: TextStyle(
                              fontSize: 15),
                        ),
                      ),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.15,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    child: TextFormField(
                      controller: descriptionController,
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03),
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01,),
                    //for calendar
                    child: CalendarTimeline(
                      initialDate: deadline,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100, 01, 01),
                      onDateSelected: (date) {
                        deadline = date;
                      },
                      monthColor: Colors.black,
                      dayColor: Colors.teal[200],
                      dayNameColor: Color(0xFF333A47),
                      activeDayColor: Colors.white,
                      activeBackgroundDayColor: Colors.redAccent[100],
                      dotsColor: Color(0xFF333A47),
                      locale: 'en_ISO',
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.375,
                            child: CustomCancelButton(),
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.375,
                            child: CustomConfirmButton(navigateFunction: () =>
                                confirmEditTask(goal, context)),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void confirmEditTask(Goal goal, BuildContext context) {
      _titleFormKey.currentState.validate();
      _subTitleFormKey.currentState.validate();
      if (_titleIsValid &&
          _subTitleIsValid &&
          deadline != null) {
        goal.setTitle(titleController.text);
        goal.setSubtitle(subTitleController.text);
        goal.setDescription(descriptionController.text);
        goal.setDeadline(deadline);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        //this function replaces navigation to needed page
        navigateFunction();

    }
  }
}


/**
 * this class displays an edit plan in a pop-up view
 */
class PlanEditViewPopUp extends StatelessWidget {

  final VoidCallback navigateFunction;

  Plan plan;
  DateTime deadline;
  String description;
  String title;
  String subtitle;

  Duration hourDeadline = new Duration(hours: 0, minutes: 0);


  final _titleFormKey = GlobalKey<FormState>();
  final _subTitleFormKey = GlobalKey<FormState>();

  bool _titleIsValid = false;
  bool _subTitleIsValid = false;
  bool _deadlineIsValid = false;


  TextEditingController titleController = new TextEditingController();
  TextEditingController subTitleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  PlanEditViewPopUp(this.plan, {this.navigateFunction}) {
    title = plan.getTitle();
    subtitle = plan.getSubTitle();
    deadline = plan.getDeadline();
    description = plan.getDescription();
  }



  @override
  Widget build(BuildContext context) {
    titleController = new TextEditingController(text: title);
    subTitleController = new TextEditingController(text: subtitle);
    descriptionController = new TextEditingController(text: description);
    _titleIsValid = false;
    _subTitleIsValid = false;
    _deadlineIsValid = false;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),),
          elevation: 16,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.6,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.75,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,),
              child: ListView(
                children: [
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.03,
                          left: MediaQuery.of(context).size.width * 0.03),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      child: Form(
                        key: _titleFormKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value
                                .trim()
                                .isEmpty) {
                              _titleIsValid = false;
                              return "You can't have an empty title";
                            } else if (value
                                .trim()
                                .length > 15) {
                              _titleIsValid = false;
                              return "Maximum length is 15 characters";
                            } else {
                              _titleIsValid = true;
                              return null;
                            }
                          },
                          controller: titleController,
                          style: TextStyle(
                              fontSize: 15),
                        ),
                      ),),
                  ]),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.03,
                          left: MediaQuery.of(context).size.width * 0.03),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      child: Form(
                        key: _subTitleFormKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value
                                .trim()
                                .isEmpty) {
                              _subTitleIsValid = false;
                              return "You can't have an empty subtitle";
                            } else if (value
                                .trim()
                                .length > 30) {
                              _subTitleIsValid = false;
                              return "Maximum length is 30 characters";
                            } else {
                              _subTitleIsValid = true;
                              return null;
                            }
                          },
                          controller: subTitleController,
                          style: TextStyle(
                              fontSize: 15),
                        ),
                      ),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.15,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    child: TextFormField(
                      controller: descriptionController,
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03),
                    //for calendar
                    child: CalendarTimeline(
                      initialDate: deadline,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100, 01, 01),
                      onDateSelected: (date) {
                        deadline = date;
                      },
                      monthColor: Colors.black,
                      dayColor: Colors.teal[200],
                      dayNameColor: Color(0xFF333A47),
                      activeDayColor: Colors.white,
                      activeBackgroundDayColor: Colors.redAccent[100],
                      dotsColor: Color(0xFF333A47),
                      locale: 'en_ISO',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03),
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01,),
                    //container for time picker
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CupertinoTimerPicker(
                      initialTimerDuration: Duration(hours: deadline.hour, minutes: deadline.minute),
                      mode: CupertinoTimerPickerMode.hm,
                      onTimerDurationChanged: (data) {
                        hourDeadline = data;
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.375,
                            child: CustomCancelButton(),
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.375,
                            child: CustomConfirmButton(navigateFunction: () =>
                                confirmEditTask(plan, context)),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void confirmEditTask(Plan plan, BuildContext context) {
    print(DateTime.now().toString());
    _titleFormKey.currentState.validate();
    _subTitleFormKey.currentState.validate();

    String stringHourDuration =
        "${hourDeadline.inHours}:${hourDeadline.inMinutes.remainder(60)}";
    List<String> stringDurationList =
    stringHourDuration.split(":");
    int hour =
    int.parse(stringDurationList[0]);
    int minute =
    int.parse(stringDurationList[1]);

    DateTime newDeadline = new DateTime(
        deadline.year,
        deadline.month,
        deadline.day,
        hour,
        minute);

    if (newDeadline.isBefore(DateTime.now()) ||
        newDeadline.isAtSameMomentAs(
            DateTime.now())) {
      _deadlineIsValid = false;
    } else {
      _deadlineIsValid = true;
    }

    if (_titleIsValid &&
        _subTitleIsValid &&
        _deadlineIsValid) {
      plan.setTitle(titleController.text);
      plan.setSubtitle(subTitleController.text);
      plan.setDescription(descriptionController.text);
      plan.setDeadline(newDeadline);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      //this function replaces navigation to needed page
      navigateFunction();
    }
  }
}



/**
 * this class displays an edit idea in a pop-up view
 */
class IdeaEditViewPopUp extends StatelessWidget {

  Idea idea;
  String description;
  String title;
  String subtitle;

  final VoidCallback navigateFunction;


  final _titleFormKey = GlobalKey<FormState>();
  final _subTitleFormKey = GlobalKey<FormState>();

  bool _titleIsValid = false;
  bool _subTitleIsValid = false;

  TextEditingController titleController = new TextEditingController();
  TextEditingController subTitleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  IdeaEditViewPopUp(this.idea, {this.navigateFunction}) {
    title = idea.getTitle();
    subtitle = idea.getSubtitle();
    description = idea.getDescription();
  }



  @override
  Widget build(BuildContext context) {
    titleController = new TextEditingController(text: title);
    subTitleController = new TextEditingController(text: subtitle);
    descriptionController = new TextEditingController(text: description);
    _titleIsValid = false;
    _subTitleIsValid = false;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),),
          elevation: 16,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.40,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.75,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,),
              child: ListView(
                children: [
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.03,
                          left: MediaQuery.of(context).size.width * 0.03),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      child: Form(
                        key: _titleFormKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value
                                .trim()
                                .isEmpty) {
                              _titleIsValid = false;
                              return "You can't have an empty title";
                            } else if (value
                                .trim()
                                .length > 15) {
                              _titleIsValid = false;
                              return "Maximum length is 15 characters";
                            } else {
                              _titleIsValid = true;
                              return null;
                            }
                          },
                          controller: titleController,
                          style: TextStyle(
                              fontSize: 15),
                        ),
                      ),),
                  ]),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.03,
                          left: MediaQuery.of(context).size.width * 0.03),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      child: Form(
                        key: _subTitleFormKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value
                                .trim()
                                .isEmpty) {
                              _subTitleIsValid = false;
                              return "You can't have an empty subtitle";
                            } else if (value
                                .trim()
                                .length > 30) {
                              _subTitleIsValid = false;
                              return "Maximum length is 30 characters";
                            } else {
                              _subTitleIsValid = true;
                              return null;
                            }
                          },
                          controller: subTitleController,
                          style: TextStyle(
                              fontSize: 15),
                        ),
                      ),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03),
                    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.01,),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    child: TextFormField(
                      controller: descriptionController,
                      maxLines: 7,
                      style: TextStyle(
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Center(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.375,
                              child: CustomConfirmButton(navigateFunction: () =>
                                  confirmEditTask(idea, context)),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.375,
                              child: CustomCancelButton(),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void confirmEditTask(Idea idea, BuildContext context) {
    _titleFormKey.currentState.validate();
    _subTitleFormKey.currentState.validate();
    if (_titleIsValid &&
        _subTitleIsValid) {
      idea.setTitle(titleController.text);
      idea.setSubtitle(subTitleController.text);
      idea.setDescription(descriptionController.text);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);

      navigateFunction();
    }
  }
}


