import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'loading_indicator.dart';
import 'qiblah_compass.dart';
import 'qiblah_maps.dart';



void main()
{runApp(QiblaMecca());}
class QiblaMecca extends StatefulWidget {

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<QiblaMecca> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Qiblaa'),
        ),
        
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data)
              return QiblahCompass();
            else
              return QiblahMaps();
          },
        ),
      ),
    );
  }
}

class CenterEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Qibla'),
        ),
        body: Center(
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QiblaMecca();
                  },
                ),
              );
            },
            child: Text('Open Qiplah'),
          ),
        ));
  }
}

