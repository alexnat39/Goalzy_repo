import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/constants.dart';

class GoalBarChart extends StatefulWidget {
  _GoalBarChartState createState() => _GoalBarChartState();
}

class _GoalBarChartState extends State<GoalBarChart> {


  List<double> monthlyData = new List();

  int touchedIndex;

  currentProgressColor(var x) {
    if (x >= 0.0 && x < 5.0) {
      return [Colors.red[300]];
    } else if (x >= 5.0 && x < 10.0) {
      return [Colors.orange[300]];
    } else if (x >= 10.0 && x < 15.0) {
      return [Colors.yellow[300]];
    } else if (x >= 15.0 && x <= 20.0) {
      return [Colors.green[300]];
    }
  }

  @override
  Widget build(BuildContext context) {

    final _januaryHeight = (MyUser.januaryGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedJanuaryGoals.length / MyUser.januaryGoals.length) * 20);
    final _februaryHeight = (MyUser.februaryGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedFebruaryGoals.length / MyUser.februaryGoals.length) * 20);
    final _marchHeight = (MyUser.marchGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedMarchGoals.length / MyUser.marchGoals.length) * 20);
    final _aprilHeight = (MyUser.aprilGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedAprilGoals.length / MyUser.aprilGoals.length) * 20);
    final _mayHeight = (MyUser.mayGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedMayGoals.length / MyUser.mayGoals.length) * 20);
    final _juneHeight = (MyUser.juneGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedJuneGoals.length / MyUser.juneGoals.length) * 20);
    final _julyHeight = (MyUser.julyGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedJulyGoals.length / MyUser.julyGoals.length) * 20);
    final _augustHeight = (MyUser.augustGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedAugustGoals.length / MyUser.augustGoals.length) * 20);
    final _septemberHeight = (MyUser.septemberGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedSeptemberGoals.length / MyUser.septemberGoals.length) *
        20);
    final _octoberHeight = (MyUser.octoberGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedOctoberGoals.length / MyUser.octoberGoals.length) * 20);
    final _novemberHeight = (MyUser.novemberGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedNovemberGoals.length / MyUser.novemberGoals.length) * 20);
    final _decemberHeight = (MyUser.decemberGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedDecemberGoals.length / MyUser.decemberGoals.length) * 20);

    monthlyData = [
      _januaryHeight,
      _februaryHeight,
      _marchHeight,
      _aprilHeight,
      _mayHeight,
      _juneHeight,
      _julyHeight,
      _augustHeight,
      _septemberHeight,
      _octoberHeight,
      _novemberHeight,
      _decemberHeight,
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        gradient: customGradient10,
      ),
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
          top: MediaQuery.of(context).size.height * 0.015,
          bottom: MediaQuery.of(context).size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Yearly Data',
            style: TextStyle(
                color: const Color(0xff0f4a3c),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Goals",
            style: TextStyle(
                color: const Color(0xff379982),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BarChart(
                mainBarData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _buildBar(
    List<Color> colorList,
    int x,
    double y, {
    bool isTouched = false,
  }) {
    List<Color> touchedColor = new List();
    touchedColor.add(colorList[0].withOpacity(0.7));
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          colors: isTouched ? touchedColor : colorList,
          width: 15,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildAllBars() {
    return List.generate(
      monthlyData.length,
      (index) => _buildBar(
          currentProgressColor(monthlyData[index]), index, monthlyData[index],
          isTouched: index == touchedIndex),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: _buildBarTouchData(),
      titlesData: _buildAxes(),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: _buildAllBars(),
    );
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
      // Build X axis.
      bottomTitles: SideTitles(
        showTitles: true,
        margin: 15,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 0:
              return 'JAN';
            case 1:
              return 'FEB';
            case 2:
              return 'MAR';
            case 3:
              return 'APR';
            case 4:
              return 'MAY';
            case 5:
              return 'JUN';
            case 6:
              return 'JUL';
            case 7:
              return 'AUG';
            case 8:
              return 'SEP';
            case 9:
              return 'OCT';
            case 10:
              return 'NOV';
            case 11:
              return 'DEC';
            default:
              return '';
          }
        },
      ),
      // Build Y axis.
      leftTitles: SideTitles(
        showTitles: false,
        getTitles: (double value) {
          return value.toString();
        },
      ),
    );
  }

  BarTouchData _buildBarTouchData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.blueGrey[700],
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String month;
          String completedTasks;
          switch (group.x.toInt()) {
            case 0:
              month = 'January';
              completedTasks =
                  "Achieved: ${MyUser.finishedJanuaryGoals.length} out of ${MyUser.januaryGoals.length} goal(s)";
              break;
            case 1:
              month = 'February';
              completedTasks =
                  "Achieved: ${MyUser.finishedFebruaryGoals.length} out of ${MyUser.februaryGoals.length} goal(s)";

              break;
            case 2:
              month = 'March';
              completedTasks =
                  "Achieved: ${MyUser.finishedMarchGoals.length} out of ${MyUser.marchGoals.length} goal(s)";

              break;
            case 3:
              month = 'April';
              completedTasks =
                  "Achieved: ${MyUser.finishedAprilGoals.length} out of ${MyUser.aprilGoals.length} goal(s)";

              break;
            case 4:
              month = 'May';
              completedTasks =
                  "Achieved: ${MyUser.finishedMayGoals.length} out of ${MyUser.mayGoals.length} goal(s)";

              break;
            case 5:
              month = 'June';
              completedTasks =
                  "Achieved: ${MyUser.finishedJuneGoals.length} out of ${MyUser.juneGoals.length} goal(s)";

              break;
            case 6:
              month = 'July';
              completedTasks =
                  "Achieved: ${MyUser.finishedJulyGoals.length} out of ${MyUser.julyGoals.length} goal(s)";
              break;
            case 7:
              month = 'August';
              completedTasks =
                  "Achieved: ${MyUser.finishedAugustGoals.length} out of ${MyUser.augustGoals.length} goal(s)";
              break;
            case 8:
              month = 'September';
              completedTasks =
                  "Achieved: ${MyUser.finishedSeptemberGoals.length} out of ${MyUser.septemberGoals.length} goal(s)";
              break;
            case 9:
              month = 'October';
              completedTasks =
                  "Achieved: ${MyUser.finishedOctoberGoals.length} out of ${MyUser.octoberGoals.length} goal(s)";
              break;
            case 10:
              month = 'November';
              completedTasks =
                  "Achieved: ${MyUser.finishedNovemberGoals.length} out of ${MyUser.novemberGoals.length} goal(s)";
              break;
            case 11:
              month = 'December';
              completedTasks =
                  "Achieved: ${MyUser.finishedDecemberGoals.length} out of ${MyUser.decemberGoals.length} goal(s)";
              break;
          }
          return BarTooltipItem(
            month + '\n' + completedTasks,
            TextStyle(color: Colors.grey[300]),
          );
        },
      ),
      touchCallback: (barTouchResponse) {
        setState(() {
          if (barTouchResponse.spot != null &&
              barTouchResponse.touchInput is! FlPanEnd &&
              barTouchResponse.touchInput is! FlLongPressEnd) {
            touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
          } else {
            touchedIndex = -1;
          }
        });
      },
    );
  }
}
