import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/ChartWidgets/plan_percent_indicator.dart';
import 'package:goalzy_app/Views/add_task_goal_view.dart';
import 'package:goalzy_app/Views/all_tasks_view.dart';
import 'package:goalzy_app/Views/home_view.dart';
import 'package:goalzy_app/Views/performance_view.dart';

/**
 * builds out a drawer of the app
 */
class CustomDrawer extends StatefulWidget {
  final VoidCallback navigateFunction;

  CustomDrawer({this.navigateFunction});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[700],
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              //container for drawer header
              height: MediaQuery.of(context).size.height * 0.1,
              child: DrawerHeader(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Goalzy",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'OpenSans',
                          color: Colors.grey[300]),
                    ),
                    Spacer(),
                    ClipOval(
                      child: Material(
                        color: Colors.blueGrey[700], // button color
                        child: InkWell(
                          splashColor: Colors.grey, // inkwell color
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              child: Icon(Icons.settings_rounded,
                                  color: Colors.grey[300])),
                          onTap: () {
                            //todo launch settings page
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              //container for plans button (sidebar)
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blueGrey[700],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[800].withOpacity(1),
                    spreadRadius: 1,
                    blurRadius: 0,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.005),
              child: RaisedButton(
                color: Colors.blueGrey[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.home, color: Colors.teal[300]),
                    Text(
                      '   Home',
                      style: TextStyle(fontSize: 20, color: Colors.grey[300]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.3,
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02),
              child: Column(
                children: <Widget>[
                  Row(children: [
                    Expanded(
                      //container for tasks text + add button
                      child: Column(
                        children: [
                          //width: MediaQuery.of(context).size.width * 0.6,
                          Row(
                            children: [
                              Text("Tasks",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Open Sans',
                                      color: Colors.grey[600])),
                              Spacer(),
                              ClipOval(
                                child: Material(
                                  color: Colors.blueGrey[700], // button color
                                  child: InkWell(
                                    splashColor: Colors.grey, // inkwell color
                                    child: Container(
                                        child: Icon(Icons.add,
                                            color: Colors.grey[600])),
                                    onTap: () {
                                      Navigator.pop(context);
                                      AddTaskGoalView(
                                        context,
                                        navigateFunction:
                                            widget.navigateFunction,
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                  addSidebarButton(context, "Goals", Colors.red[300]),
                  addSidebarButton(context, "Plans", Colors.green[300]),
                  addSidebarButton(context, "Ideas", Colors.blue[300]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Text("Miscellaneous",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Open Sans',
                                    color: Colors.grey[600])),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        SideBarPerformanceButton(),
                      ],
                    ),
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}

/**
 * function adds sidebar buttons (sidebar view)
 */
Widget addSidebarButton(BuildContext context, String title, Color color) {
  return Container(
    //container for goals button (sidebar)
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.blueGrey[700],
      boxShadow: [
        BoxShadow(
          color: Colors.grey[800].withOpacity(1),
          spreadRadius: 1,
          blurRadius: 0,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    height: MediaQuery.of(context).size.height * 0.065,
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.005),
    child: RaisedButton(
      color: Colors.blueGrey[700],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.transparent)),
      //color: Colors.blueGrey[700],
      onPressed: () {
        switch (title) {
          case "Goals":
            {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllTasksPage(0, null, null, null)));
              break;
            }
          case "Plans":
            {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllTasksPage(1, null, null, null)));
              break;
            }
          case "Ideas":
            {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllTasksPage(2, null, null, null)));
              break;
            }
        }
      },
      child: Row(
        children: [
          Icon(CupertinoIcons.dot_square, color: color),
          Text(
            '   ' + title,
            style: TextStyle(fontSize: 20, color: Colors.grey[300]),
          ),
        ],
      ),
    ),
  );
}

/**
 * function adds sidebar buttons (sidebar view)
 */
class SideBarPerformanceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //container for goals button (sidebar)
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blueGrey[700],
        boxShadow: [
          BoxShadow(
            color: Colors.grey[800].withOpacity(1),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.065,
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.005),
      child: RaisedButton(
        color: Colors.blueGrey[700],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.transparent)),
        //color: Colors.blueGrey[700],
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PerformancePage(0)));
        },
        child: Row(
          children: [
            Icon(Icons.analytics_outlined, color: Colors.deepPurple[300]),
            Text(
              '   ' + "Performance",
              style: TextStyle(fontSize: 20, color: Colors.grey[300]),
            ),
          ],
        ),
      ),
    );
  }
}
