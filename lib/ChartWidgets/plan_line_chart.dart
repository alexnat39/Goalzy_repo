import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'line_chart_titles.dart';
import 'package:date_util/date_util.dart';

class LineChartPlanWidget extends StatelessWidget {
  var _day1Height = (User.day1Plans.length == 0)
      ? 0.0
      : ((User.day1PlansFinished.length / User.day1Plans.length) * 5);
  var _day2Height = (User.day2Plans.length == 0)
      ? 0.0
      : ((User.day2PlansFinished.length / User.day2Plans.length) * 5);
  var _day3Height = (User.day3Plans.length == 0)
      ? 0.0
      : ((User.day3PlansFinished.length / User.day3Plans.length) * 5);
  var _day4Height = (User.day4Plans.length == 0)
      ? 0.0
      : ((User.day4PlansFinished.length / User.day4Plans.length) * 5);
  var _day5Height = (User.day5Plans.length == 0)
      ? 0.0
      : ((User.day5PlansFinished.length / User.day5Plans.length) * 5);
  var _day6Height = (User.day6Plans.length == 0)
      ? 0.0
      : ((User.day6PlansFinished.length / User.day6Plans.length) * 5);
  var _day7Height = (User.day7Plans.length == 0)
      ? 0.0
      : ((User.day7PlansFinished.length / User.day7Plans.length) * 5);
  var _day8Height = (User.day8Plans.length == 0)
      ? 0.0
      : ((User.day8PlansFinished.length / User.day8Plans.length) * 5);
  var _day9Height = (User.day9Plans.length == 0)
      ? 0.0
      : ((User.day9PlansFinished.length / User.day9Plans.length) * 5);
  var _day10Height = (User.day10Plans.length == 0)
      ? 0.0
      : ((User.day10PlansFinished.length / User.day10Plans.length) * 5);
  var _day11Height = (User.day11Plans.length == 0)
      ? 0.0
      : ((User.day11PlansFinished.length / User.day11Plans.length) * 5);
  var _day12Height = (User.day12Plans.length == 0)
      ? 0.0
      : ((User.day12PlansFinished.length / User.day12Plans.length) * 5);
  var _day13Height = (User.day13Plans.length == 0)
      ? 0.0
      : ((User.day13PlansFinished.length / User.day13Plans.length) * 5);
  var _day14Height = (User.day14Plans.length == 0)
      ? 0.0
      : ((User.day14PlansFinished.length / User.day14Plans.length) * 5);
  var _day15Height = (User.day15Plans.length == 0)
      ? 0.0
      : ((User.day15PlansFinished.length / User.day15Plans.length) * 5);
  var _day16Height = (User.day16Plans.length == 0)
      ? 0.0
      : ((User.day16PlansFinished.length / User.day16Plans.length) * 5);
  var _day17Height = (User.day17Plans.length == 0)
      ? 0.0
      : ((User.day17PlansFinished.length / User.day17Plans.length) * 5);
  var _day18Height = (User.day18Plans.length == 0)
      ? 0.0
      : ((User.day18PlansFinished.length / User.day18Plans.length) * 5);
  var _day19Height = (User.day19Plans.length == 0)
      ? 0.0
      : ((User.day19PlansFinished.length / User.day19Plans.length) * 5);
  var _day20Height = (User.day20Plans.length == 0)
      ? 0.0
      : ((User.day20PlansFinished.length / User.day20Plans.length) * 5);
  var _day21Height = (User.day21Plans.length == 0)
      ? 0.0
      : ((User.day21PlansFinished.length / User.day21Plans.length) * 5);
  var _day22Height = (User.day22Plans.length == 0)
      ? 0.0
      : ((User.day22PlansFinished.length / User.day22Plans.length) * 5);
  var _day23Height = (User.day23Plans.length == 0)
      ? 0.0
      : ((User.day23PlansFinished.length / User.day23Plans.length) * 5);
  var _day24Height = (User.day24Plans.length == 0)
      ? 0.0
      : ((User.day24PlansFinished.length / User.day24Plans.length) * 5);
  var _day25Height = (User.day25Plans.length == 0)
      ? 0.0
      : ((User.day25PlansFinished.length / User.day25Plans.length) * 5);
  var _day26Height = (User.day26Plans.length == 0)
      ? 0.0
      : ((User.day26PlansFinished.length / User.day26Plans.length) * 5);
  var _day27Height = (User.day27Plans.length == 0)
      ? 0.0
      : ((User.day27PlansFinished.length / User.day27Plans.length) * 5);
  var _day28Height = (User.day28Plans.length == 0)
      ? 0.0
      : ((User.day28PlansFinished.length / User.day28Plans.length) * 5);
  var _day29Height = (User.day29Plans.length == 0)
      ? 0.0
      : ((User.day29PlansFinished.length / User.day29Plans.length) * 5);
  var _day30Height = (User.day30Plans.length == 0)
      ? 0.0
      : ((User.day30PlansFinished.length / User.day30Plans.length) * 5);
  var _day31Height = (User.day31Plans.length == 0)
      ? 0.0
      : ((User.day31PlansFinished.length / User.day31Plans.length) * 5);



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


