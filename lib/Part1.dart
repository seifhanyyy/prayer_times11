import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constants.dart';

void main() {
  runApp(Part1());
}

class Part1 extends StatefulWidget {
  _MainState createState() => _MainState();
}

class _MainState extends State<Part1> {
  bool notifications = true;
  var width = 0.0;

  Widget build(BuildContext context) {
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'QuranPages Page',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFECD8A1),
            title: Text('الجزء الأول'),
          ),
          bottomNavigationBar: navBar,
          body: Column(
            children: <Widget>[
              Expanded(
                //child: alAzkar,
              ),
            ],
          ),
        ),
      );
    }
  }

  Column _buildButtonColumnWithoutIcon(Color color, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget notificationAlert() {
    return Positioned(
      right: width / 2 - 25,
      top: width,
      child: FractionalTranslation(
        translation: Offset(0.0, -0.5),
        child: FloatingActionButton(
          onPressed: () {
            notifications = !notifications;
            setState(() {});
          },
          backgroundColor: Colors.white,
          child: Icon(
            notifications
                ? Icons.notifications_active
                : Icons.notifications_off,
            color: notifications ? Colors.green : Colors.grey,
            size: 40,
          ),
        ),
      ),
    );
  }

  Container _buildAlAzkar(String label) {
    //Icon(icon, color: color),
    return Container(
      color: mainColor,
      //margin: const EdgeInsets.only(top: 8),
      margin: const EdgeInsets.all(8),
      child: Text(
        label,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}
