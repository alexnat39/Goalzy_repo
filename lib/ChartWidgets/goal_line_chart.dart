import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'line_chart_titles.dart';

class LineChartGoalWidget extends StatelessWidget {


  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    var _januaryHeight = (MyUser.januaryGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedJanuaryGoals.length / MyUser.januaryGoals.length) * 5);
    var _februaryHeight = (MyUser.februaryGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedFebruaryGoals.length / MyUser.februaryGoals.length) * 5);
    var _marchHeight = (MyUser.marchGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedMarchGoals.length / MyUser.marchGoals.length) * 5);
    var _aprilHeight = (MyUser.aprilGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedAprilGoals.length / MyUser.aprilGoals.length) * 5);
    var _mayHeight = (MyUser.mayGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedMayGoals.length / MyUser.mayGoals.length) * 5);
    var _juneHeight = (MyUser.juneGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedJuneGoals.length / MyUser.juneGoals.length) * 5);
    var _julyHeight = (MyUser.julyGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedJulyGoals.length / MyUser.julyGoals.length) * 5);
    var _augustHeight = (MyUser.augustGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedAugustGoals.length / MyUser.augustGoals.length) * 5);
    var _septemberHeight = (MyUser.septemberGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedSeptemberGoals.length / MyUser.septemberGoals.length) *
        5);
    var _octoberHeight = (MyUser.octoberGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedOctoberGoals.length / MyUser.octoberGoals.length) * 5);
    var _novemberHeight = (MyUser.novemberGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedNovemberGoals.length / MyUser.novemberGoals.length) * 5);
    var _decemberHeight = (MyUser.decemberGoals.length == 0)
        ? 0.0
        : ((MyUser.finishedDecemberGoals.length / MyUser.decemberGoals.length) * 5);

    _januaryHeight = num.parse(_januaryHeight.toStringAsFixed(1));
    _februaryHeight = num.parse(_februaryHeight.toStringAsFixed(1));
    _marchHeight = num.parse(_marchHeight.toStringAsFixed(1));
    _aprilHeight = num.parse(_aprilHeight.toStringAsFixed(1));
    _mayHeight = num.parse(_mayHeight.toStringAsFixed(1));
    _juneHeight = num.parse(_juneHeight.toStringAsFixed(1));
    _julyHeight = num.parse(_julyHeight.toStringAsFixed(1));
    _augustHeight = num.parse(_augustHeight.toStringAsFixed(1));
    _septemberHeight = num.parse(_septemberHeight.toStringAsFixed(1));
    _octoberHeight = num.parse(_octoberHeight.toStringAsFixed(1));
    _novemberHeight = num.parse(_novemberHeight.toStringAsFixed(1));
    _decemberHeight = num.parse(_decemberHeight.toStringAsFixed(1));

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 5,
        titlesData: LineGoalTitles.getTitleData(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, _januaryHeight),
              FlSpot(1, _februaryHeight),
              FlSpot(2, _marchHeight),
              FlSpot(3, _aprilHeight),
              FlSpot(4, _mayHeight),
              FlSpot(5, _juneHeight),
              FlSpot(6, _julyHeight),
              FlSpot(7, _augustHeight),
              FlSpot(8, _septemberHeight),
              FlSpot(9, _octoberHeight),
              FlSpot(10, _novemberHeight),
              FlSpot(11, _decemberHeight),
            ],
            colors: gradientColors,
            barWidth: 5,
            // dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
            maxContentWidth: 25,
          ),
        ),
      ),
    );
  }
}
