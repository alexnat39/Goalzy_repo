import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goalzy_app/Services/push_notification_service.dart';
import 'package:goalzy_app/Views/home_view.dart';
import 'package:goalzy_app/Views/login_view.dart';
import 'package:goalzy_app/Views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';


//todo in settings page allow to cancel notofications
//todo change up flushbar appearances
//todo send notifications for upcoming and overdue plans/goals
//todo fix delete acct method and signout inside it

int activeGoalsCounter = 0;
int activePlansCounter = 0;
int ideasCounter = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  PushNotificationService _pushNotificationService = PushNotificationService();

  _pushNotificationService.initialize();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Goalzy',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'OpenSans',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
      },
    );
  }
}



