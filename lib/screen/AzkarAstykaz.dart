import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../Alphaaa.dart';

class AzkarAs extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<AzkarAs> {
  Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('rashad');
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Azan');
        
  }

  Widget _buildContactItem({Map rashad}) {
    Color typeColor = getTypeColor(rashad['type']);
    if (rashad['category'] == "أذكار الآذان") {
      return Container(
        margin:EdgeInsets.only(bottom: 20),
          //margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 30),
          color: Colors.black,
          child: Column(
           
            children: [
            Row(
                  children: [
                  Expanded(
                    child:Padding(
                     padding: EdgeInsets.all(10),
                     child: Text(
                      rashad['zekr'],
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900),
                    ),)
                     
                  ),
                  ]),
              Row(
                  children: [
                  Expanded(
                    child:Padding(
                     padding: EdgeInsets.all(15),
                     child: Text(
                      rashad['description'],
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900),
                    ),)
                     
                  ),
                  ]),
                  
                    Row(
                      
                  children: [
                    Container(
                      color: Colors.black,
                  child:Expanded(
                    
                    child:Padding(
                     padding: EdgeInsets.all(15),
                     child: Text(
                      rashad['count'],
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900),
                    ),)
                     
                  ),
                    ),
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
        title: Text("أذكار الآذان"),
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
