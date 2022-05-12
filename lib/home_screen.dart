import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:calculatior_1/scientificCalculator.dart';
import 'package:flutter/material.dart';

import 'Testing/exchange_screen.dart';

 class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        backgroundColor: Colors.indigo,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState((){
          _currentIndex = index;
          selected=index;
        }
        ),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(
              Icons.calculate,
              // color: _currentIndex==selected ?Colors.white:Colors.white,
              //  size:_currentIndex==selected ?32:20,
            ),
            title: const Text('Calculator',
            ),
            activeColor: Colors.white,
            //inactiveColor: Colors.indigo.withOpacity(0.8),
            //activeColor: Colors.indigo,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.replay_5_outlined),
            title: const Text('Exchange'),
            activeColor: Colors.white,
            //inactiveColor: Colors.white.withOpacity(0.8),

            //inactiveColor: Colors.indigo.withOpacity(0.8),
            //activeColor: Colors.indigo,

            textAlign: TextAlign.center,

          ),

          BottomNavyBarItem(
            icon: const Icon(Icons.subscriptions_outlined),
            title: const Text(
              'Subscription',
            ),
            activeColor: Colors.white


            //inactiveColor: Colors.indigo.withOpacity(0.8),
            //activeColor: Colors.indigo,
          ),

        ],
      ),


        body:_currentIndex==0?
        ScientificCalculator():
        _currentIndex==1?
            CurrencyExchange()
            :Container(
          color: Colors.yellow,
        )

    );
  }
}
