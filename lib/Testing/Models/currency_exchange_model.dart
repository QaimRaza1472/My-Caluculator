// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

// String currencyToJson(Currency data) {
//   var abc = data.rates.gbp;
//   return json.encode(data.toJson());
// };

class Currency {
  Currency({
    this.baseCurrencyCode,
    this.baseCurrencyName,
    this.amount,
    this.updatedDate,
    this.rates,
    this.status,
  });

  String? baseCurrencyCode;
  String? baseCurrencyName;
  String? amount;
  DateTime? updatedDate;
  Rates? rates;
  String? status;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    baseCurrencyCode: json["base_currency_code"],
    baseCurrencyName: json["base_currency_name"],
    amount: json["amount"],
    updatedDate: DateTime.parse(json["updated_date"]),
    rates: Rates.fromJson(json["rates"]),
    status: json["status"],
  );

  // Map<String, dynamic> toJson() => {
  //   "base_currency_code": baseCurrencyCode,
  //   "base_currency_name": baseCurrencyName,
  //   "amount": amount,
  //   "updated_date": "${updatedDate!.year.toString().padLeft(4, '0')}-${updatedDate!.month.toString().padLeft(2, '0')}-${updatedDate!.day.toString().padLeft(2, '0')}",
  //   "rates": rates!.toJson(),
  //   "status": status,
  // };
}



class Rates {
  Rates({this.gbp,});
  Gbp? gbp;

  factory Rates.fromJson(Map<String, dynamic> json) {
    print("json.keys: ${json.keys.first}");
    return Rates(
      gbp: Gbp.fromJson(json[json.keys.first.toString()]),
    );
  }

  /*Map<String, dynamic> toJson(key) => {
    key: gbp!.toJson(),
  };*/
}


class Gbp {
  Gbp({
    this.currencyName,
    this.rate,
    this.rateForAmount,
  });
  String? currencyName;
  String? rate;
  String? rateForAmount;

  factory Gbp.fromJson(Map<String, dynamic> json) => Gbp(
    currencyName: json["currency_name"],
    rate: json["rate"],
    rateForAmount: json["rate_for_amount"],
  );

  Map<String, dynamic> toJson() => {
    "currency_name": currencyName,
    "rate": rate,
    "rate_for_amount": rateForAmount,
  };
}
