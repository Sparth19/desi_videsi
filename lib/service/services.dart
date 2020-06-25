import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

Future<String> _loadCountryAsset() async {
  return await rootBundle.loadString('assets/country.json');
}

 Future loadCountry() async {
  //     final welcome = welcomeFromJson(jsonString);

  String jsonCountry = await _loadCountryAsset();
  final jsonResponse = json.decode(jsonCountry);
  print(jsonResponse);
  //country_model photosList = country_model.fromJson(jsonResponse);
    List datalist = jsonResponse.map((i) => Welcome.fromJson(i)).toList();
  print("inside service " + datalist[1].country);

  return datalist;
}
Future<String> _loadMasterAsset() async {
  return await rootBundle.loadString('assets/master.json');
}

Future loadMaster() async {
  //     final welcome = welcomeFromJson(jsonString);

  String jsonMaster = await _loadMasterAsset();
  final jsonResponse = json.decode(jsonMaster);
  print(jsonResponse);
  //country_model photosList = country_model.fromJson(jsonResponse);
  List datalist1 = jsonResponse.map((i) => MasterData.fromJson(i)).toList();
  print("inside service " + datalist1[0].company);

  return datalist1;
}
