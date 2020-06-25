import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models.dart';

class Services {
  static const String url =
      "https://us-central1-desi-pardesi.cloudfunctions.net/FUN/getAllData";

  static Future getDetails(http.Client client) async {
    final response = await client.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      List<FetchData> list = parseDetails(response.body);
      return list;
    } else {
      throw Exception("Error");
    }
  }

  static List<FetchData> parseDetails(String responseBody) {
    //final parsed = json.decode(responseBody);
   final parsed = json.decode(responseBody);//.cast<String,dynamic>();
    print(parsed);
    //var list = parsed['Country'] as List;
    //print(list);
    List<FetchData> datalist = parsed.map((i) => FetchData.fromJson(i)).toList();
    List<FetchData> output = new List();

    //print(datalist);

    return datalist;
  }
}
