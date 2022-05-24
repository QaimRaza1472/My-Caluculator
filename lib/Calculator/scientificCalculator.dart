import 'dart:collection';
import 'dart:ffi';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'keyboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack/stack.dart';

String firstOperand = '0';
String secondOperand = '';
String operators = '';
String equation = '0';
String result = '';


class ScientificCalculator extends StatefulWidget {
  const ScientificCalculator({Key? key}) : super(key: key);

  @override
  _ScientificCalculatorState createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {


  bool scientificKeyboard = false;

  @override
  void initState() {
    super.initState();
     getValue();
   // setValue();
    initialise();

  }

  String expression = '';
  double equationFontSize = 35.0;
  double resultFontSize = 25.0;

  void initialise() {}

  void _onPressed({String? buttonText}) {
    switch (buttonText) {
      case EXCHANGE_CALCULATOR:
        setState(() {
          scientificKeyboard = !scientificKeyboard;
          _clear();
        });
        break;
      case CLEAR_ALL_SIGN:
        setState(() {
          _clear();
        });
        break;
      case DEL_SIGN:
        setState(() {
          if (scientificKeyboard) {
            equationFontSize = 35.0;
            resultFontSize = 25.0;
            equation = equation.substring(0, equation.length - 1);
            if (equation == '') equation = '0';
          } else {
            equationFontSize = 35.0;
            resultFontSize = 25.0;
            if (operators == '') {
              firstOperand = firstOperand.substring(0, firstOperand.length - 1);
              if (firstOperand == '') firstOperand = '0';
            } else {
              secondOperand =
                  secondOperand.substring(0, secondOperand.length - 1);
              if (secondOperand == '') secondOperand = '';
            }
          }
        }
        );
        break;
      case EQUAL_SIGN:
        if (result == '') {
          scientificKeyboard ? _scientificResult() : _simpleResult();
        }
        break;
      default:
        scientificKeyboard
            ? _scientificOperands(buttonText)
            : _simpleOperands(buttonText);
    }
  }



  void _clear() {
    firstOperand = '0';
    secondOperand = '';
    operators = '';
    equation = '0';
    result = '';
    expression = '';
    equationFontSize = 35.0;
    resultFontSize = 25.0;
  }







    List<String>? calValue;
  final myStack = Stack<String>();

     Future <void> setValue() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String total_result=(firstOperand+operators+secondOperand+"="+result).toString();
    myStack.push(total_result);
    pref.setStringList("cal_value", myStack.getStack());
  }



  Future <void> getValue() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    //calValue = pref.getString('cal_value') ;
    calValue = pref.getStringList('cal_value');
    print("**********test1***********:${calValue}" );
    setState(() {
    });
  }

