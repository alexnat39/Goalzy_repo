import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Services/database_service.dart';
import 'package:goalzy_app/Views/add_task_goal_view.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final VoidCallback onPressYesFunction;
  String title;
  String subtitle;

  ConfirmDeleteDialog(this.title, this.subtitle, {this.onPressYesFunction});

  @override
  Widget build(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            elevation: 16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blueGrey[700],
              ),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white38),
                    ),
                    Text(subtitle, style: TextStyle(color: Colors.white38),),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonTheme(
                            height: MediaQuery.of(context).size.height * 0.05,
                            minWidth: MediaQuery.of(context).size.width * 0.3,
                            child: RaisedButton(
                              color: Colors.blueGrey[600],
                                child: Text("Yes", style: TextStyle(color: Colors.white38),),
                                onPressed: () {
                                  onPressYesFunction();
                                }),
                          ),
                          ButtonTheme(
                            height: MediaQuery.of(context).size.height * 0.05,
                            minWidth: MediaQuery.of(context).size.width * 0.3,
                            child: RaisedButton(
                                color: Colors.blueGrey[600],
                                child: Text("No", style: TextStyle(color: Colors.white38),),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
