import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';


//colors for goal,plan,idea widgets in home_view & all_tasks_view
List colorsForGoalWidgets = [
  Colors.red[300],
  Colors.teal[300],
  Colors.yellow[300],
  Colors.green[300],
  Colors.blue[300],
  Colors.pinkAccent[100],
  Colors.orange[300],
];
List colorsForPlanWidgets = [
  Colors.blue[300],
  Colors.orange[300],
  Colors.green[300],
  Colors.pinkAccent[100],
  Colors.red[300],
  Colors.yellow[300],
  Colors.teal[300],
];
List colorsForIdeaWidgets = [
  Colors.pinkAccent[100],
  Colors.orange[300],
  Colors.blue[300],
  Colors.teal[300],
  Colors.green[300],
  Colors.red[300],
  Colors.yellow[300],
];


//gradients for barCharts
var planBarChartGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color(0xffffafbd).desaturate(15), Color(0xffffc3a0).desaturate(15)]);
var goalBarChartGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color(0xffff6e7f).desaturate(30),Color(0xffbfe9ff).desaturate(30)]);

