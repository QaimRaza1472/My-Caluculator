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
              //"https://api.getgeoapi.com/v2/currency/convert?api_key=fdb22cd1905d7f1181acafc527ea8b66105bb35a&from=EUR&to=GBP&amount=10&format=json",
            //  apiurl

              'https://api.getgeoapi.com/v2/currency/convert?api_key=fdb22cd1905d7f1181acafc527ea8b66105bb35a&from=${from}&to=${to}&amount=${quantity}&format=json'
          ));
      print("*****************************");
      print(response.body);
      print("*****************************");
      var responseString = response.body;
      var responseMap    = json.decode(responseString);
      print("------------------- Response Map --------------------- ${responseMap}");
      cocktailModel = Currency.fromJson(responseMap);
      print("------------------- CockTail Model ---------------------");
      print(cocktailModel);
      print("------------------- CockTail Model ---------------------");
    }
    catch (Exception){
      print("----------- Exception -----------------");
      return cocktailModel;
    }

    return cocktailModel;
  }

}

