import 'package:flutter/material.dart';
import 'package:covid_tracker/screens/tracker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Tracker(),
    );
  }
}
