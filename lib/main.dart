import 'package:flutter/material.dart';
import 'home_screen.dart';

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







///////////////////////////////////// Currency Converter //////////////////////
/*


import 'package:calculatior_1/MoneyExchange/exchange_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Currency Exchange/currmodel.dart';
import 'Currency Exchange/homepage.dart';
import 'home_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        debugShowCheckedModeBanner: false,
        //home: CurrencyExchange(),
        home: HomeScreen(),

      ),
    );
  }
}
*/
