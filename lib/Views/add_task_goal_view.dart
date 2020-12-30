import 'package:flutter/cupertino.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_home_view.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Views/home_view.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../CustomWidgets/custom_widget_all_tasks_view.dart';
import '../CustomWidgets/custom_widgets_add_task_view.dart';
import 'add_task_idea_view.dart';
import 'add_task_plan_view.dart';
import '../Models/goal_class.dart';
import 'package:flutter/material.dart';

typedef void VoidCallback();

class AddTaskGoalView extends StatelessWidget {
  final VoidCallback navigateFunction;

  BuildContext context;

  String title;
  String subtitle;
  String description;
  DateTime deadline = DateTime.now();

  final _titleFormKey = GlobalKey<FormState>();
  final _subTitleFormKey = GlobalKey<FormState>();

  bool _titleIsValid = false;
  bool _subTitleIsValid = false;

  TextEditingController titleController = new TextEditingController();
  TextEditingController subTitleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  AddTaskGoalView(this.context, {this.navigateFunction}) {
    build(context);
  }

  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    _titleIsValid = false;
    _subTitleIsValid = false;
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
                            //for top row buttons
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
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                      ]),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
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
                                        case 1:
                                          {
                                            Navigator.of(context).pop();
                                            AddTaskPlanView(
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
                            //for text fields
                            child: buildGoalTextFields(context, titleController,
                                subTitleController, descriptionController),
                          ),
                          Container(
                            //for calendar
                            child: CalendarTimeline(
                              initialDate: DateTime.now(),
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
                            //container for bottom row buttons
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.02),
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Cancel"),
                                        ]),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Add"),
                                        ]),
                                    onPressed: () {
                                      //adds a goal to the goals list once user clicks on it
                                      _titleFormKey.currentState.validate();
                                      _subTitleFormKey.currentState.validate();
                                      if (_titleIsValid &&
                                          _subTitleIsValid &&
                                          deadline != null) {
                                        title = titleController.text;
                                        subtitle = subTitleController.text;
                                        description =
                                            descriptionController.text;
                                        _addGoal(context, title, subtitle,
                                            description, deadline);
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();

                                        navigateFunction();
                                      }
                                    },
                                  ),
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

  Widget buildGoalTextFields(
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

void _addGoal(BuildContext context, String title, String subtitle,
    String description, DateTime deadline) {
  title = title.trim();
  subtitle = subtitle.trim();
  if (description == null) {
    description = "";
  }

  description = description.trim();

  Goal goal = new Goal(
      title,
      subtitle,
      description,
      deadline,
      colorsForGoalWidgets[User.allGoals.length % colorsForGoalWidgets.length],
      false, DateTime.now());
  User.allGoals.add(goal);
}
