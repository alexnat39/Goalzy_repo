import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'line_chart_titles.dart';
import 'package:date_util/date_util.dart';

class LineChartPlanWidget extends StatelessWidget {
  var _day1Height = (MyUser.day1Plans.length == 0)
      ? 0.0
      : ((MyUser.day1PlansFinished.length / MyUser.day1Plans.length) * 5);
  var _day2Height = (MyUser.day2Plans.length == 0)
      ? 0.0
      : ((MyUser.day2PlansFinished.length / MyUser.day2Plans.length) * 5);
  var _day3Height = (MyUser.day3Plans.length == 0)
      ? 0.0
      : ((MyUser.day3PlansFinished.length / MyUser.day3Plans.length) * 5);
  var _day4Height = (MyUser.day4Plans.length == 0)
      ? 0.0
      : ((MyUser.day4PlansFinished.length / MyUser.day4Plans.length) * 5);
  var _day5Height = (MyUser.day5Plans.length == 0)
      ? 0.0
      : ((MyUser.day5PlansFinished.length / MyUser.day5Plans.length) * 5);
  var _day6Height = (MyUser.day6Plans.length == 0)
      ? 0.0
      : ((MyUser.day6PlansFinished.length / MyUser.day6Plans.length) * 5);
  var _day7Height = (MyUser.day7Plans.length == 0)
      ? 0.0
      : ((MyUser.day7PlansFinished.length / MyUser.day7Plans.length) * 5);
  var _day8Height = (MyUser.day8Plans.length == 0)
      ? 0.0
      : ((MyUser.day8PlansFinished.length / MyUser.day8Plans.length) * 5);
  var _day9Height = (MyUser.day9Plans.length == 0)
      ? 0.0
      : ((MyUser.day9PlansFinished.length / MyUser.day9Plans.length) * 5);
  var _day10Height = (MyUser.day10Plans.length == 0)
      ? 0.0
      : ((MyUser.day10PlansFinished.length / MyUser.day10Plans.length) * 5);
  var _day11Height = (MyUser.day11Plans.length == 0)
      ? 0.0
      : ((MyUser.day11PlansFinished.length / MyUser.day11Plans.length) * 5);
  var _day12Height = (MyUser.day12Plans.length == 0)
      ? 0.0
      : ((MyUser.day12PlansFinished.length / MyUser.day12Plans.length) * 5);
  var _day13Height = (MyUser.day13Plans.length == 0)
      ? 0.0
      : ((MyUser.day13PlansFinished.length / MyUser.day13Plans.length) * 5);
  var _day14Height = (MyUser.day14Plans.length == 0)
      ? 0.0
      : ((MyUser.day14PlansFinished.length / MyUser.day14Plans.length) * 5);
  var _day15Height = (MyUser.day15Plans.length == 0)
      ? 0.0
      : ((MyUser.day15PlansFinished.length / MyUser.day15Plans.length) * 5);
  var _day16Height = (MyUser.day16Plans.length == 0)
      ? 0.0
      : ((MyUser.day16PlansFinished.length / MyUser.day16Plans.length) * 5);
  var _day17Height = (MyUser.day17Plans.length == 0)
      ? 0.0
      : ((MyUser.day17PlansFinished.length / MyUser.day17Plans.length) * 5);
  var _day18Height = (MyUser.day18Plans.length == 0)
      ? 0.0
      : ((MyUser.day18PlansFinished.length / MyUser.day18Plans.length) * 5);
  var _day19Height = (MyUser.day19Plans.length == 0)
      ? 0.0
      : ((MyUser.day19PlansFinished.length / MyUser.day19Plans.length) * 5);
  var _day20Height = (MyUser.day20Plans.length == 0)
      ? 0.0
      : ((MyUser.day20PlansFinished.length / MyUser.day20Plans.length) * 5);
  var _day21Height = (MyUser.day21Plans.length == 0)
      ? 0.0
      : ((MyUser.day21PlansFinished.length / MyUser.day21Plans.length) * 5);
  var _day22Height = (MyUser.day22Plans.length == 0)
      ? 0.0
      : ((MyUser.day22PlansFinished.length / MyUser.day22Plans.length) * 5);
  var _day23Height = (MyUser.day23Plans.length == 0)
      ? 0.0
      : ((MyUser.day23PlansFinished.length / MyUser.day23Plans.length) * 5);
  var _day24Height = (MyUser.day24Plans.length == 0)
      ? 0.0
      : ((MyUser.day24PlansFinished.length / MyUser.day24Plans.length) * 5);
  var _day25Height = (MyUser.day25Plans.length == 0)
      ? 0.0
      : ((MyUser.day25PlansFinished.length / MyUser.day25Plans.length) * 5);
  var _day26Height = (MyUser.day26Plans.length == 0)
      ? 0.0
      : ((MyUser.day26PlansFinished.length / MyUser.day26Plans.length) * 5);
  var _day27Height = (MyUser.day27Plans.length == 0)
      ? 0.0
      : ((MyUser.day27PlansFinished.length / MyUser.day27Plans.length) * 5);
  var _day28Height = (MyUser.day28Plans.length == 0)
      ? 0.0
      : ((MyUser.day28PlansFinished.length / MyUser.day28Plans.length) * 5);
  var _day29Height = (MyUser.day29Plans.length == 0)
      ? 0.0
      : ((MyUser.day29PlansFinished.length / MyUser.day29Plans.length) * 5);
  var _day30Height = (MyUser.day30Plans.length == 0)
      ? 0.0
      : ((MyUser.day30PlansFinished.length / MyUser.day30Plans.length) * 5);
  var _day31Height = (MyUser.day31Plans.length == 0)
      ? 0.0
      : ((MyUser.day31PlansFinished.length / MyUser.day31Plans.length) * 5);



  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    _day1Height = num.parse(_day1Height.toStringAsFixed(1));
    _day2Height = num.parse(_day2Height.toStringAsFixed(1));
    _day3Height = num.parse(_day3Height.toStringAsFixed(1));
    _day4Height = num.parse(_day4Height.toStringAsFixed(1));
    _day5Height = num.parse(_day5Height.toStringAsFixed(1));
    _day6Height = num.parse(_day6Height.toStringAsFixed(1));
    _day7Height = num.parse(_day7Height.toStringAsFixed(1));
    _day8Height = num.parse(_day8Height.toStringAsFixed(1));
    _day9Height = num.parse(_day9Height.toStringAsFixed(1));
    _day10Height = num.parse(_day10Height.toStringAsFixed(1));
    _day11Height = num.parse(_day11Height.toStringAsFixed(1));
    _day12Height = num.parse(_day12Height.toStringAsFixed(1));
    _day13Height = num.parse(_day13Height.toStringAsFixed(1));
    _day14Height = num.parse(_day14Height.toStringAsFixed(1));
    _day15Height = num.parse(_day15Height.toStringAsFixed(1));
    _day16Height = num.parse(_day16Height.toStringAsFixed(1));
    _day17Height = num.parse(_day17Height.toStringAsFixed(1));
    _day18Height = num.parse(_day18Height.toStringAsFixed(1));
    _day19Height = num.parse(_day19Height.toStringAsFixed(1));
    _day20Height = num.parse(_day20Height.toStringAsFixed(1));
    _day21Height = num.parse(_day21Height.toStringAsFixed(1));
    _day22Height = num.parse(_day22Height.toStringAsFixed(1));
    _day23Height = num.parse(_day23Height.toStringAsFixed(1));
    _day24Height = num.parse(_day24Height.toStringAsFixed(1));
    _day25Height = num.parse(_day25Height.toStringAsFixed(1));
    _day26Height = num.parse(_day26Height.toStringAsFixed(1));
    _day27Height = num.parse(_day27Height.toStringAsFixed(1));
    _day28Height = num.parse(_day28Height.toStringAsFixed(1));
    _day29Height = num.parse(_day29Height.toStringAsFixed(1));
    _day30Height = num.parse(_day30Height.toStringAsFixed(1));
    _day31Height = num.parse(_day31Height.toStringAsFixed(1));


