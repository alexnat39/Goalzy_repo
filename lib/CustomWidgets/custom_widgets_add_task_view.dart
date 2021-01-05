import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * class for custom toggle buttons inside add_task pages
 */
class CustomToggleButton extends StatelessWidget {
  String title;

  CustomToggleButton(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Center(child: Text(title, style: TextStyle(fontSize: 20))),
    );
  }
}


class CustomAddTaskDropDownButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return RaisedButton(
     color: Colors.blueGrey[400],
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(5.0),
     ),
     child: Row(
         mainAxisAlignment:
         MainAxisAlignment.center,
         children: [
           Icon(
             Icons.arrow_drop_down,
             color: Colors.teal[300],
           ),
         ]),
     onPressed: () {
       Navigator.of(context).pop();
     },
   );
  }
  
}

class CustomAddTaskAddButton extends StatelessWidget{
  final VoidCallback addFunction;
  CustomAddTaskAddButton({this.addFunction});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
        children: [
          Text("Add", style: TextStyle(color: Colors.teal[300]),),
          ]),
      onPressed: () {
        addFunction();
      },
    );
  }
}

class CustomAddTaskCancelButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Text("Cancel", style: TextStyle(color: Colors.teal[300]),),
          ]),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

}