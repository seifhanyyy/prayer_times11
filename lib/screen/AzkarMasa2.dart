import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../Alphaaa.dart';

class AzkarM extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<AzkarM> {
  Query _ref;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Masaa');
  }

  Widget _buildContactItem({Map rashad}) {
    Color typeColor = getTypeColor(rashad['type']);
    if (rashad['category'] == "أذكار المساء") {
      return Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/mos.png"),
                //fit: BoxFit.fit,
                alignment: Alignment.bottomLeft,
                //colorFilter: new ColorFilter.mode(
                //Colors.black.withOpacity(0.56), BlendMode.dstATop)
              ),
              color: Colors.white,
              border: Border.all(
                  color: Colors.blue[300], // set border color
                  width: 3.0),
              // set border width
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              // set rounded corner radius
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
              ] // make rounded corner of border
              ),
          //margin: EdgeInsets.symmetric(vertical: 10),
          //color: Colors.black,
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'الذكر' + ':' + ' ' + rashad['zekr'],
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 17,
                          //color: Theme.of(context).primaryColor,
                          color: Colors.blue,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ]),
              Row(children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'المعني' + ':' + ' ' + rashad['description'],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900),
                  ),
                )),
              ]),
              Row(children: [
                Container(
                    child: Expanded(
                  child: Text(
                    'التكرار' + ':' + ' ' + rashad['count'],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900),
                  ),
                )),
              ]),
            ],
          ));
    } else {
      print('alooo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // this is all you need

        title: Text(
          "أذكار المساء",
          //textAlign: TextAlign.right,
          //mainAxisAlignment: MainAxisAlignment.center,

          style: TextStyle(
              fontFamily: 'CustomFonts',
              //fontWeight: FontWeight.w900,
              fontSize: 40),
        ),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            contact['key'] = snapshot.key;
            return _buildContactItem(rashad: contact);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return Deeb();
            }),
          );
        },
        //child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Color getTypeColor(String type) {
    Color color = Theme.of(context).accentColor;

    if (type == 'Family') {
      color = Colors.green;
    }
    return color;
  }
}