    return LineChart(
      LineChartData(
          minX: 0,
          maxX: DateUtil().daysInMonth(DateTime
              .now()
              .month, DateTime
              .now()
              .year) * 1.0 - 1,
          minY: 0,
          maxY: 5,
          titlesData: LinePlanTitles.getTitleData(),
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
            lineChartBarData31(),
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

  LineChartBarData lineChartBarData31() {
    if (DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year) == 28) {
      return  LineChartBarData(
        spots: [
          FlSpot(0, _day1Height),
          FlSpot(1, _day2Height),
          FlSpot(2, _day3Height),
          FlSpot(3, _day4Height),
          FlSpot(4, _day5Height),
          FlSpot(5, _day6Height),
          FlSpot(6, _day7Height),
          FlSpot(7, _day8Height),
          FlSpot(8, _day9Height),
          FlSpot(9, _day10Height),
          FlSpot(10, _day11Height),
          FlSpot(11, _day12Height),
          FlSpot(12, _day13Height),
          FlSpot(13, _day14Height),
          FlSpot(14, _day15Height),
          FlSpot(15, _day16Height),
          FlSpot(16, _day17Height),
          FlSpot(17, _day18Height),
          FlSpot(18, _day19Height),
          FlSpot(19, _day20Height),
          FlSpot(20, _day21Height),
          FlSpot(21, _day22Height),
          FlSpot(22, _day23Height),
          FlSpot(23, _day24Height),
          FlSpot(24, _day25Height),
          FlSpot(25, _day26Height),
          FlSpot(26, _day27Height),
          FlSpot(27, _day28Height),
        ],
        colors: gradientColors,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors
              .map((color) => color.withOpacity(0.3))
              .toList(),
        ),
      );
    } else if (DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year) == 29) {
      return  LineChartBarData(
        spots: [
          FlSpot(0, _day1Height),
          FlSpot(1, _day2Height),
          FlSpot(2, _day3Height),
          FlSpot(3, _day4Height),
          FlSpot(4, num.parse(_day5Height.toStringAsFixed(2))),
          FlSpot(5, _day6Height),
          FlSpot(6, _day7Height),
          FlSpot(7, _day8Height),
          FlSpot(8, _day9Height),
          FlSpot(9, _day10Height),
          FlSpot(10, _day11Height),
          FlSpot(11, _day12Height),
          FlSpot(12, _day13Height),
          FlSpot(13, _day14Height),
          FlSpot(14, _day15Height),
          FlSpot(15, _day16Height),
          FlSpot(16, _day17Height),
          FlSpot(17, _day18Height),
          FlSpot(18, _day19Height),
          FlSpot(19, _day20Height),
          FlSpot(20, _day21Height),
          FlSpot(21, _day22Height),
          FlSpot(22, _day23Height),
          FlSpot(23, _day24Height),
          FlSpot(24, _day25Height),
          FlSpot(25, _day26Height),
          FlSpot(26, _day27Height),
          FlSpot(27, _day28Height),
          FlSpot(28, _day29Height),
        ],
        colors: gradientColors,
        barWidth: 3,
        // dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors
              .map((color) => color.withOpacity(0.3))
              .toList(),
        ),
      );
    } else if (DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year) == 30) {
      return  LineChartBarData(
        spots: [
          FlSpot(0, _day1Height),
          FlSpot(1, _day2Height),
          FlSpot(2, _day3Height),
          FlSpot(3, _day4Height),
          FlSpot(4, _day5Height),
          FlSpot(5, _day6Height),
          FlSpot(6, _day7Height),
          FlSpot(7, _day8Height),
          FlSpot(8, _day9Height),
          FlSpot(9, _day10Height),
          FlSpot(10, _day11Height),
          FlSpot(11, _day12Height),
          FlSpot(12, _day13Height),
          FlSpot(13, _day14Height),
          FlSpot(14, _day15Height),
          FlSpot(15, _day16Height),
          FlSpot(16, _day17Height),
          FlSpot(17, _day18Height),
          FlSpot(18, _day19Height),
          FlSpot(19, _day20Height),
          FlSpot(20, _day21Height),
          FlSpot(21, _day22Height),
          FlSpot(22, _day23Height),
          FlSpot(23, _day24Height),
          FlSpot(24, _day25Height),
          FlSpot(25, _day26Height),
          FlSpot(26, _day27Height),
          FlSpot(27, _day28Height),
          FlSpot(28, _day29Height),
          FlSpot(29, _day30Height),
        ],
        colors: gradientColors,
        barWidth: 3,
        // dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors
              .map((color) => color.withOpacity(0.3))
              .toList(),
        ),
      );
    } else {
      return  LineChartBarData(
        spots: [
          FlSpot(0, _day1Height),
          FlSpot(1, _day2Height),
          FlSpot(2, _day3Height),
          FlSpot(3, _day4Height),
          FlSpot(4, _day5Height),
          FlSpot(5, _day6Height),
          FlSpot(6, _day7Height),
          FlSpot(7, _day8Height),
          FlSpot(8, _day9Height),
          FlSpot(9, _day10Height),
          FlSpot(10, _day11Height),
          FlSpot(11, _day12Height),
          FlSpot(12, _day13Height),
          FlSpot(13, _day14Height),
          FlSpot(14, _day15Height),
          FlSpot(15, _day16Height),
          FlSpot(16, _day17Height),
          FlSpot(17, _day18Height),
          FlSpot(18, _day19Height),
          FlSpot(19, _day20Height),
          FlSpot(20, _day21Height),
          FlSpot(21, _day22Height),
          FlSpot(22, _day23Height),
          FlSpot(23, _day24Height),
          FlSpot(24, _day25Height),
          FlSpot(25, _day26Height),
          FlSpot(26, _day27Height),
          FlSpot(27, _day28Height),
          FlSpot(28, _day29Height),
          FlSpot(29, _day30Height),
          FlSpot(30, _day31Height),
        ],

        colors: gradientColors,
        barWidth: 3,
        // dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors
              .map((color) => color.withOpacity(0.3))
              .toList(),
        ),
      );
    }

  }
}


