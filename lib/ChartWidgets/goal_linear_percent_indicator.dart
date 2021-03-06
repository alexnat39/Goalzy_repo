import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoalLinearPercentIndicator extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var percentageCompleted = (MyUser.thisMonthGoals.length == 0) ? 0.0 : MyUser.thisMonthFinishedGoals.length / MyUser.thisMonthGoals.length;
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

    return LinearPercentIndicator(
      animation: true,
      lineHeight: MediaQuery.of(context).size.height * 0.03,
      animationDuration: 500,
      percent: (MyUser.thisMonthGoals.length == 0) ? 0.0 : MyUser.thisMonthFinishedGoals.length/MyUser.thisMonthGoals.length,
      center: Text("${MyUser.thisMonthFinishedGoals.length}/${MyUser.thisMonthGoals.length}"),
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: currentProgressColor(),
    );
  }

}