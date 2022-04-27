
import 'package:flutter/material.dart';

import 'Models/currency_exchange_model.dart';
import 'Services/api_manager.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<Currency>? _cocktailModel;

/*
  @override
  void initState() {

*//*    setState(() {
      _cocktailModel = Api_Manager().getData('CAD','PHP','10');
    });*//*

    _cocktailModel = Api_Manager().getData('CAD','PHP','10');

   // _cocktailModel = Api_Manager().getData(from.toString(), to.toString(), quantity.toString());

    print("-----------------------------------------------");
    print(_cocktailModel.toString());
    print("-----------------------------------------------");
    super.initState();
  }*/


  List<String>? currencyName = [
    'CAD',
    'HKD',
    'ISK',
    'PHP',
    'DKK',
    'HUF',
    'CZK',
    'GBP',
    'RON',
    'SEK',
    'IDR',
    'INR',
    'BRL',
    'RUB',
    'HRK',
    'JPY',
    'THB',
    'CHF',
    'EUR',
    'MYR',
    'BGN',
    'TRY',
    'CNY',
    'NOK',
    'NZD',
    'ZAR',
    'USD',
    'MXN',
    'SGD',
    'AUD',
    'ILS',
    'KRW',
    'PLN',
  ];
  String? from, to, quantity;


  int? select;

  void currency_exchange(){
    setState(() {
      _cocktailModel = Api_Manager().getData(from.toString(), to.toString(), quantity.toString());
    });
  }



  @override
  Widget build(BuildContext context) {
    var widht1 = MediaQuery.of(context).size.width;
    var height1=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Testing"),
        centerTitle: true,
      ),
      body: Container(
        height:height1,
        width: widht1,
       // color: Colors.green,
       // color: Colors.green,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 130,
                width: double.infinity,
                //color: Colors.yellow,
                child: FutureBuilder<Currency>(
                    future: _cocktailModel,
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                            itemCount:1,
                            //itemCount: snapshot.data.workableServers.length,
                            itemBuilder: (context,index){
                              //var cocktails =  snapshot.data!.updatedDate;
                              //print(object)
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      select = index;
                                    });
                                  },
                                  child: Container(
                                    height: 110,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:select==index ? Colors.cyan : Colors.white,
                                      borderRadius: BorderRadius.circular(9),
                                      boxShadow:  [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          offset: const Offset(0, 0),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                         /* Container(
                                            height: select==index ? 80:70,
                                            width: select==index ? 80:70,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                          ),*/
                                          const SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    //width: 45,
                                                   // color: Colors.green,
                                                    child:  Text(snapshot.data!.baseCurrencyCode.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                   // color: Colors.yellow,
                                                      width: widht1*0.57,
                                                      child: Text(snapshot.data!.amount.toString())),
                                                ],
                                              ),
                                              const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  //NetworkImage(flips.url),
                                                  Container(
                                                    //width: 45,
                                                    child:  Text(snapshot.data!.rates!.gbp!.currencyName.toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Text(snapshot.data!.rates!.gbp!.rate.toString()),
                                                ],
                                              ),


                                     /*         Row(
                                                children: [
                                                  //NetworkImage(flips.url),
                                                  Container(
                                                    width: 45,
                                                    child: const Text("D1:",
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),*/



                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      }
                      else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<String>(
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          dropdownColor: Colors.amber[300],
                          hint: Text(from == null ? 'FROM' : from ??" "),
                          value: from,
                          items: currencyName?.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              from = value;
                            });
                          },
                        ),

                        DropdownButton<String>(
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          dropdownColor: Colors.amber[300],
                          hint: Text(to == null ? 'TO' : to ??""),
                          value: to,
                          items: currencyName?.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              to = value;
                            });
                          },
                        ),
                      ],
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'Quantity',
                          labelStyle: TextStyle(color: Colors.black)),
                      onChanged: (val) => setState(() => quantity = val),
                    ),
                    OutlineButton(
                      borderSide: const BorderSide(
                        color: Colors.red, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 0.8, //width of the border
                      ),
                /*      onPressed: () {
                        currency_exchange();
                       // Api_Manager().getData(from.toString(), to.toString(), quantity.toString());

                       //fetchItem(from.toString(), to.toString(), quantity.toString());
                        Navigator.pop(context);
                        print("************${from.toString()}***********${to.toString()}*****************${quantity.toString()}");
                      },*/


                      onPressed:(){
                        currency_exchange();
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}