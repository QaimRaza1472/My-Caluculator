import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Models/currency_exchange_model.dart';
import 'Services/api_manager.dart';



class CurrencyExchange extends StatefulWidget {
  const CurrencyExchange({Key? key}) : super(key: key);

  @override
  _CurrencyExchangeState createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends State<CurrencyExchange> {

  Future<Currency>? _cocktailModel;

  @override
  void initState() {
    currency_exchange(from.toString(), to.toString(), quantity.toString());
    /*setState(() {
      _cocktailModel = Api_Manager().getData('CAD','PHP','10');
    });*/

    //_cocktailModel = Api_Manager().getData('CAD','PHP','10');

   // _cocktailModel = Api_Manager().getData(from.toString(), to.toString(), quantity.toString());

    print("-----------------------------------------------");
    print(_cocktailModel.toString());
    print("-----------------------------------------------");
    super.initState();
  }

/*
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
    'BRL',k
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

  */


  List<String>? currencyName = [
  "AED",
  "AFN",
  "ALL",
  "AMD",
  "ANG",
  "AOA",
  "ARS",
  "AUD",
  "AWG",
  "AZN",
  "BAM",
  "BBD",
  "BDT",
  "BGN",
  "BHD",
  "BIF",
  "BMD",
  "BND",
  "BOB",
  "BRL",
  "BSD",
  "BTN",
  "BWP",
  "BYN",
  "BZD",
  "CAD",
  "CDF",
  "CHF",
  "CLP",
  "CNY",
  "COP",
  "CRC",
  "CUP",
  "CVE",
  "CZK",
  "DJF",
  "DKK",
  "DOP",
  "DZD",
  "EGP",
  "ERN",
  "ETB",
  "EUR",
  "FJD",
  "FKP",
  "GBP",
  "GEL",
  "GHS",
  "GIP",
  "GMD",
  "GNF",
  "GTQ",
  "GYD",
  "HKD",
  "HNL",
  "HRK",
  "HTG",
  "HUF",
  "IDR",
  "ILS",
  "INR",
  "IQD",
  "IRR",
  "ISK",
  "JMD",
  "JOD",
  "JPY",
  "KES",
  "KGS",
  "KHR",
  "KMF",
  "KPW",
  "KRW",
  "KWD",
  "KYD",
  "KZT",
  "LAK",
  "LBP",
  "LKR",
  "LRD",
  "LYD",
  "MAD",
  "MDL",
  "MGA",
  "MKD",
  "MMK",
  "MNT",
  "MOP",
  "MRU",
  "MUR",
  "MVR",
  "MWK",
  "MXN",
  "MYR",
  "MZN",
  "NAD",
  "NGN",
  "NIO",
  "NOK",
  "NPR",
  "NZD",
  "OMR",
  "PAB",
  "PEN",
  "PGK",
  "PHP",
  "PKR",
  "PLN",
  "PYG",
  "QAR",
  "RON",
  "RSD",
  "RUB",
  "RWF",
  "SAR",
  "SBD",
  "SCR",
  "SDG",
  "SEK",
  "SGD",
  "SHP",
  "SLL",
  "SOS",
  "SRD",
  "SSP",
  "STN",
  "SYP",
  "SZL",
  "THB",
  "TJS",
  "TMT",
  "TND",
  "TOP",
  "TRY",
  "TTD",
  "TWD",
  "TZS",
  "UAH",
  "UGX",
  "USD",
  "UYU",
  "UZS",
  "VES",
  "VND",
  "VUV",
  "WST",
  "XAF",
  "XCD",
  "XDR",
  "XOF",
  "XPF",
  "YER",
  "ZAR",
  "ZMW",
  ];




  String? from, to, quantity;

  int? select;

  void currency_exchange(String fromCurrency, String toCurrency, String currencyValue){
    setState(() {
      _cocktailModel = Api_Manager().getData(fromCurrency, toCurrency, currencyValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width1 = MediaQuery.of(context).size.width;
    var height1=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Exchange"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        height:height1,
        width: width1,
       // color: Colors.green,
       // color: Colors.green,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 18,),
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
                              /*return Padding(
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

                                         *//* Container(
                                            height: select==index ? 80:70,
                                            width: select==index ? 80:70,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                          ),*//*

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
                                                    child:  Text(
                                                      snapshot.data!.baseCurrencyCode.toString()+ ":",
                                                      style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                   // color: Colors.yellow,
                                                      width: width1*0.57,
                                                      child: Text(snapshot.data!.amount.toString())),
                                                ],
                                              ),
                                              const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  //NetworkImage(flips.url),
                                                  Container(
                                                    //width: 45,
                                                    child:  const Text(
                                                      "Name: ",
                                                      //snapshot.data!.rates!.gbp!.currencyName.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                      snapshot.data!.rates!.gbp!.currencyName.toString()
                                                    //snapshot.data!.rates!.gbp!.rate.toString(),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  //NetworkImage(flips.url),
                                                  Container(
                                                    //width: 45,
                                                    child:  const Text(
                                                      "Rate: ",
                                                      //snapshot.data!.rates!.gbp!.currencyName.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                      //snapshot.data!.rates!.gbp!.currencyName.toString()
                                                    snapshot.data!.rates!.gbp!.rate.toString(),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  //NetworkImage(flips.url),
                                                  Container(
                                                    //width: 45,
                                                    child:  const Text("Converted:",
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Text(snapshot.data!.rates!.gbp!.rateForAmount.toString()),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );*/
                              ///////////////////////////////
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
                                      color:select==index ? Colors.white : Colors.white,
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
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child:  Text(
                                                  snapshot.data!.baseCurrencyName.toString()+": ",
                                                  style: const TextStyle(
                                                      color: Colors.indigo,

                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  child: Text(snapshot.data!.amount.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.indigo,
                                                      fontWeight: FontWeight.w500,
                                                  ),
                                                  )
                                              ),

                                       /*       const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  //NetworkImage(flips.url),
                                                  Container(
                                                    //width: 45,
                                                    child:  const Text(
                                                      "Name: ",
                                                      //snapshot.data!.rates!.gbp!.currencyName.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                      snapshot.data!.rates!.gbp!.currencyName.toString()
                                                    //snapshot.data!.rates!.gbp!.rate.toString(),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5,),*/
                                    /*          Row(
                                                children: [
                                                  //NetworkImage(flips.url),
                                                  Container(
                                                    //width: 45,
                                                    child:  const Text(
                                                      "Rate: ",
                                                      //snapshot.data!.rates!.gbp!.currencyName.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    //snapshot.data!.rates!.gbp!.currencyName.toString()
                                                    snapshot.data!.rates!.gbp!.rate.toString(),
                                                  ),
                                                ],
                                              ),*/

                                            ],
                                          ),
                                          const Text('To',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child:  Text(
                                                  snapshot.data!.rates!.gbp!.currencyName.toString()+": ",
                                                  style: const TextStyle(
                                                    color: Colors.indigo,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                //width: width1*0.57,
                                                  //color: Colors.yellow,
                                                  child: Text(snapshot.data!.rates!.gbp!.rateForAmount.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.indigo,

                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  ),
                                              ),



                                              /*       const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  //NetworkImage(flips.url),
                                                  Container(
                                                    //width: 45,
                                                    child:  const Text(
                                                      "Name: ",
                                                      //snapshot.data!.rates!.gbp!.currencyName.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                      snapshot.data!.rates!.gbp!.currencyName.toString()
                                                    //snapshot.data!.rates!.gbp!.rate.toString(),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5,),*/
                                              /*          Row(
                                                children: [
                                                  //NetworkImage(flips.url),
                                                  Container(
                                                    //width: 45,
                                                    child:  const Text(
                                                      "Rate: ",
                                                      //snapshot.data!.rates!.gbp!.currencyName.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    //snapshot.data!.rates!.gbp!.currencyName.toString()
                                                    snapshot.data!.rates!.gbp!.rate.toString(),
                                                  ),
                                                ],
                                              ),*/

                                            ],
                                          ),












                                      /*    Column(
                                            children: [
                                              Container(
                                                //width: 45,
                                                child:  Text(snapshot.data!.rates!.gbp!.currencyName.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                              Text(snapshot.data!.rates!.gbp!.rateForAmount.toString()),
                                            ],
                                          ),*/

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
                          child: Text("Choose Currency",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                          //child: CircularProgressIndicator(),

                        );
                      }
                    }
                ),
              ),
              Container(
               // color: Colors.green,
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width * 0.86,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<String>(
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.indigo),
                          underline: Container(
                            height: 2,
                            color: Colors.indigo,
                            //color: Colors.deepPurpleAccent,
                          ),
                          //dropdownColor: Colors.amber[300],
                          dropdownColor:  Colors.white,
                          hint: Text(from == null ? 'FROM' : from ??" ",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                          value: from,
                          items: currencyName?.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                ),
                              ),
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
                          style: const TextStyle(color: Colors.indigo),
                          underline: Container(
                            height: 2,
                            color: Colors.indigo,
                          ),
                          dropdownColor:  Colors.white,
                          hint: Text(to == null ? 'TO' : to ??"",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              //  color: Colors.grey
                            ),
                          ),
                          value: to,
                          items: currencyName?.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value,
                                style: const TextStyle(
                                 // fontWeight: FontWeight.w600,
                                ),
                              ),
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
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.phone,
                      decoration:  const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Colors.indigo,
                                width: 1.5,
                              )),
                        hintText: 'Enter Currency',

                      ),
                      onChanged: (val) => setState(() => quantity = val),
                    ),
                    OutlineButton(
                      color: Colors.yellow,
                      borderSide: const BorderSide(
                        color: Colors.indigo, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 1.2, //width of the border
                      ),


                /*      onPressed: () {
                        currency_exchange();
                       // Api_Manager().getData(from.toString(), to.toString(), quantity.toString());

                       //fetchItem(from.toString(), to.toString(), quantity.toString());
                        Navigator.pop(context);
                        print("************${from.toString()}***********${to.toString()}*****************${quantity.toString()}");
                      },*/


                      onPressed:(){
                        print("************${from.toString()}***********${to.toString()}*****************${quantity.toString()}");
                        currency_exchange(from.toString(), to.toString(), quantity.toString());
                      },
                      child: const Text("CONVERT",
                      style: TextStyle(
                          color:Colors.indigo
                      ),
                      ),
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