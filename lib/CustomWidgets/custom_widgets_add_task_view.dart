import 'package:flutter/cupertino.dart';

/**
 * class for custom toggle buttons inside add_task pages
 */
class CustomToggleButton extends StatelessWidget {
  String title;

  CustomToggleButton(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Center(child: Text(title, style: TextStyle(fontSize: 20))),
    );
  }
}