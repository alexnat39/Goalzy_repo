import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'line_chart_titles.dart';
import 'package:date_util/date_util.dart';

class LineChartPlanWidget extends StatelessWidget {
  final _day1Height = (User.day1Plans.length == 0)
      ? 0.0
      : ((User.day1PlansFinished.length / User.day1Plans.length) * 5);
  final _day2Height = (User.day2Plans.length == 0)
      ? 0.0
      : ((User.day2PlansFinished.length / User.day2Plans.length) * 5);
  final _day3Height = (User.day3Plans.length == 0)
      ? 0.0
      : ((User.day3PlansFinished.length / User.day3Plans.length) * 5);
  final _day4Height = (User.day4Plans.length == 0)
      ? 0.0
      : ((User.day4PlansFinished.length / User.day4Plans.length) * 5);
  final _day5Height = (User.day5Plans.length == 0)
      ? 0.0
      : ((User.day5PlansFinished.length / User.day5Plans.length) * 5);
  final _day6Height = (User.day6Plans.length == 0)
      ? 0.0
      : ((User.day6PlansFinished.length / User.day6Plans.length) * 5);
  final _day7Height = (User.day7Plans.length == 0)
      ? 0.0
      : ((User.day7PlansFinished.length / User.day7Plans.length) * 5);
  final _day8Height = (User.day8Plans.length == 0)
      ? 0.0
      : ((User.day8PlansFinished.length / User.day8Plans.length) * 5);
  final _day9Height = (User.day9Plans.length == 0)
      ? 0.0
      : ((User.day9PlansFinished.length / User.day9Plans.length) * 5);
  final _day10Height = (User.day10Plans.length == 0)
      ? 0.0
      : ((User.day10PlansFinished.length / User.day10Plans.length) * 5);
  final _day11Height = (User.day11Plans.length == 0)
      ? 0.0
      : ((User.day11PlansFinished.length / User.day11Plans.length) * 5);
  final _day12Height = (User.day12Plans.length == 0)
      ? 0.0
      : ((User.day12PlansFinished.length / User.day12Plans.length) * 5);
  final _day13Height = (User.day13Plans.length == 0)
      ? 0.0
      : ((User.day13PlansFinished.length / User.day13Plans.length) * 5);
  final _day14Height = (User.day14Plans.length == 0)
      ? 0.0
      : ((User.day14PlansFinished.length / User.day14Plans.length) * 5);
  final _day15Height = (User.day15Plans.length == 0)
      ? 0.0
      : ((User.day15PlansFinished.length / User.day15Plans.length) * 5);
  final _day16Height = (User.day16Plans.length == 0)
      ? 0.0
      : ((User.day16PlansFinished.length / User.day16Plans.length) * 5);
  final _day17Height = (User.day17Plans.length == 0)
      ? 0.0
      : ((User.day17PlansFinished.length / User.day17Plans.length) * 5);
  final _day18Height = (User.day18Plans.length == 0)
      ? 0.0
      : ((User.day18PlansFinished.length / User.day18Plans.length) * 5);
  final _day19Height = (User.day19Plans.length == 0)
      ? 0.0
      : ((User.day19PlansFinished.length / User.day19Plans.length) * 5);
  final _day20Height = (User.day20Plans.length == 0)
      ? 0.0
      : ((User.day20PlansFinished.length / User.day20Plans.length) * 5);
  final _day21Height = (User.day21Plans.length == 0)
      ? 0.0
      : ((User.day21PlansFinished.length / User.day21Plans.length) * 5);
  final _day22Height = (User.day22Plans.length == 0)
      ? 0.0
      : ((User.day22PlansFinished.length / User.day22Plans.length) * 5);
  final _day23Height = (User.day23Plans.length == 0)
      ? 0.0
      : ((User.day23PlansFinished.length / User.day23Plans.length) * 5);
  final _day24Height = (User.day24Plans.length == 0)
      ? 0.0
      : ((User.day24PlansFinished.length / User.day24Plans.length) * 5);
  final _day25Height = (User.day25Plans.length == 0)
      ? 0.0
      : ((User.day25PlansFinished.length / User.day25Plans.length) * 5);
  final _day26Height = (User.day26Plans.length == 0)
      ? 0.0
      : ((User.day26PlansFinished.length / User.day26Plans.length) * 5);
  final _day27Height = (User.day27Plans.length == 0)
      ? 0.0
      : ((User.day27PlansFinished.length / User.day27Plans.length) * 5);
  final _day28Height = (User.day28Plans.length == 0)
      ? 0.0
      : ((User.day28PlansFinished.length / User.day28Plans.length) * 5);
  final _day29Height = (User.day29Plans.length == 0)
      ? 0.0
      : ((User.day29PlansFinished.length / User.day29Plans.length) * 5);
  final _day30Height = (User.day30Plans.length == 0)
      ? 0.0
      : ((User.day30PlansFinished.length / User.day30Plans.length) * 5);
  final _day31Height = (User.day31Plans.length == 0)
      ? 0.0
      : ((User.day31PlansFinished.length / User.day31Plans.length) * 5);

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) => LineChart(
    LineChartData(
      minX: 0,
      maxX: DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year) * 1.0 - 1,
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
    ),
  );

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
      );
    } else if (DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year) == 29) {
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
      );
    }

  }
}


