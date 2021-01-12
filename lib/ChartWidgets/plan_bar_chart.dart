import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/constants.dart';
import 'package:tinycolor/tinycolor.dart';


class PlanBarChartHomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PlanBarChartHomeWidgetState();
}

class PlanBarChartHomeWidgetState extends State<PlanBarChartHomeWidget> {
  int touchedIndex;
  List<double> weeklyData = new List();
  currentProgressColor(var x) {
    if (x >= 0.0 && x < 5.0) {
      return [Colors.red[400]];
    } else if (x >= 5.0 && x < 10.0) {
      return [Colors.orange[400]];
    } else if (x >= 10.0 && x < 15.0) {
      return [Colors.yellow[400]];
    } else if (x >= 15.0 && x <= 20.0) {
      return [Colors.green[300]];
    } else {
      return Colors.pinkAccent;
    }
  }


  @override
  Widget build(BuildContext context) {
    final _mondayHeight = (MyUser.mondayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedMondayPlans.length / MyUser.mondayPlans.length) * 20);
    final _tuesdayHeight = (MyUser.tuesdayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedTuesdayPlans.length / MyUser.tuesdayPlans.length) * 20);
    final _wednesdayHeight = (MyUser.wednesdayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedWednesdayPlans.length / MyUser.wednesdayPlans.length) *
        20);
    final _thursdayHeight = (MyUser.thursdayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedThursdayPlans.length / MyUser.thursdayPlans.length) * 20);
    final _fridayHeight = (MyUser.fridayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedFridayPlans.length / MyUser.fridayPlans.length) * 20);
    final _saturdayHeight = (MyUser.saturdayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedSaturdayPlans.length / MyUser.saturdayPlans.length) * 20);
    final _sundayHeight = (MyUser.sundayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedSundayPlans.length / MyUser.sundayPlans.length) * 20);




    weeklyData = [
      _mondayHeight,
      _tuesdayHeight,
      _wednesdayHeight,
      _thursdayHeight,
      _fridayHeight,
      _saturdayHeight,
      _sundayHeight
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        gradient: planBarChartGradient,
      ),
      margin: EdgeInsets.all(10.0),
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
            'Weekly Data',
            style: TextStyle(
                color: const Color(0xff0f4a3c),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Plans',
            style: TextStyle(
                color: const Color(0xff379982),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
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
          width: 22,
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
      weeklyData.length,
      (index) =>
          _buildBar(currentProgressColor(weeklyData[index]) ,index, weeklyData[index], isTouched: index == touchedIndex),
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
        // textStyle: TextStyle(
        //   color: Colors.white,
        //   fontWeight: FontWeight.bold,
        //   fontSize: 14,
        // ),
        margin: 16,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 0:
              return 'M';
            case 1:
              return 'T';
            case 2:
              return 'W';
            case 3:
              return 'T';
            case 4:
              return 'F';
            case 5:
              return 'S';
            case 6:
              return 'S';
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
          String weekDay;
          String completedTasks;
          switch (group.x.toInt()) {
            case 0:
              weekDay = 'Monday';
              completedTasks =
                  "Completed: ${MyUser.finishedMondayPlans.length} out of ${MyUser.mondayPlans.length} plan(s)";
              break;
            case 1:
              weekDay = 'Tuesday';
              completedTasks =
                  "Completed: ${MyUser.finishedTuesdayPlans.length} out of ${MyUser.tuesdayPlans.length} plan(s)";

              break;
            case 2:
              weekDay = 'Wednesday';
              completedTasks =
                  "Completed: ${MyUser.finishedWednesdayPlans.length} out of ${MyUser.wednesdayPlans.length} plan(s)";

              break;
            case 3:
              weekDay = 'Thursday';
              completedTasks =
                  "Completed: ${MyUser.finishedThursdayPlans.length} out of ${MyUser.thursdayPlans.length} plan(s)";

              break;
            case 4:
              weekDay = 'Friday';
              completedTasks =
                  "Completed: ${MyUser.finishedFridayPlans.length} out of ${MyUser.fridayPlans.length} plan(s)";

              break;
            case 5:
              weekDay = 'Saturday';
              completedTasks =
                  "Completed: ${MyUser.finishedSaturdayPlans.length} out of ${MyUser.saturdayPlans.length} plan(s)";

              break;
            case 6:
              weekDay = 'Sunday';
              completedTasks =
                  "Completed: ${MyUser.finishedSundayPlans.length} out of ${MyUser.sundayPlans.length} plan(s)";

              break;
          }
          return BarTooltipItem(
            weekDay + '\n' + completedTasks,
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

















class PlanBarChartPerformanceWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PlanBarChartPerformanceWidgetState();
}

class PlanBarChartPerformanceWidgetState extends State<PlanBarChartPerformanceWidget> {


  List<double> weeklyData = new List();

  int touchedIndex;

  currentProgressColor(var x) {
    if (x >= 0.0 && x < 5.0) {
      return [Colors.red[400]];
    } else if (x >= 5.0 && x < 10.0) {
      return [Colors.orange[400]];
    } else if (x >= 10.0 && x < 15.0) {
      return [Colors.yellow[400]];
    } else if (x >= 15.0 && x <= 20.0) {
      return [Colors.green[300]];
    }
  }

  @override
  Widget build(BuildContext context) {
    final _mondayHeight = (MyUser.mondayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedMondayPlans.length / MyUser.mondayPlans.length) * 20);
    final _tuesdayHeight = (MyUser.tuesdayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedTuesdayPlans.length / MyUser.tuesdayPlans.length) * 20);
    final _wednesdayHeight = (MyUser.wednesdayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedWednesdayPlans.length / MyUser.wednesdayPlans.length) *
        20);
    final _thursdayHeight = (MyUser.thursdayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedThursdayPlans.length / MyUser.thursdayPlans.length) * 20);
    final _fridayHeight = (MyUser.fridayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedFridayPlans.length / MyUser.fridayPlans.length) * 20);
    final _saturdayHeight = (MyUser.saturdayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedSaturdayPlans.length / MyUser.saturdayPlans.length) * 20);
    final _sundayHeight = (MyUser.sundayPlans.length == 0)
        ? 0.0
        : ((MyUser.finishedSundayPlans.length / MyUser.sundayPlans.length) * 20);
    weeklyData = [
      _mondayHeight,
      _tuesdayHeight,
      _wednesdayHeight,
      _thursdayHeight,
      _fridayHeight,
      _saturdayHeight,
      _sundayHeight
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
         gradient: customGradient9,

      ),
       margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03,
          top: MediaQuery.of(context).size.height * 0.01,
          bottom: MediaQuery.of(context).size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Weekly Data',
            style: TextStyle(
                color: const Color(0xff0f4a3c),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Plans',
            style: TextStyle(
                color: const Color(0xff379982),
                fontSize: 14,
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
      weeklyData.length,
          (index) =>
          _buildBar(currentProgressColor(weeklyData[index]),index, weeklyData[index], isTouched: index == touchedIndex),
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

        margin: 16,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 0:
              return 'M';
            case 1:
              return 'T';
            case 2:
              return 'W';
            case 3:
              return 'T';
            case 4:
              return 'F';
            case 5:
              return 'S';
            case 6:
              return 'S';
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
          String weekDay;
          String completedTasks;
          switch (group.x.toInt()) {
            case 0:
              weekDay = 'Monday';
              completedTasks =
              "Completed: ${MyUser.finishedMondayPlans.length} out of ${MyUser.mondayPlans.length} plan(s)";
              break;
            case 1:
              weekDay = 'Tuesday';
              completedTasks =
              "Completed: ${MyUser.finishedTuesdayPlans.length} out of ${MyUser.tuesdayPlans.length} plan(s)";

              break;
            case 2:
              weekDay = 'Wednesday';
              completedTasks =
              "Completed: ${MyUser.finishedWednesdayPlans.length} out of ${MyUser.wednesdayPlans.length} plan(s)";

              break;
            case 3:
              weekDay = 'Thursday';
              completedTasks =
              "Completed: ${MyUser.finishedThursdayPlans.length} out of ${MyUser.thursdayPlans.length} plan(s)";

              break;
            case 4:
              weekDay = 'Friday';
              completedTasks =
              "Completed: ${MyUser.finishedFridayPlans.length} out of ${MyUser.fridayPlans.length} plan(s)";

              break;
            case 5:
              weekDay = 'Saturday';
              completedTasks =
              "Completed: ${MyUser.finishedSaturdayPlans.length} out of ${MyUser.saturdayPlans.length} plan(s)";

              break;
            case 6:
              weekDay = 'Sunday';
              completedTasks =
              "Completed: ${MyUser.finishedSundayPlans.length} out of ${MyUser.sundayPlans.length} plan(s)";

              break;
          }
          return BarTooltipItem(
            weekDay + '\n' + completedTasks,
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

