import 'package:flutter/material.dart';
import 'package:praytimes/Feedback.dart';

import 'models/option_model.dart';

void main() => runApp(Settings());
Image alpha = Image.asset('images/yoyo.jpg');

class Settings extends StatefulWidget {
  @override
  _MenuOptionsScreenState createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<Settings> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          leading: Icon(Icons.settings),
          centerTitle: true, // this is all you need
          title: Text(
            "الاعدادات",
            style: TextStyle(
                fontFamily: 'CustomFonts',
                //fontWeight: FontWeight.w900,
                fontSize: 30),
          ),
          actions: <Widget>[
            FlatButton(
                textColor: Colors.white,
                child: Text(
                  'للتواصل',
                  style: TextStyle(
                      fontFamily: 'CustomFonts',
                      //fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReachUs()),
                    ))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/yoyo.jpg"), fit: BoxFit.cover)),
          child: ListView.builder(
            itemCount: options.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return SizedBox(height: 15.0);
              } else if (index == options.length + 1) {
                return SizedBox(height: 100.0);
              }
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: _selectedOption == index - 1
                      ? Border.all(color: Colors.black26)
                      : null,
                ),
                child: ListTile(
                  leading: options[index - 1].icon,
                  title: Text(
                    options[index - 1].title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: _selectedOption == index - 1
                          ? Colors.black
                          : Colors.grey[600],
                    ),
                  ),
                  selected: _selectedOption == index - 1,
                  onTap: () {
                    setState(() {
                      _selectedOption = index - 1;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
