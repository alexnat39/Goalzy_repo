import 'package:auto_size_text/auto_size_text.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_single_task_view.dart';
import 'package:goalzy_app/Database/database_service.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Services/goal_service.dart';
import 'package:goalzy_app/Services/idea_service.dart';
import 'package:goalzy_app/Services/plan_service.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../Models/goal_class.dart';
import '../Models/idea_class.dart';
import 'home_view.dart';

/**
 * this class displays a goal information in a pop-up view
 */
class GoalEditViewPopUp extends StatelessWidget {

  final VoidCallback navigateFunction;


  var _databaseService = DatabaseService();
  
  Goal goalPassedIn;
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

  GoalEditViewPopUp(this.goalPassedIn, {this.navigateFunction}) {
    title = goalPassedIn.title;
    subtitle = goalPassedIn.subtitle;
    deadline = DateTime.parse(goalPassedIn.deadline);
    description = goalPassedIn.description;
  }



  @override
  Widget build(BuildContext context) {

    initializeDateFormatting();

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
                  .height * 0.47,
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
                                editGoalFirestore(context)),
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
  void editGoalFirestore(BuildContext context) async {
    _titleFormKey.currentState.validate();
      _subTitleFormKey.currentState.validate();
      if (_titleIsValid &&
          _subTitleIsValid &&
          deadline != null) {

        var _goal = new Goal();
        _goal.id = goalPassedIn.id;
        _goal.dateAdded = goalPassedIn.dateAdded;
        _goal.color = goalPassedIn.color;
        _goal.finished = goalPassedIn.finished;
        _goal.title = titleController.text;
        _goal.subtitle = subTitleController.text;
        _goal.description = descriptionController.text;
        _goal.deadline = deadline.toString();
        
        editGoalLocally(_goal);
        
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        //this function replaces navigation to needed page
        navigateFunction();

        _databaseService.updateGoalInFirestore(_goal);

    }
  }
  void editGoalLocally(Goal goal) {
      MyUser.allGoalsMap["${goal.id}"] = goal;
  }
}


/**
 * this class displays an edit plan in a pop-up view
 */
class PlanEditViewPopUp extends StatelessWidget {

  final VoidCallback navigateFunction;

  
  var _databaseService = DatabaseService();

  Plan planPassedIn;
  DateTime deadline;
  String description;
  String title;
  String subtitle;
  Duration hourDeadline;
  

  final _titleFormKey = GlobalKey<FormState>();
  final _subTitleFormKey = GlobalKey<FormState>();

  bool _titleIsValid = false;
  bool _subTitleIsValid = false;
  bool _deadlineIsValid = false;


  TextEditingController titleController = new TextEditingController();
  TextEditingController subTitleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  PlanEditViewPopUp(this.planPassedIn, {this.navigateFunction}) {
    title = planPassedIn.title;
    subtitle = planPassedIn.subtitle;
    deadline = DateTime.parse(planPassedIn.deadline);
    description = planPassedIn.description;
    hourDeadline = new Duration(hours: deadline.hour, minutes: deadline.minute);
  }

  @override
  Widget build(BuildContext context) {

    initializeDateFormatting();

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
                  .height * 0.58,
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
                                editPlanFirestore(context)),
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
  void editPlanFirestore(BuildContext context) async {


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

      var _plan = new Plan();
      _plan.id = planPassedIn.id;
      _plan.dateAdded = planPassedIn.dateAdded;
      _plan.color = planPassedIn.color;
      _plan.finished = planPassedIn.finished;
      _plan.title = titleController.text;
      _plan.subtitle = subTitleController.text;
      _plan.description = descriptionController.text;
      _plan.deadline = newDeadline.toString();
      editPlanLocally(_plan);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      //this function replaces navigation to needed page
      navigateFunction();
      
      _databaseService.updatePlanInFirestore(_plan);
      
      
    }
  }
  void editPlanLocally(Plan plan) {
      MyUser.allPlansMap["${plan.id}"] = plan;
  }
}



/**
 * this class displays an edit idea in a pop-up view
 */
class IdeaEditViewPopUp extends StatelessWidget {


  var _databaseService = DatabaseService();

  final VoidCallback navigateFunction;

  Idea ideaPassedIn;
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

  IdeaEditViewPopUp(this.ideaPassedIn, {this.navigateFunction}) {
    title = ideaPassedIn.title;
    subtitle = ideaPassedIn.subtitle;
    description = ideaPassedIn.description;
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
                  .height * 0.38,
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
                              child: CustomCancelButton(),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.375,
                              child: CustomConfirmButton(navigateFunction: () =>
                                  editIdeaFirestore(context)),
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
  void editIdeaFirestore(BuildContext context) async {
    _titleFormKey.currentState.validate();
    _subTitleFormKey.currentState.validate();
    if (_titleIsValid &&
        _subTitleIsValid) {
      var _idea = new Idea();
      _idea.id = ideaPassedIn.id;
      _idea.color = ideaPassedIn.color;
      _idea.dateAdded = ideaPassedIn.dateAdded;
      _idea.title = titleController.text;
      _idea.subtitle = subTitleController.text;
      _idea.description = descriptionController.text;
      
      editIdeaLocally(_idea);
      
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      //this function replaces navigation to needed page
      navigateFunction();
      
      _databaseService.updateIdeaInFirestore(_idea);
    }
  }
  void editIdeaLocally(Idea idea) {
      MyUser.allIdeasMap["${idea.id}"] = idea;
  }
}


