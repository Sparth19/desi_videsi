import 'package:desividesi/service/services.dart';
import 'package:desividesi/storage/mobile_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

//for(var i=0;i<10;i++)
/*array([['Austria', 'austria_flag'],
['Canada', 'canada_flag'],
['China', 'china_flag'],
['Denmark', 'denmark_flag'],
['Finland', 'finland_flag'],
['France', 'france_flag'],
['Germany', 'germany_flag'],
['Hong Kong', 'hong_kong_flag'],
['India', 'india_flag'],
['India & Austria', 'world_flag'],
['Italy', 'italy_flag'],
['Japan', 'japan_flag'],
['Netherlands', 'netherlands_flag'],
['Singapore', 'singapore_flag'],
['South Korea', 'south_korea_flag'],
['Spain', 'spain_flag'],
['Sri Lanka', 'sri_lanka_flag'],
['Sweden', 'sweden_flag'],
['Switzerland', 'switzerland_flag'],
['Taiwan', 'taiwan_flag'],
['UAE', 'uae_flag'],
['UK', 'uk_flag'],
['USA', 'usa_flag']], dtype=object);*/

class _MainPageState extends State<MainPage> {
  @override
  List _useData = new List();
  List _useMaster = new List();

/*
  country_list_making(){
    country_array.add(new Map());
  }
*/
  List<Map<String, String>> category_a = [
    {'mc_name': 'Automobiles', 'mc_url': 'automobiles'},
    {'mc_name': 'Baby Products', 'mc_url': 'baby_products'},
    {'mc_name': 'Bakery & Snacks', 'mc_url': 'bakery_snacks'},
    {'mc_name': 'Beauty & Hygiene', 'mc_url': 'beauty_hygiene'},
    {'mc_name': 'Cleaning & Household', 'mc_url': 'cleaning_household'},
    {'mc_name': 'Dairy & Ice Creams', 'mc_url': 'dairy_icecreams'},
    {'mc_name': 'Drinks & Beverages', 'mc_url': 'beverages'},
    {'mc_name': 'Electronics', 'mc_url': 'electronics'},
    {'mc_name': 'Fashion', 'mc_url': 'fashion'},
    {'mc_name': 'Foodgrains, Oil & Masala', 'mc_url': 'foodgrains_oil_masala'},
    {'mc_name': 'Frozen Foods', 'mc_url': 'frozen_food'},
    {'mc_name': 'Health Drinks & Supplements', 'mc_url': 'health_supplements'}
  ];

  List<Map<String, String>> country_a = [
    {'c_name': 'Austria', 'c_url': 'images/austria_flag.jpg'},
    {'c_name': 'Canada', 'c_url': 'images/canada_flag.jpg'},
    {'c_name': 'China', 'c_url': 'images/china_flag.jpg'},
    {'c_name': 'Denmark', 'c_url': 'images/denmark_flag.jpg'},
    {'c_name': 'Finland', 'c_url': 'images/finland_flag.jpg'},
    {'c_name': 'France', 'c_url': 'images/france_flag.jpg'},
    {'c_name': 'Germany', 'c_url': 'images/germany_flag.jpg'},
    {'c_name': 'Hong Kong', 'c_url': 'images/hong_kong_flag.jpg'},
    {'c_name': 'India', 'c_url': 'images/india_flag.jpg'},
    {'c_name': 'India & Austria', 'c_url': 'images/world_flag.jpg'},
    {'c_name': 'Italy', 'c_url': 'images/italy_flag.jpg'},
    {'c_name': 'Japan', 'c_url': 'images/japan_flag.jpg'},
    {'c_name': 'Netherlands', 'c_url': 'images/netherlands_flag.jpg'},
    {'c_name': 'Singapore', 'c_url': 'images/singapore_flag.jpg'},
    {'c_name': 'South Korea', 'c_url': 'images/south_korea_flag.jpg'},
    {'c_name': 'Spain', 'c_url': 'images/spain_flag.jpg'},
    {'c_name': 'Sri Lanka', 'c_url': 'images/sri_lanka_flag.jpg'},
    {'c_name': 'Sweden', 'c_url': 'images/sweden_flag.jpg'},
    {'c_name': 'Switzerland', 'c_url': 'images/switzerland_flag.jpg'},
    {'c_name': 'Taiwan', 'c_url': 'images/taiwan_flag.jpg'},
    {'c_name': 'UAE', 'c_url': 'images/uae_flag.jpg'},
    {'c_name': 'UK', 'c_url': 'images/uk_flag.jpg'},
    {'c_name': 'USA', 'c_url': 'images/usa_flag.jpg'}
  ];

  Future LoadData() async {
    loadCountry().then((Data) {
      setState(() {
        _useData = Data;
        print(_useData[1].country);
        //_UseList = useData;
        // print("p" + _UseList.length.toString());
      });
    });
    loadMaster().then((Data1) {
      setState(() {
        _useMaster = Data1;
        print(_useMaster[1].company);
        //_UseList = useData;
        // print("p" + _UseList.length.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    LoadData();
    // loadCountry();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: new AppBar(
          title: new Text("Desi Videsi"),
          centerTitle: true,
          elevation: 5,
        ),*/
        body: Column(
      children: <Widget>[
        Text("Swadesi - Aatma nirbhar Bharat"),
        Expanded(
          child: new ListView.builder(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              itemCount: category_a.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Text(category_a[index]["mc_name"]),
                      SizedBox(
                        height: 5,
                      ),
                      FutureBuilder(
                        future: _getImage(context,
                            "images/" + category_a[index]["mc_url"] + ".jpg"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done)
                            return Container(
                              height: 100,
                              width: 100,
                              child: snapshot.data,
                            );

                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Container(
                                height: 100,
                                width: 100,
                                child: Image.asset("assets/icon.jpg"));

                          return Container();
                        },
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    ));
  }

  Future<Widget> _getImage(BuildContext context, String image) async {
    Image m;
    await FireStorageService.loadFromStorage(context, image)
        .then((downloadUrl) {
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return m;
  }
}
