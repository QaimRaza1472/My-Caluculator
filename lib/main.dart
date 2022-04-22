import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'scientificCalculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,

        //primaryColor: Color(0xff1228FF),
        //primarySwatch: Colors.blue,
      ),
      //home: ScientificCalculator(),
      home: HomeScreen(),

    );
  }
}

