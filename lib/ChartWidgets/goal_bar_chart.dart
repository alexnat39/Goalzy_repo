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

    final _januaryHeight = (User.januaryGoals.length == 0)
        ? 0.0
        : ((User.finishedJanuaryGoals.length / User.januaryGoals.length) * 20);
    final _februaryHeight = (User.februaryGoals.length == 0)
        ? 0.0
        : ((User.finishedFebruaryGoals.length / User.februaryGoals.length) * 20);
    final _marchHeight = (User.marchGoals.length == 0)
        ? 0.0
        : ((User.finishedMarchGoals.length / User.marchGoals.length) * 20);
    final _aprilHeight = (User.aprilGoals.length == 0)
        ? 0.0
        : ((User.finishedAprilGoals.length / User.aprilGoals.length) * 20);
    final _mayHeight = (User.mayGoals.length == 0)
        ? 0.0
        : ((User.finishedMayGoals.length / User.mayGoals.length) * 20);
    final _juneHeight = (User.juneGoals.length == 0)
        ? 0.0
        : ((User.finishedJuneGoals.length / User.juneGoals.length) * 20);
    final _julyHeight = (User.julyGoals.length == 0)
        ? 0.0
        : ((User.finishedJulyGoals.length / User.julyGoals.length) * 20);
    final _augustHeight = (User.augustGoals.length == 0)
        ? 0.0
        : ((User.finishedAugustGoals.length / User.augustGoals.length) * 20);
    final _septemberHeight = (User.septemberGoals.length == 0)
        ? 0.0
        : ((User.finishedSeptemberGoals.length / User.septemberGoals.length) *
        20);
    final _octoberHeight = (User.octoberGoals.length == 0)
        ? 0.0
        : ((User.finishedOctoberGoals.length / User.octoberGoals.length) * 20);
    final _novemberHeight = (User.novemberGoals.length == 0)
        ? 0.0
        : ((User.finishedNovemberGoals.length / User.novemberGoals.length) * 20);
    final _decemberHeight = (User.decemberGoals.length == 0)
        ? 0.0
        : ((User.finishedDecemberGoals.length / User.decemberGoals.length) * 20);

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
        gradient: goalBarChartGradient,
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
                  "Achieved: ${User.finishedJanuaryGoals.length} out of ${User.januaryGoals.length} goal(s)";
              break;
            case 1:
              month = 'February';
              completedTasks =
                  "Achieved: ${User.finishedFebruaryGoals.length} out of ${User.februaryGoals.length} goal(s)";

              break;
            case 2:
              month = 'March';
              completedTasks =
                  "Achieved: ${User.finishedMarchGoals.length} out of ${User.marchGoals.length} goal(s)";

              break;
            case 3:
              month = 'April';
              completedTasks =
                  "Achieved: ${User.finishedAprilGoals.length} out of ${User.aprilGoals.length} goal(s)";

              break;
            case 4:
              month = 'May';
              completedTasks =
                  "Achieved: ${User.finishedMayGoals.length} out of ${User.mayGoals.length} goal(s)";

              break;
            case 5:
              month = 'June';
              completedTasks =
                  "Achieved: ${User.finishedJuneGoals.length} out of ${User.juneGoals.length} goal(s)";

              break;
            case 6:
              month = 'July';
              completedTasks =
                  "Achieved: ${User.finishedJulyGoals.length} out of ${User.julyGoals.length} goal(s)";
              break;
            case 7:
              month = 'August';
              completedTasks =
                  "Achieved: ${User.finishedAugustGoals.length} out of ${User.augustGoals.length} goal(s)";
              break;
            case 8:
              month = 'September';
              completedTasks =
                  "Achieved: ${User.finishedSeptemberGoals.length} out of ${User.septemberGoals.length} goal(s)";
              break;
            case 9:
              month = 'October';
              completedTasks =
                  "Achieved: ${User.finishedOctoberGoals.length} out of ${User.octoberGoals.length} goal(s)";
              break;
            case 10:
              month = 'November';
              completedTasks =
                  "Achieved: ${User.finishedNovemberGoals.length} out of ${User.novemberGoals.length} goal(s)";
              break;
            case 11:
              month = 'December';
              completedTasks =
                  "Achieved: ${User.finishedDecemberGoals.length} out of ${User.decemberGoals.length} goal(s)";
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
