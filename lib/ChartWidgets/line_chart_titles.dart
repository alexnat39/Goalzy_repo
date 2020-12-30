
import 'package:date_util/date_util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineGoalTitles {
  static getTitleData() => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize: 35,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff68737d),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return "FEB";
          case 4:
            return 'MAY';
          case 7:
            return 'AUG';
          case 10:
            return 'NOV';

        }
        return '';
      },
      //margin: 8,
    ),
     leftTitles: SideTitles(
      showTitles: false,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff67727d),
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return '10k';
          case 3:
            return '30k';
          case 5:
            return '50k';
        }
        return '';
      },
      //reservedSize: 35,
     // margin: 12,
    ),
  );
}












class LinePlanTitles {
  static getTitleData() => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize: 35,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff68737d),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      getTitles: (value) {
        if (DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year) == 28) {
          switch (value.toInt()) {
            case 0:
              return "1";
            case 2:
              return '3';
            case 4:
              return '5';
            case 6:
              return '7';
            case 8:
              return '9';
            case 10:
              return '11';
            case 12:
              return '13';
            case 14:
              return '15';
            case 16:
              return '17';
            case 18:
              return '19';
            case 20:
              return '21';
            case 22:
              return '23';
            case 24:
              return '25';
            case 26:
              return '27';
          }
        } else if ( DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year) == 29 || DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year) == 30) {
          switch (value.toInt()) {
            case 0:
              return "1";
            case 2:
              return '3';
            case 4:
              return '5';
            case 6:
              return '7';
            case 8:
              return '9';
            case 10:
              return '11';
            case 12:
              return '13';
            case 14:
              return '15';
            case 16:
              return '17';
            case 18:
              return '19';
            case 20:
              return '21';
            case 22:
              return '23';
            case 24:
              return '25';
            case 26:
              return '27';
            case 28:
              return '29';
          }
        } else if (DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year) == 31) {
          switch (value.toInt()) {
            case 0:
              return "1";
            case 2:
              return '3';
            case 4:
              return '5';
            case 6:
              return '7';
            case 8:
              return '9';
            case 10:
              return '11';
            case 12:
              return '13';
            case 14:
              return '15';
            case 16:
              return '17';
            case 18:
              return '19';
            case 20:
              return '21';
            case 22:
              return '23';
            case 24:
              return '25';
            case 26:
              return '27';
            case 28:
              return '29';
            case 30:
              return '31';
          }
        }
        return '';
      },
      //margin: 8,
    ),
    leftTitles: SideTitles(
      showTitles: false,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff67727d),
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return '10k';
          case 3:
            return '30k';
          case 5:
            return '50k';
        }
        return '';
      },
      //reservedSize: 35,
      // margin: 12,
    ),
  );
}