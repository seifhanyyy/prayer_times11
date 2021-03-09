import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(Map());

class Map extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Map> {
  GoogleMapController mapController;

  //final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  Position position;
  void initState(){
    getCurrentLocation();
    super.initState();
  }
  void getCurrentLocation() async{
    Position res= await Geolocator.getCurrentPosition();
    setState(() {
      position = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true, // this is all you need
          title: Text(
            "أماكن المساجد",
            style: TextStyle(
                fontFamily: 'CustomFonts',
                //fontWeight: FontWeight.w900,
                fontSize: 40),
          ),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 18.0,
          ),
        ),
      ),
    );
  }
}
