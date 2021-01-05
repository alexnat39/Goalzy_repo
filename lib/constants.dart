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

List colorsForGoalWidgetsTest = [
  customGradient1,
  customGradient2,
  customGradient3,
  customGradient4,
  customGradient5,
  customGradient6,
  customGradient7,
  customGradient8,
];

var customGradient1 = RadialGradient(
  radius: 0.8,
  colors: [Color(0xFF42e3f5), Color(0xFF20a1b0)],
);
var customGradient2 = RadialGradient(
  radius: 0.8,
  colors: [Color(0xFFf0bc5c), Color(0xFFc59b4c)],
);
var customGradient3 = RadialGradient(
  radius: 0.8,
  colors: [Color(0xFFe0e63e), Color(0xFFb2b818)],
);

var customGradient4 = RadialGradient(
  radius: 0.8,
  colors: [Color(0xFF9fedd7), Color(0xFF66988a)],
);

var customGradient5 = RadialGradient(
  radius: 0.8,
  colors: [Color(0xFFa7ea5e), Color(0xFF6a943c)],
);
var customGradient6 = RadialGradient(
  radius: 0.8,
  colors: [Color(0xFFeab3ca), Color(0xFFbe92a5)],
);
var customGradient7 = RadialGradient(
  radius: 0.8,
  colors: [Color(0xFF9cb4f2), Color(0xFF8194c7)],
);
var customGradient8 = RadialGradient(
  radius: 1,
  colors: [Color(0xFFecaefd), Color(0xFF935ba3)],
);
//background-image: radial-gradient(circle, #2369d1, #0059ab, #004985, #043860, #0f273d);

var customGradient9 = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [Color(0xFFB2FFFC), Color(0xFFA6DBD9)],
);
var customGradient10 = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [Color(0xFFE8D1FF), Color(0xFFC4AFDA)],
);