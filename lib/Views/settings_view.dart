import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalzy_app/CustomWidgets/confirm_delete_dialog.dart';
import 'package:goalzy_app/CustomWidgets/custom_widgets_settings_view.dart';
import 'package:goalzy_app/Models/User.dart';
import 'package:goalzy_app/Services/database_service.dart';
import 'package:goalzy_app/Views/change_email_view.dart';
import 'package:goalzy_app/Views/change_name_view.dart';
import 'package:goalzy_app/Views/change_password_view.dart';
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
                  "Settings",
                ),
              ],
            ),
          ),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Material(
          color: Colors.blueGrey[700],
          child: Padding(
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
                      Icon(Icons.person_outline_rounded, color: Colors.white38),
                      Text("  My Information",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.grey[400],
                ),
                RegularSettingsTile(
                  "Email",
                  MyUser.email,
                  Icon(Icons.mail, color: Colors.white38),
                  onPressFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeEmailPage()));
                    print("navigated");
                  },
                ),
                RegularSettingsTile(
                  "Name",
                  MyUser.name,
                  Icon(Icons.person, color: Colors.white38),
                  onPressFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNamePage()));
                    print("navigated");
                  },
                ),
                RegularSettingsTile(
                  "Change password",
                  "",
                  Icon(Icons.vpn_key, color: Colors.white38),
                  onPressFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePasswordPage()));
                    print("navigated");
                  },
                ),
                ScreamingSettingsTile(
                  "Delete Account",
                  onPressFunction: () {
                    print("dialog popped up");
                    ConfirmDeleteDialog(
                        "Are you sure?",
                        "Deleting will permanently erase your data.",
                        onPressYesFunction: () async {
                          try {
                            await _databaseService.deleteUserAccountFirestore(context,
                                MyUser.uid);
                            await _databaseService
                                .deleteUserAccountFirebaseAuth();
                            Navigator.pop(context);
                            await _databaseService.signOut(context);
                          } catch (e) {
                            print(e);
                            Navigator.pop(context);
                          }
                    }).build(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      Icon(Icons.phone_iphone, color: Colors.white38),
                      Text("  Appearance",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.grey[400],
                ),
                ToggleSettingsTile(
                  "Dark Mode",
                  _darkMode,
                  Icon(Icons.brightness_2_rounded, color: Colors.white38),
                  onToggleFunction: () {
                    print("Set the dark mode");
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      Icon(Icons.circle_notifications, color: Colors.white38),
                      Text("  Notifications",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.grey[400],
                ),
                ToggleSettingsTile(
                  "Push Notifications",
                  _receiveNotificationsValue,
                  Icon(Icons.notifications_active_outlined,
                      color: Colors.white38),
                  onToggleFunction: () {
                    print("Set the notification");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
