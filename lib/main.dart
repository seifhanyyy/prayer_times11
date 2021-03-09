import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:praytimes/Custom_Icons/custom_icons_icons.dart';
import 'package:praytimes/Settings.dart';
import 'package:praytimes/qiblah_compass.dart';
import 'package:workmanager/workmanager.dart';

import 'Home_Page.dart';
import 'Maps.dart';
import 'NewAzkar.dart';
import 'Quraaaaaan.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager.initialize(

      // The top level function, aka callbackDispatcher
      callbackDispatcher,

      // If enabled it will post a notification whenever
      // the task is running. Handy for debugging tasks
      isInDebugMode: true);
  // Periodic task registration
  Workmanager.registerPeriodicTask(
    "2",

    //This is the value that will be
    // returned in the callbackDispatcher
    "simplePeriodicTask",

    // When no frequency is provided
    // the default 15 minutes is set.
    // Minimum frequency is 15 min.
    // Android will automatically change
    // your frequency to 15 min
    // if you have configured a lower frequency.
    frequency: Duration(minutes: 15),
  );
  runApp(Main());
}

void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) {
    // initialise the plugin of flutterlocalnotifications.
    FlutterLocalNotificationsPlugin flip =
        new FlutterLocalNotificationsPlugin();

    // app_icon needs to be a added as a drawable
    // resource to the Android head project.
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var IOS = new IOSInitializationSettings();

    // initialise settings for both Android and iOS device.
    var settings = new InitializationSettings(android, IOS);
    flip.initialize(settings);
    _showNotificationWithDefaultSound(flip);
    return Future.value(true);
  });
}

Future _showNotificationWithDefaultSound(flip) async {
  // Show a notification after every 15 minute with the first
  // appearance happening a minute after invoking the method
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.Max, priority: Priority.High);
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();

  // initialise channel platform for both Android and iOS device.
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flip.show(
      0, 'PrayerTimes', 'لا تنسي قراءة الأذكار', platformChannelSpecifics,
      payload: 'Default_Sound');
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final pages = [
    HomePage(),
    Azkar(),
    Quran(),
    QiblahCompass(),
    Map(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prayer Times',
      theme: ThemeData(),
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Color(0x00ffffff),
          type: BottomNavigationBarType.fixed,
          //iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.book_1),
              title: Text('Al-Azkar'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.quran_1),
              title: Text('Quran'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.compass_1),
              title: Text('Qibla'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              title: Text('Map'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
