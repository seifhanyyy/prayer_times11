import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:praytimes/screen/AzkarAstykaz.dart';
import 'package:praytimes/screen/AzkarB3dSalah.dart';
import 'package:praytimes/screen/AzkarNoom.dart';
import 'Constants.dart';
import 'screen/AzkarMasa2.dart';
import 'screen/AzkarSaba7.dart';
import 'screen/AzkarAzan.dart';
void main() async {
  runApp(Deeeb());
}

class Deeeb extends StatelessWidget {
  //final alAzkarrrObject = new _alAzkarrrState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlAzkar Page',
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text(
              'Al-Azkar',
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/yoyo.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.56), BlendMode.dstATop)),
            ),
            child: alAzkar(),
          )),
    );
  }
}

//final dbRef = FirebaseDatabase.instance.reference().child("pets");

final List<String> alAzkarMenuList = <String>[
  'اذكار المساء',
  'اذكار الصباح',
  "أذكار الاستيقاظ من النوم",
  'أذكار الآذان',
  'الأذكار بعد السلام من الصلاة',
  "أذكار النوم",
];
final List<String> alAzkarMenuListIndicies = <String>[
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
];

class alAzkar extends StatefulWidget {
  @override
  _alAzkarState createState() => _alAzkarState();
}

class _alAzkarState extends State<alAzkar> {
  var menuIndex = '';
  //List<String> chosenMenu = <String>[];
  var menuIndexInteger = 0;
  Widget alAzkarWidget;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: deeb,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 25),
        itemCount: alAzkarMenuList.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(onTap: () {
            if (alAzkarMenuListIndicies[index] == "2") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AzkarM()),
              );
            }
            if(alAzkarMenuListIndicies[index] == "3") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Azkar2()),
              );
          }
              if(alAzkarMenuListIndicies[index] == "5") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AzkarA()),
              );
          }
              if(alAzkarMenuListIndicies[index] == "4") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AzkarAs()),
              );
          }
              if(alAzkarMenuListIndicies[index] == "7") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AzkarN()),
              );
          }
              if(alAzkarMenuListIndicies[index] == "6") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AzkarSalah()),
              );
          }
          },
          child:
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    '${alAzkarMenuList[index]}',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
              )

              //print('${alAzkarMenuListIndicies[index]}');
          ));
        },
      ),
    );
  }
}
