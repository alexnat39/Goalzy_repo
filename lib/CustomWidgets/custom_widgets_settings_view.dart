import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

bool _receiveNotificationsValue = false;
bool _darkMode = false;

class RegularSettingsTile extends StatefulWidget {
  String title;
  String subtitle;
  Icon icon;
  final VoidCallback onPressFunction;

  RegularSettingsTile(this.title, this.subtitle, this.icon,
      {this.onPressFunction});

  _RegularSettingsTileState createState() => _RegularSettingsTileState();
}

class _RegularSettingsTileState extends State<RegularSettingsTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressFunction,
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[400],
                width: 0.5,
              ),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            widget.icon,
            Text("  ${widget.title}"),
            Spacer(),
            Text("${widget.subtitle}  "),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15,
            ),
          ])),
    );
  }
}


class ScreamingSettingsTile extends StatefulWidget {
  String title;
  final VoidCallback onPressFunction;

  ScreamingSettingsTile(this.title,
      {this.onPressFunction});

  _ScreamingSettingsTileState createState() => _ScreamingSettingsTileState();
}

class _ScreamingSettingsTileState extends State<ScreamingSettingsTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressFunction,
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.red[300],
                width: 0.5,
              ),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            Text(widget.title, style: TextStyle(color: Colors.red[300])),
          ])),
    );
  }
}


class ToggleSettingsTile extends StatefulWidget {
  String title;
  bool status;
  Icon icon;
  final VoidCallback onToggleFunction;

  ToggleSettingsTile(this.title, this.status, this.icon,
      {this.onToggleFunction});

  _ToggleSettingsTileState createState() => _ToggleSettingsTileState();
}

class _ToggleSettingsTileState extends State<ToggleSettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[400],
            width: 0.5,
          ),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        widget.icon,
        Text("  ${widget.title}"),
        Spacer(),
        FlutterSwitch(
          activeColor: Colors.blue[200],
          inactiveColor: Colors.grey[400],
          width: 55.0,
          height: 30.0,
          value: widget.status,
          borderRadius: 50.0,
          toggleSize: 25,
          onToggle: (val) {
            setState(() {
              widget.status = val;
            });
          },
        ),
      ])
    );
  }
}