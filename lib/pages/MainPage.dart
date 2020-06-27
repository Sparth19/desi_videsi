import 'package:desividesi/color/light_color.dart';
import 'package:desividesi/service/models.dart';
import 'package:desividesi/service/services.dart';
import 'package:desividesi/storage/mobile_storage.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
List<String> image = [
  'images/a_milk.jpg',
  'images/a_milk.jpg',
  'images/a_milk.jpg'
];
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
  List<Map<String,String>> country_array=new List<Map<String,String>>();

/*
  country_list_making(){
    country_array.add(new Map());
  }
*/
  List<Map<String, String>> country_a =
  [{'c_name': 'Austria', 'c_url': 'austria_flag'},
  {'c_name': 'Canada', 'c_url': 'canada_flag'},
  {'c_name': 'China', 'c_url': 'china_flag'},
  {'c_name': 'Denmark', 'c_url': 'denmark_flag'},
  {'c_name': 'Finland', 'c_url': 'finland_flag'},
  {'c_name': 'France', 'c_url': 'france_flag'},
  {'c_name': 'Germany', 'c_url': 'germany_flag'},
  {'c_name': 'Hong Kong', 'c_url': 'hong_kong_flag'},
  {'c_name': 'India', 'c_url': 'india_flag'},
  {'c_name': 'India & Austria', 'c_url': 'world_flag'},
  {'c_name': 'Italy', 'c_url': 'italy_flag'},
  {'c_name': 'Japan', 'c_url': 'japan_flag'},
  {'c_name': 'Netherlands', 'c_url': 'netherlands_flag'},
  {'c_name': 'Singapore', 'c_url': 'singapore_flag'},
  {'c_name': 'South Korea', 'c_url': 'south_korea_flag'},
  {'c_name': 'Spain', 'c_url': 'spain_flag'},
  {'c_name': 'Sri Lanka', 'c_url': 'sri_lanka_flag'},
  {'c_name': 'Sweden', 'c_url': 'sweden_flag'},
  {'c_name': 'Switzerland', 'c_url': 'switzerland_flag'},
  {'c_name': 'Taiwan', 'c_url': 'taiwan_flag'},
  {'c_name': 'UAE', 'c_url': 'uae_flag'},
  {'c_name': 'UK', 'c_url': 'uk_flag'},
  {'c_name': 'USA', 'c_url': 'usa_flag'}];

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
        appBar: new AppBar(
          title: new Text("Desi Videsi"),
          centerTitle: true,
          elevation: 5,
        ),
        body: Container(
          child: new ListView.builder(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              itemCount: country_a.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                 child: Text(country_a[index]["c_name"]),
                );
              }),
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
