import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/currency_exchange_model.dart';


class Api_Manager{

  Future<Currency> getData(String from, String to, String quantity) async {
    var client = http.Client();
    var cocktailModel = null;

  //  String apiurl = 'https://api.getgeoapi.com/v2/currency/convert?api_key=fdb22cd1905d7f1181acafc527ea8b66105bb35a&from=$from&to=$to&amount=$quantity&format=json';
    try{
      var response = await client.get(
          Uri.parse(
            //  "https://api.getgeoapi.com/v2/currency/convert?api_key=fdb22cd1905d7f1181acafc527ea8b66105bb35a&from=EUR&to=GBP&amount=10&format=json",
            //  apiurl

              'http://api.getgeoapi.com/v2/currency/convert?api_key=fdb22cd1905d7f1181acafc527ea8b66105bb35a&from=$from&to=$to&amount=$quantity&format=json'
          ));
      print("*****************************");
      print(response.body);
      print("*****************************");

      var responseString = response.body;
      var responseMap    = json.decode(responseString);

      print("------------------- Response Map --------------------- ${responseMap}");

      //cocktailModel = Currency.fromJson(responseMap);
      //responseMap["currency"]=to;

      print("------------------- Response Map 1--------------------- ${responseMap}");
      /*
      *
      * {"base_currency_code":"GBP","base_currency_name":"Pound sterling","amount":"12.0000","updated_date":"2022-05-10","rates":{"RON":{"currency_name":"Romanian leu","rate":"5.7705","rate_for_amount":"69.2462"}},"status":"success"}
      * */
      cocktailModel = Currency.fromJson(responseMap);


      print("------------------- CockTail Model ---------------------");
      print(cocktailModel);
      print("------------------- CockTail Model ---------------------");


    }
    catch (Exception){
      print("----------- Exception ----------------- ${Exception}");
      return cocktailModel;
    }
    return cocktailModel;
  }

}

