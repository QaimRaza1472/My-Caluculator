
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'curr.dart';

class CurrModel extends ChangeNotifier {
  List<Curr>? currList =[];
  List<String>? cName, cPrice;

  fetchItem(String from, String to, String quantity) async {

   String  api_key ='fdb22cd1905d7f1181acafc527ea8b66105bb35a';

    //String apiurl = 'https://api.exchangeratesapi.io/latest?base=$from';

    //https://api.exchangeratesapi.io/latest?base=$fromCurrency&symbols=$toCurrency

    //String apiurl = 'https://api.exchangeratesapi.io/latest?base=$from&symbols=$to';

    //http.Response response = await http.get(Uri.parse(apiurl));


   /// ok String apiurl = 'https://api.getgeoapi.com/v2/currency/convert?api_key=fdb22cd1905d7f1181acafc527ea8b66105bb35a&from=EUR&to=GBP&amount=10&format=json';

   String apiurl = 'https://api.getgeoapi.com/v2/currency/convert?api_key=fdb22cd1905d7f1181acafc527ea8b66105bb35a&from=${from}&to=${to}&amount=${quantity}&format=json';

   var response = await http.get(Uri.parse(apiurl),);

    print('----------------------${response.body}');

    var data = json.decode(response.body);

   print('--------   Data  --------------${data}');

    //var curr = data["rates"];

   var curr=data['base_currency_code'];

   print('--------   curr  --------------${curr}');

    curr((key, value) {
      if (to == key.toString() &&
          !currList!.contains(Curr(key, from.toString(), value, quantity))) {
        currList!.add(
            Curr(key, from.toString(), value, quantity)
        );
      }
    }
    );
    notifyListeners();
  }
  clearItem() {
    currList = [];
  }
}
