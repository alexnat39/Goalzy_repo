import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Models/plan_class.dart';
import 'package:goalzy_app/Views/add_task_goal_view.dart';
import 'package:goalzy_app/Views/add_task_idea_view.dart';
import '../CustomWidgets/custom_widgets_add_task_view.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../constants.dart';
import '../main.dart';
import 'home_view.dart';

class AddTaskPlanView extends StatelessWidget {
  final VoidCallback navigateFunction;

  BuildContext context;

  AddTaskPlanView(this.context, {this.navigateFunction}) {
    build(context);
  }

  String title;
  String subtitle;
  String description;
  DateTime dateDeadline = DateTime.now();
  Duration hourDeadline = new Duration(hours: 0, minutes: 0);

  final _titleFormKey = GlobalKey<FormState>();
  final _subTitleFormKey = GlobalKey<FormState>();

  bool _titleIsValid = false;
  bool _subTitleIsValid = false;
  bool _deadlineIsValid = false;

  TextEditingController titleController = new TextEditingController();
  TextEditingController subTitleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  List<bool> isSelected = [false, true, false];

  @override
  Widget build(BuildContext context) {
    _titleIsValid = false;
    _subTitleIsValid = false;
    _deadlineIsValid = false;
    initializeDateFormatting();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: MediaQuery.of(context).size.height,
                child: Scaffold(
                  backgroundColor: Colors.blueGrey[700],
                  body: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Container(
                            //for headline of a page
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Add Task",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'OpenSans',
                                      color: Colors.grey[300]),
                                ),
                                Spacer(),
                                CustomAddTaskDropDownButton(),
                              ],
                            ),
                          ),
                          Container(
                            //for toggle buttons
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ToggleButtons(
                                  fillColor: Colors.redAccent[100],
                                  borderColor: Colors.grey[400],
                                  selectedColor: Colors.white,
                                  selectedBorderColor: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(20),
                                  children: <Widget>[
                                    CustomToggleButton("Goal"),
                                    CustomToggleButton("Plan"),
                                    CustomToggleButton("Idea"),
                                  ],
                                  onPressed: (int index) {
                                    setState(() {
                                      for (int i = 0;
                                          i < isSelected.length;
                                          i++) {
                                        isSelected[i] = i == index;
                                      }
                                      switch (index) {
                                        case 0:
                                          {
                                            Navigator.of(context).pop();
                                            AddTaskGoalView(
                                              context,
                                              navigateFunction:
                                                  navigateFunction,
                                            );
                                            break;
                                          }
                                        case 2:
                                          {
                                            Navigator.of(context).pop();
                                            AddTaskIdeaView(
                                              context,
                                              navigateFunction:
                                                  navigateFunction,
                                            );
                                            break;
                                          }
                                      }
                                    });
                                  },
                                  isSelected: isSelected,
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: buildPlanTextFields(context, titleController,
                                subTitleController, descriptionController),
                          ),
                          Container(
                            child: CalendarTimeline(
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100, 01, 01),
                              onDateSelected: (date) {
                                dateDeadline = date;
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
                            //container for time picker
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.hm,
                              onTimerDurationChanged: (data) {
                                hourDeadline = data;
                              },
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.05,

                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.02),
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: CustomAddTaskCancelButton(),
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height * 0.05,

                                    width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: CustomAddTaskAddButton(addFunction: () async {
                                    //adds a plan to the plans list once user clicks on it
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
                                    DateTime deadline = new DateTime(
                                        dateDeadline.year,
                                        dateDeadline.month,
                                        dateDeadline.day,
                                        hour,
                                        minute);
                                    if (deadline.isBefore(DateTime.now()) ||
                                        deadline.isAtSameMomentAs(
                                            DateTime.now())) {
                                      _deadlineIsValid = false;
                                    } else {
                                      _deadlineIsValid = true;
                                    }

                                    if (_titleIsValid &&
                                        _subTitleIsValid &&
                                        _deadlineIsValid) {
                                      title = titleController.text;
                                      subtitle = subTitleController.text;
                                      description =
                                          descriptionController.text;


                                      await _addPlan(context, title, subtitle, description, deadline);

                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();

                                      navigateFunction();
                                    }
                                  },)
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          });
        });
  }

  Widget buildPlanTextFields(
      context, titleController, subTitleController, descriptionController) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Form(
                          key: _titleFormKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                _titleIsValid = false;
                                return "You can't have an empty title";
                              } else if (value.trim().length > 15) {
                                _titleIsValid = false;
                                return "Maximum length is 15 characters";
                              } else {
                                _titleIsValid = true;
                                return null;
                              }
                            },
                            controller: titleController,
                            decoration: InputDecoration(
                              hintText: "Title",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400]),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400]),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400]),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Form(
                          key: _subTitleFormKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                _subTitleIsValid = false;
                                return "You can't have an empty subtitle";
                              } else if (value.trim().length > 30) {
                                _subTitleIsValid = false;
                                return "Maximum length is 30 characters";
                              } else {
                                _subTitleIsValid = true;
                                return null;
                              }
                            },
                            controller: subTitleController,
                            decoration: InputDecoration(
                              hintText: "Subtitle",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400]),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400]),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400]),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: descriptionController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Description",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]),
                            ),
                          ),
                        )),
                  ],
                ),
                //SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            )));
  }
}


Future<void> _addPlan(BuildContext context, String title, String subtitle,
    String description, DateTime deadline) async {
  String id = "";

  title = title.trim();
  subtitle = subtitle.trim();

  if (description == null) {
    description = "";
  }

  description = description.trim();

  var _plan = new Plan();
  _plan.title = title;
  _plan.subtitle = subtitle;
  _plan.description = description;
  _plan.deadline = deadline.toString();
  _plan.finished = 0;
  _plan.color = colorsForPlanWidgets[activePlansCounter % 7].value;
  _plan.dateAdded = DateTime.now().toString();
  activePlansCounter++;

  await FirebaseFirestore.instance
      .collection('users')
      .doc("${MyUser.uid}")
      .collection("plans")
      .add({
    'title': title,
    'subtitle': subtitle,
    'description': description,
    'deadline': deadline.toString(),
    'finished': 0,
    'color': colorsForPlanWidgets[activePlansCounter % 7].value,
    'dateAdded': DateTime.now().toString(),
  }).then((value) {
    id = value.id.toString();
    _plan.id = value.id.toString();
  });

  MyUser.allPlansMap["$id"] = _plan;

}

