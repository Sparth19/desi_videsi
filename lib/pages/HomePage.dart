import 'package:desividesi/service/services.dart';
import 'package:desividesi/storage/mobile_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:desividesi/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List _useData = new List();
  List _useMaster = new List();

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
      });
    });
    loadMaster().then((Data1) {
      setState(() {
        _useMaster = Data1;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Color(0x8090ee90),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,16,16,5),
                    child: Text(
                      "Swadesi",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: LightColor.lightBlue),
                    ),
                  ),
                  //butoon goes here
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: Text(
                  "#vocalforlocal",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0,5,5,5),
          child: Text("Categories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: LightColor.lightBlue),),
        ),
        Container(
          height: 190,
          child: category_list(),
        ),

        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0,5,5,5),
          child: Text("Categories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: LightColor.lightBlue),),
        ),
        Container(
          height: 190,
          child: category_list(),
        ),




      ],
    ));
  }

  Widget category_list() {
    return new ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        itemCount: category_a.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 130,
              margin: const EdgeInsets.only(right: 10.0),
              width: MediaQuery.of(context).size.width / 2 - 10,
              child: Stack(
                children: <Widget>[
                  name_card(index),
                  image_card(index),
                ],
              ));
        });
  }

  Widget name_card(int index) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width / 2 - 25,
      child: Card(
          color: LightColor.seeBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category_a[index]["mc_name"],
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16,
                    color: LightColor.lightBlue,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )),
    );
  }

  Widget image_card(int index) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 40,
        height: 110,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: showImage(index),
          ),
        ),
      ),
    );
  }

  Widget showImage(int index) {
    return FutureBuilder(
      future:
          _getImage(context, "images/" + category_a[index]["mc_url"] + ".jpg"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Container(
            height: 100,
            width: 100,
            child: snapshot.data,
          );

      /*  if (snapshot.connectionState == ConnectionState.waiting)
          return Container(
              height: 100, width: 100, child: CircularProgressIndicator());*/

        return Container();
      },
    );
  }

  Future<Widget> _getImage(BuildContext context, String image) async {
    FadeInImage fm;
    await FireStorageService.loadFromStorage(context, image)
        .then((downloadUrl) {
      fm = FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return fm;
  }
}
