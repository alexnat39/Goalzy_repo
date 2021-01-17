import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_settings_view.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Services/database_service.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var _databaseService = DatabaseService();
  bool _receiveNotificationsValue = false;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Goalzy",
                ),
              ],
            ),
          ),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 35,
            child: Row(
              children: [
                Icon(Icons.person_outline_rounded),
                Text("  My Information"),
              ],
            ),
          ),
          Divider(height: 0, thickness: 1, color: Colors.grey[400],),
          RegularSettingsTile(
            "Email",
            MyUser.email,
            Icon(Icons.mail_outline),
            onPressFunction: () {
              print("navigated");
            },
          ),
          RegularSettingsTile(
            "Name",
            MyUser.name,
            Icon(Icons.perm_identity_sharp),
            onPressFunction: () {
              print("navigated");
            },
          ),
          RegularSettingsTile(
            "Change password",
            "",
            Icon(Icons.vpn_key_outlined),
            onPressFunction: () {
              print("navigated");
            },
          ),
          ScreamingSettingsTile("Delete Account", onPressFunction: () {
            print("opened are you sure pop up dialog");
          },),
          SizedBox(
            height: 20,
          ),          SizedBox(
            height: 35,
            child: Row(
              children: [
                Icon(Icons.phone_iphone),
                Text("  Appearance"),
              ],
            ),
          ),
          Divider(height: 0, thickness: 1, color: Colors.grey[400],),
          ToggleSettingsTile("Dark Mode", _darkMode, Icon(Icons.brightness_2_rounded), onToggleFunction: () {
            print("Set the dark mode");
          },),


          SizedBox(
            height: 20,
          ),          SizedBox(
            height: 35,
            child: Row(
              children: [
                Icon(Icons.circle_notifications),
                Text("  Notifications"),
              ],
            ),
          ),
          Divider(height: 0, thickness: 1, color: Colors.grey[400],),
          ToggleSettingsTile("Dark Mode", _receiveNotificationsValue, Icon(Icons.notifications_active_outlined), onToggleFunction: () {
            print("Set the notification");
          },),


        ],
      ),
    ));
  }
}
