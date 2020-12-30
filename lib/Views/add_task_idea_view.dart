import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../CustomWidgets/custom_widgets_add_task_view.dart';
import '../Models/User.dart';
import '../CustomWidgets/custom_widget_all_tasks_view.dart';
import 'add_task_goal_view.dart';
import 'add_task_plan_view.dart';
import '../CustomWidgets/custom_widget_all_tasks_view.dart';
import 'home_view.dart';
import '../Models/idea_class.dart';

class AddTaskIdeaView extends StatelessWidget {
  final VoidCallback navigateFunction;

  BuildContext context;

  AddTaskIdeaView(this.context, {this.navigateFunction}) {
    build(context);
  }

  String title;
  String subtitle;
  String description;

  final _titleFormKey = GlobalKey<FormState>();
  final _subTitleFormKey = GlobalKey<FormState>();

  bool _titleIsValid = false;
  bool _subTitleIsValid = false;

  TextEditingController titleController = new TextEditingController();
  TextEditingController subTitleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  List<bool> isSelected = [false, false, true];

  @override
  Widget build(BuildContext context) {
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
                                      }
                                    });
                                  },
                                  isSelected: isSelected,
                                )
                              ],
                            ),
                          ),
                          Container(
                            // for text fields
                            child: buildIdeaTextFields(context, titleController,
                                subTitleController, descriptionController),
                          ),
                          Container(
                            // for bottom row buttons
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
                                      if (_titleIsValid && _subTitleIsValid) {
                                        title = titleController.text;
                                        subtitle = subTitleController.text;
                                        description =
                                            descriptionController.text;
                                        _addIdea(title, subtitle, description,
                                            context);

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

  Widget buildIdeaTextFields(
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
                              } else if (value.trim().length > 25) {
                                _titleIsValid = false;
                                return "Maximum length is 25 characters";
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
                              } else if (value.trim().length > 50) {
                                _subTitleIsValid = false;
                                return "Maximum length is 50 characters";
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

void _addIdea(
    String title, String subtitle, String description, BuildContext context) {
  title = title.trim();
  subtitle = subtitle.trim();
  if (description == null) {
    description = "";
  }
  description = description.trim();

  Idea idea = new Idea(title, subtitle, description,
      colorsForIdeaWidgets[User.allIdeas.length % colorsForIdeaWidgets.length], DateTime.now());
  User.allIdeas.add(idea);
}
