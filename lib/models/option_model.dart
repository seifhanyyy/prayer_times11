import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;

  Option({this.icon, this.title});
}

final options = [
  Option(
    icon: Icon(Icons.ad_units, size: 40.0),
    title: 'التنبيهات',
  ),
  Option(
    icon: Icon(Icons.access_time_outlined, size: 40.0),
    title: 'اعدادات اليوم و الوقت',
  ),
  Option(
    icon: Icon(Icons.location_on_rounded, size: 40.0),
    title: 'اعدادات الموقع',
  ),
];
