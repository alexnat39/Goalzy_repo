import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Views/edit_task_single_view.dart';
import 'package:goalzy_app/Views/home_view.dart';

import '../Models/User.dart';
import '../Models/goal_class.dart';
import '../Models/idea_class.dart';


/**
 * custom button for editing a task (used in edit_task_single_view)
 */
class CustomConfirmButton extends StatelessWidget {
  final VoidCallback navigateFunction;

  CustomConfirmButton({this.navigateFunction});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey[500],
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent)),
      onPressed: () {
        navigateFunction();
        },
      child: Text(
        "Confirm",
        style: TextStyle(color: Colors.teal[300]),
      ),
    );
  }
}

/**
 * custom button for editing a goal (used in single_task_view)
 */
class CustomEditButton extends StatelessWidget {
  final VoidCallback navigateFunction;
  CustomEditButton({this.navigateFunction});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey[500],
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent)),
      onPressed: () {
        navigateFunction();
      },
      child: Icon(
        Icons.create_outlined,
        color: Colors.teal[300],
      ),
    );
  }
}


/**
 * custom button for deleting a task (used in single_task_view)
 */
class CustomDeleteButton extends StatelessWidget {

  final VoidCallback deleteFunction;
  final VoidCallback navigateFunction;

  CustomDeleteButton({this.deleteFunction, this.navigateFunction});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey[500],
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent)),
      onPressed: () {
        deleteFunction();
        Navigator.pop(context);
        Navigator.pop(context);

        navigateFunction();
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Icon(
        Icons.delete_forever_outlined,
        color: Colors.red[300],
      ),
    );
  }
}

/**
 * custom button for canceling action with a task (used in single_task_view)
 */
class CustomCancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey[500],
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent)),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Cancel", style: TextStyle(color: Colors.teal[300],),
      ),
    );
  }
}

/**
 * custom button for canceling action with a task (used in single_task_view)
 */
class CustomFinishedButton extends StatelessWidget {

  final VoidCallback finishedFunction;
  final VoidCallback navigateFunction;

  CustomFinishedButton({this.finishedFunction, this.navigateFunction});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey[500],
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent)),
      onPressed: () {
        finishedFunction();
        Navigator.pop(context);
        Navigator.pop(context);
        navigateFunction();
      },
      child: Text("Finished", style: TextStyle(color: Colors.teal[300],),
      ),
    );
  }
}


/**
 * custom button for restoring task from finished tasks (used in finished_task_single_view)
 */
class CustomRestoreButton extends StatelessWidget {

  final VoidCallback restoreFunction;

  CustomRestoreButton({this.restoreFunction});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey[500],
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent)),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        restoreFunction();
      },
      child: Text("Restore", style: TextStyle(color: Colors.teal[300],),
      ),
    );
  }
}
