import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalPercentIndicator extends StatefulWidget  {
  @override
  _GoalPercentIndicatorState createState() => _GoalPercentIndicatorState();
}
class _GoalPercentIndicatorState extends State<GoalPercentIndicator> {

  @override
  Widget build(BuildContext context) {
    var percentageCompleted = (User.thisMonthGoals.length == 0) ? 0.0 : User.thisMonthFinishedGoals.length / User.thisMonthGoals.length;
    currentProgressColor() {
      if (percentageCompleted * 100 >= 0.0 && percentageCompleted * 100 < 25.0) {
        return Colors.red[400];
      } else if (percentageCompleted * 100 >= 25.0 && percentageCompleted * 100 < 50.0) {
        return Colors.orange;
      } else if (percentageCompleted * 100 >= 50.0 && percentageCompleted * 100 < 75.0) {
        return Colors.yellow[400];
      } else if (percentageCompleted * 100 >= 75.0 && percentageCompleted * 100 <= 100.0) {
        return Colors.green[300];
      }
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color:  Colors.pink[100],
      ),
      // margin: EdgeInsets.all(10.0),
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04, right: MediaQuery.of(context).size.width * 0.04, top: MediaQuery.of(context).size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AutoSizeText(
            "Monthly Data",
            style: TextStyle(
                color: const Color(0xff0f4a3c),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          AutoSizeText(
            "Goals",
            style: TextStyle(
                color: const Color(0xff0f4a3c),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),

          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _buildCircularPercentIndicator(context, percentageCompleted, () => currentProgressColor())
            ),
          ),
        ],
      ),
    );
  }
}



Widget _buildCircularPercentIndicator(BuildContext context, var percentageCompleted, currentProgressColor()) {
  return CircularPercentIndicator(
    backgroundColor: Colors.blueGrey[600],
    radius: MediaQuery.of(context).size.width * 0.31,
    lineWidth: MediaQuery.of(context).size.width * 0.06,
    animation: true,
    percent: percentageCompleted,
    progressColor: currentProgressColor(),
    // fillColor: color,
    center: Center(
      child: AutoSizeText(
        "${User.thisMonthFinishedGoals.length} / ${User.thisMonthGoals.length}",
        style: new TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[700]),
      ),
    ),
    circularStrokeCap: CircularStrokeCap.butt,
  );
}