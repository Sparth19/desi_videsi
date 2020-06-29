import 'package:desividesi/pages/HomePage.dart';
import 'package:desividesi/service/models.dart';
import 'package:flutter/material.dart';

class CountryPageOne extends StatefulWidget {
  @override
  _CountryPageOneState createState() => _CountryPageOneState();
}

List x = new List();
List showData = new List();

List getCountryData(country_name) {
  List countryData = x;
  List<String> temp = new List();
  for (Welcome x in Homepage.useData) {
    //print(x.country);
//      print(mainCategoryValues.map[category_name]);
    if (x.country == country_name) {
      print("name" + country_name);
      countryData.add(x);
      if (!temp.contains(x.company)) {
        showData.add(x);
        temp.add(x.company);
      }
    }
  }
  print("Length : " + countryData.length.toString());
  return countryData;
}

class _CountryPageOneState extends State<CountryPageOne> {
  @override
  Widget build(BuildContext context) {
    String check = ModalRoute.of(context).settings.arguments;
    print("Check:" + check);
    x = getCountryData(check);

    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              _requestPop();
            },
          ),
          title: Text(
            check.toUpperCase().toString(),
            style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: create_Country_List(),
              ),
            )
          ],
        ));
  }

  Widget create_Country_List() {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(showData.length, (int index) {
          return InkWell(
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width / 2,
              child: Text(showData[index].company),
            ),
          );
        }));
    /*return new ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        itemCount: showData.length,
        itemBuilder: (BuildContext context, int index) {

        });*/
  }

   _requestPop() {
    showData.clear();
    Navigator.of(context).pop(true);
  }
}
