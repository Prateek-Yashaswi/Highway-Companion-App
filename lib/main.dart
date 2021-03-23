import 'package:flutter/material.dart';
import 'package:cubehighways/Screens/homepage.dart';
import 'package:cubehighways/Screens/calls.dart';
import 'package:cubehighways/Screens/weather.dart';
import 'package:cubehighways/Screens/feedback.dart';

import 'Screens/traffic.dart';
void main() {
  runApp(
    MaterialApp(
        initialRoute: '/homepage',
        routes: {
          '/homepage':(context) => homePage(),
          '/makecalls':(context) => calls(),
          '/weather':(context) => weather(),
          '/feedback':(context) => feedBack(),
          '/traffic':(context) => traffic(),
        }
    ),
  );
}

