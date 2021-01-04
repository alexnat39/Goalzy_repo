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
    final _januaryHeight = (User.januaryGoals.length == 0)
        ? 0.0
        : ((User.finishedJanuaryGoals.length / User.januaryGoals.length) * 5);
    final _februaryHeight = (User.februaryGoals.length == 0)
        ? 0.0
        : ((User.finishedFebruaryGoals.length / User.februaryGoals.length) * 5);
    final _marchHeight = (User.marchGoals.length == 0)
        ? 0.0
        : ((User.finishedMarchGoals.length / User.marchGoals.length) * 5);
    final _aprilHeight = (User.aprilGoals.length == 0)
        ? 0.0
        : ((User.finishedAprilGoals.length / User.aprilGoals.length) * 5);
    final _mayHeight = (User.mayGoals.length == 0)
        ? 0.0
        : ((User.finishedMayGoals.length / User.mayGoals.length) * 5);
    final _juneHeight = (User.juneGoals.length == 0)
        ? 0.0
        : ((User.finishedJuneGoals.length / User.juneGoals.length) * 5);
    final _julyHeight = (User.julyGoals.length == 0)
        ? 0.0
        : ((User.finishedJulyGoals.length / User.julyGoals.length) * 5);
    final _augustHeight = (User.augustGoals.length == 0)
        ? 0.0
        : ((User.finishedAugustGoals.length / User.augustGoals.length) * 5);
    final _septemberHeight = (User.septemberGoals.length == 0)
        ? 0.0
        : ((User.finishedSeptemberGoals.length / User.septemberGoals.length) *
        5);
    final _octoberHeight = (User.octoberGoals.length == 0)
        ? 0.0
        : ((User.finishedOctoberGoals.length / User.octoberGoals.length) * 5);
    final _novemberHeight = (User.novemberGoals.length == 0)
        ? 0.0
        : ((User.finishedNovemberGoals.length / User.novemberGoals.length) * 5);
    final _decemberHeight = (User.decemberGoals.length == 0)
        ? 0.0
        : ((User.finishedDecemberGoals.length / User.decemberGoals.length) * 5);
    print("January goals: ${User.januaryGoals}");
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
            curveSmoothness: 0.1,
            isCurved: true,
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
      ),
    );
  }
}