/////////////////////////////////////////////////////////////////////////////////



  Future <void> pop_values()async{

   final SharedPreferences pref = await SharedPreferences.getInstance();

   // final success = await pref.remove('cal_value');

     await pref.remove('cal_value');
     print('---------------  Pref GetKeys  -------------');
     print(pref.containsKey('cal_value'));


     //myStack.pop();
  }



  //////////////////////////////////////////////////////////////////////////////

  Future <void> _simpleOperands(value) async {

    setState(() {
      show_history=false;
      equationFontSize = 35.0;
      resultFontSize = 25.0;
      switch (value) {
        case MODULAR_SIGN:
          if (result != '') {
            firstOperand = (double.parse(result) / 100).toString();

           // int count  =  _prefs.setInt('counter', firstOperand);
            //setValue(,);

          } else if (operators != '') {
            if (secondOperand != "") {
              if (operators == PLUS_SIGN || operators == MINUS_SIGN) {
                secondOperand = ((double.parse(firstOperand) / 100) * double.parse(secondOperand)).toString();
              } else if (operators == MULTIPLICATION_SIGN ||
                  operators == DIVISION_SIGN) {
                secondOperand = (double.parse(secondOperand) / 100).toString();
              }
            }
          } else {
            if (firstOperand != "") {
              firstOperand = (double.parse(firstOperand) / 100).toString();
            }
          }
          if (firstOperand.toString().endsWith(".0")) {
            firstOperand = int.parse(firstOperand.toString().replaceAll(".0", "")).toString();
          }
          if (secondOperand.toString().endsWith(".0")) {
            secondOperand = int.parse(secondOperand.toString().replaceAll(".0", "")).toString();
          }
          break;
        case DECIMAL_POINT_SIGN:
          if (result != '') _clear();
          if (operators != '') {
            if (!secondOperand.toString().contains(".")) {
              if (secondOperand == "") {
                secondOperand = ".";
              } else {
                secondOperand += ".";
              }
            }
          } else {
            if (!firstOperand.toString().contains(".")) {
              if (firstOperand == "") {
                firstOperand = ".";
              } else {
                firstOperand += ".";
              }
            }
          }
          break;
        case PLUS_SIGN:
        case MINUS_SIGN:
        case MULTIPLICATION_SIGN:
        case DIVISION_SIGN:
          if (firstOperand == '0') {
            if (value == MINUS_SIGN) firstOperand = MINUS_SIGN;
          } else if (secondOperand == '') {
            operators = value;
          } else {
            _simpleResult();
            firstOperand = result;
            operators = value;
            secondOperand = '';
            result = '';
          }
          break;
        default:
          if (operators != '') {
            secondOperand += value;
          } else {
            firstOperand == ZERO ? firstOperand = value : firstOperand += value;
          }
      }
    }
    );
  }


  void _simpleResult() {
    setValue();
    getValue();

    setState(() {
      equationFontSize = 25.0;
      resultFontSize = 35.0;
      expression = firstOperand + operators + secondOperand;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');
      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        if (result == 'NaN') result = CALCULATE_ERROR;
        _isIntResult();
      } catch (e) {
        result = CALCULATE_ERROR;
      }
    }
    );
  }


  void _scientificOperands(value) {
    setState(() {
      equationFontSize = 35.0;
      resultFontSize = 25.0;
      if (value == POWER_SIGN) value = '^';
      if (value == MODULAR_SIGN) value = ' mód ';
      if (value == ARCSIN_SIGN) value = 'arcsin';
      if (value == ARCCOS_SIGN) value = 'arccos';
      if (value == ARCTAN_SIGN) value = 'arctan';
      if (value == DECIMAL_POINT_SIGN) {
        if (equation[equation.length - 1] == DECIMAL_POINT_SIGN) return;
      }
      equation == ZERO ? equation = value : equation += value;
    });
  }

  void _scientificResult() {
    setState(() {
      equationFontSize = 25.0;
      resultFontSize = 35.0;
      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');
      expression = expression.replaceAll(PI, '3.1415926535897932');
      expression = expression.replaceAll(E_NUM, 'e^1');
      expression = expression.replaceAll(SQUARE_ROOT_SIGN, 'sqrt');
      expression = expression.replaceAll(POWER_SIGN, '^');
      expression = expression.replaceAll(ARCSIN_SIGN, 'arcsin');
      expression = expression.replaceAll(ARCCOS_SIGN, 'arccos');
      expression = expression.replaceAll(ARCTAN_SIGN, 'arctan');
      expression = expression.replaceAll(LG_SIGN, 'log');
      expression = expression.replaceAll(' mód ', MODULAR_SIGN);
      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        if (result == 'NaN') result = CALCULATE_ERROR;
        _isIntResult();
      } catch (e) {
        result = CALCULATE_ERROR;
      }
    });
  }

  _isIntResult() {
    if (result.toString().endsWith(".0")) {
      result = int.parse(result.toString().replaceAll(".0", "")).toString();
     // setValue();
    }
  }

  bool show_history=false;

  @override
  Widget build(BuildContext context) {
    var height1=MediaQuery.of(context).size.height;
    var width1=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        title: const Text("Calculator"),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text("History"),
                  value: 1,
                  onTap: (){
                    setState(() {
                      show_history=true;
                      getValue();
                      _clear();
                      //setValue();

                    });
                  },
                ),

              /*  PopupMenuItem(
                  child: const Text("Show Stack"),
                  value: 2,
                  onTap: (){
                    print("Show Stack");
                    myStack.getStack();
                  },
                ),
*/
              ]
          )
        ],
      ),


      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
               //color: Colors.orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      show_history?
                      Column(
                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            height: height1*0.29,
                            width: width1,
                           // color: Colors.yellow,
                            child: Container(
                              //height: height1*0.29,
                              //width: 200,

                              decoration: BoxDecoration(
                                color: Colors.white,
                               // color: Colors.orange,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 0),
                                  )
                                ]
                              ),

                              //color: Colors.green,
                              child:calValue!=null? Padding(
                                padding: const EdgeInsets.only(top:3.0),
                                child: ListView.builder(
                                    itemCount: calValue?.length,
                                    itemBuilder:(context,index){
                                      return Padding(
                                        padding: const EdgeInsets.only(left:8.0,top:1),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                           Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                  calValue?[index] ??"")
                                          ) ,
                                            //Text(calValue![2]),
                                          ],
                                        ),
                                      );
                                },
                                ),
                              ):const Center(
                                  child: Text("No History"),
                              ),
                            ),
                          ),

                          TextButton(
                            onPressed: (){

                              pop_values();

                              myStack.pop();
                              getValue();

                               setState((){
                                //pop_values();
                               // calValue?.clear();

                                show_history=false;

                               // final SharedPreferences pref = await SharedPreferences.getInstance();

                              // final success = await pref.remove('cal_value');

                                //await pref.remove('cal_value');

                              });

                              //pop_values();
                              //myStack.pop();

                              print("Pop Printed............");
                            },
                            child: const Text('Clear'),
                          ),
                        ],
                      ):Container()
                    ],
                  ),

                ),
            ),

            //SizedBox(height: 100, ),

            Container(
              color: Colors.green,
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: !scientificKeyboard
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          _inOutExpression(firstOperand, equationFontSize),
                          operators != ''
                              ? _inOutExpression(operators, equationFontSize)
                              : Container(),
                          secondOperand != ''
                              ? _inOutExpression(secondOperand, equationFontSize)
                              : Container(),
                          result != ''
                              ? _inOutExpression(result, resultFontSize)
                              : Container(),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          _inOutExpression(equation, equationFontSize),
                          result != ''
                              ? _inOutExpression(result, resultFontSize)
                              : Container(
                            //color: Colors.deepPurpleAccent,
                          ),
                        ],
                      ),
              ),
            ),

            Keyboard(
              keyboardSigns: (scientificKeyboard)
                  ? keyboardScientificCalculator
                  : keyboardSingleCalculator,
              onTap: _onPressed,
            ),

          ],
        ),
      ),
    );
  }



  Widget _inOutExpression(text, size) {
    return SingleChildScrollView(
      reverse: true,
      scrollDirection: Axis.horizontal,
      child: Text(
        text is double ? text.toStringAsFixed(2) : text.toString(),
        style: TextStyle(

          //color: const Color(0xFF444444),

          //color: Colors.red,
          fontSize: size,

         // fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}

class Stack<E> {
  final _list = <E>[];

  void push(E value) => _list.add(value);

 //E pop() => _list.removeLast();

 //void pop() => _list.remove(true);

 // E pop() => _list.removeLast();

   pop(){
     return _list.remove(true);
   }


  getStack(){
    print("-------------MY All Stack Values  ------------ ${_list}");
    return _list;
  }


  E get peek => _list.last;
  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}










