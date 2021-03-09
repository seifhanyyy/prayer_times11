import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:praytimes/Custom_Icons/custom_icons_icons.dart';
import 'package:praytimes/screen/AzkarAstykaz.dart';
import 'package:praytimes/screen/AzkarB3dSalah.dart';
import 'package:praytimes/screen/AzkarNoom.dart';
import 'screen/AzkarAzan.dart';
import 'screen/AzkarMasa2.dart';
import 'screen/AzkarSaba7.dart';

void main() async {
  runApp(Azkar());
}

class Azkar extends StatelessWidget {
  //final alAzkarrrObject = new _alAzkarrrState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlAzkar Page',
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            centerTitle: true, // this is all you need
            leading: Icon(CustomIcons.book_1),

            title: Text(
              "الأذكار",
              //textAlign: TextAlign.right,
              //mainAxisAlignment: MainAxisAlignment.center,

              style: TextStyle(
                  fontFamily: 'CustomFonts',
                  //fontWeight: FontWeight.w900,
                  fontSize: 40),
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
  'أذكار المساء',
  'أذكار الصباح',
  "أذكار الاستيقاظ",
  'أذكار الآذان',
  'أذكار بعد الصلاه',
  "أذكار النوم",
];

final List<String> emojis = <String>[
  '🌙',
  '☀️',
  "🛏️",
  '🕌',
  '📿',
  "🛏️",
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
      
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 25),
        itemCount: alAzkarMenuList.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
              onTap: () {
                if (alAzkarMenuListIndicies[index] == "2") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AzkarM()),
                  );
                }
                if (alAzkarMenuListIndicies[index] == "3") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Azkar2()),
                  );
                }
                if (alAzkarMenuListIndicies[index] == "5") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AzkarA()),
                  );
                }
                if (alAzkarMenuListIndicies[index] == "4") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AzkarAs()),
                  );
                }
                if (alAzkarMenuListIndicies[index] == "7") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AzkarN()),
                  );
                }
                if (alAzkarMenuListIndicies[index] == "6") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AzkarSalah()),
                  );
                }
              },
              child: Container(
                  color: Color(0x00ffffff),
                  //margin: EdgeInsets.symmetric(vertical: 35, horizontal 15),

                  margin: EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Container(
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage("images/mosques.jpg"),
                      //     //fit: BoxFit.fill,
                      //     //alignment: Alignment.bottomLeft,
                      //     //colorFilter: new ColorFilter.mode(
                      //     //Colors.black.withOpacity(0.56), BlendMode.dstATop)
                      //   ),
                      // ),
                      child: Text(
                        '${emojis[index]} ${alAzkarMenuList[index]} ${emojis[index]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CustomFonts',
                            //fontWeight: FontWeight.w900,
                            fontSize: 40),
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
