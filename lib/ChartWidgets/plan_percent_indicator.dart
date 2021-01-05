import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlanPercentIndicatorHomePage extends StatefulWidget  {
  var topMargin;
  var bottomMargin;
  PlanPercentIndicatorHomePage(this.bottomMargin, this.topMargin);
  @override
  _PlanPercentIndicatorHomePageState createState() => _PlanPercentIndicatorHomePageState();
}
class _PlanPercentIndicatorHomePageState extends State<PlanPercentIndicatorHomePage> {

  @override
  Widget build(BuildContext context) {
    var percentageCompleted = User.todayFinishedPlans.length / User.todayPlans.length;

    currentProgressColor() {
      if (percentageCompleted * 100 >= 0.0 && percentageCompleted * 100 < 25.0) {
        return Colors.red[300];
      } else if (percentageCompleted * 100 >= 25.0 && percentageCompleted * 100 < 50.0) {
        return Colors.orange[300];
      } else if (percentageCompleted * 100 >= 50.0 && percentageCompleted * 100 < 75.0) {
        return Colors.yellow[300];
      } else if (percentageCompleted * 100 >= 75.0 && percentageCompleted * 100 <= 100.0) {
        return Colors.green[300];
      }
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color:  Colors.pink[100],
      ),
      margin: EdgeInsets.only(bottom: widget.bottomMargin, top: widget.topMargin),
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04, right: MediaQuery.of(context).size.width * 0.04, top: MediaQuery.of(context).size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
          "Performance",
            style: TextStyle(
                color: const Color(0xff0f4a3c),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Today's Plans",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 9,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _buildCircularPercentIndicatorHomePage(context, percentageCompleted, () => currentProgressColor())
            ),
          ),
        ],
      ),
    );
  }
}



Widget _buildCircularPercentIndicatorHomePage(BuildContext context, var percentageCompleted, currentProgressColor()) {
  return CircularPercentIndicator(
    backgroundColor: Colors.blueGrey[600],
    radius: MediaQuery.of(context).size.height * 0.074,
    lineWidth: MediaQuery.of(context).size.height * 0.012,
    animation: true,
    percent: percentageCompleted,
    progressColor: currentProgressColor(),
    // fillColor: color,
    center: Center(
      child: Text(
        "${User.todayFinishedPlans.length} / ${User.todayPlans.length}",
        style: new TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[700]),
      ),
    ),
    circularStrokeCap: CircularStrokeCap.butt,
  );
}











class PlanPercentIndicatorPerformancePage extends StatefulWidget  {
  var topMargin;
  var bottomMargin;
  PlanPercentIndicatorPerformancePage(this.bottomMargin, this.topMargin);

  @override
  _PlanPercentIndicatorPerformancePageState createState() => _PlanPercentIndicatorPerformancePageState();
}
class _PlanPercentIndicatorPerformancePageState extends State<PlanPercentIndicatorPerformancePage> {

  @override
  Widget build(BuildContext context) {
    var percentageCompleted = (User.todayPlans.length == 0) ? 0.0 : User.todayFinishedPlans.length / User.todayPlans.length;
    currentProgressColor() {
      if (percentageCompleted * 100 >= 0.0 && percentageCompleted * 100 < 25.0) {
        return Colors.red[300];
      } else if (percentageCompleted * 100 >= 25.0 && percentageCompleted * 100 < 50.0) {
        return Colors.orange[300];
      } else if (percentageCompleted * 100 >= 50.0 && percentageCompleted * 100 < 75.0) {
        return Colors.yellow[300];
      } else if (percentageCompleted * 100 >= 75.0 && percentageCompleted * 100 <= 100.0) {
        return Colors.green[300];
      }
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.02,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color:  Colors.pink[100],
      ),
      margin: EdgeInsets.only(top: widget.topMargin, bottom: widget.bottomMargin),
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04, right: MediaQuery.of(context).size.width * 0.04, top: MediaQuery.of(context).size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Performance",
            style: TextStyle(
                color: const Color(0xff0f4a3c),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Today's Plans",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 9,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: _buildCircularPercentIndicatorPerformancePage(context, percentageCompleted, () => currentProgressColor())
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCircularPercentIndicatorPerformancePage(BuildContext context, var percentageCompleted, currentProgressColor()) {
  return CircularPercentIndicator(
    backgroundColor: Colors.blueGrey[600],
    radius: MediaQuery.of(context).size.height * 0.1,
    lineWidth: MediaQuery.of(context).size.height * 0.015,
    animation: true,
    percent: percentageCompleted,
    progressColor: currentProgressColor(),
    // fillColor: color,
    center: Center(
      child: AutoSizeText(
        "${User.todayFinishedPlans.length} / ${User.todayPlans.length}",
        style: new TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[700]),
      ),
    ),
    circularStrokeCap: CircularStrokeCap.butt,
  );
}







class PlanPercentageRepresentationPerformancePage extends StatefulWidget  {
  var topMargin;
  var bottomMargin;
  PlanPercentageRepresentationPerformancePage(this.bottomMargin, this.topMargin);

  @override
  _PlanPercentageRepresentationPerformancePageState createState() => _PlanPercentageRepresentationPerformancePageState();
}
class _PlanPercentageRepresentationPerformancePageState extends State<PlanPercentageRepresentationPerformancePage> {
  @override
  Widget build(BuildContext context) {
    var percentageCompleted = (User.thisWeekPlans.length == 0) ? 0.0 : (User.thisWeekFinishedPlans.length / User.thisWeekPlans.length) * 100;
    currentProgressColor() {
      if (User.thisWeekPlans.length == 0) {
        return Colors.grey[600];
      } else if (percentageCompleted >= 0.0 && percentageCompleted < 25.0) {
        return Colors.red[400];
      } else if (percentageCompleted >= 25.0 && percentageCompleted < 50.0) {
        return Colors.orange;
      } else if (percentageCompleted >= 50.0 && percentageCompleted < 75.0) {
        return Colors.yellow[400];
      } else if (percentageCompleted >= 75.0 && percentageCompleted <= 100.0) {
        return Colors.green[300];
      }
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.02,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.greenAccent[100],
      ),
      margin: EdgeInsets.only(top: widget.topMargin, bottom: widget.bottomMargin),
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.015, right: MediaQuery.of(context).size.width * 0.015, top: MediaQuery.of(context).size.height * 0.015),
      child: Column(
        children: [
          Column(
            children: <Widget>[
              Text(
                "Weekly Effectiveness",
                style: TextStyle(
                    color: const Color(0xff0f4a3c),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: Container(
              //padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.010),

              child: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("" + percentageCompleted.round().toString() + "%", style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.04, fontWeight: FontWeight.bold, color: currentProgressColor()),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



