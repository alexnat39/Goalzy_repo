import 'package:flutter/cupertino.dart';
import 'package:goalzy_app/ChartWidgets/plan_bar_chart.dart';
import 'package:goalzy_app/ChartWidgets/plan_percent_indicator.dart';

/**
 * this funtions builds out three widgets for plan performance (used in plan performance and home pages)
 */
Widget buildThreeProgressWidgets(BuildContext context, var customHeight, Widget indicator, Widget chart) {
  return Container(
    child: SizedBox(
      //MediaQuery.of(context).size.height * 0.3
      height: customHeight,
      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: chart,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.34,
                      height: customHeight * 0.6,
                      child: indicator,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: customHeight * 0.4,
                      child: PlanPercentageRepresentationPerformancePage(0.0, 5.0),
                    ),
                  ],
                )
              ],
            )
          ]),
    ),
  );
}