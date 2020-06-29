import 'package:auto_size_text/auto_size_text.dart';
import 'package:desividesi/color/MyTheme.dart';
import 'package:desividesi/pages/Category_Page_1.dart';
import 'package:desividesi/service/services.dart';
import 'package:desividesi/storage/mobile_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Homepage extends StatefulWidget {
  static List useData = new List();
  static List useMaster = new List();

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

  get editingController => null;

  set useMaster(useMaster) {
    Homepage.useMaster = useMaster;
  }

  set useData(useData) {
    Homepage.useData = useData;
  }

  Future LoadData() async {
    loadCountry().then((Data) {
      setState(() {
        useData = Data;
      });
    });
    loadMaster().then((Data1) {
      setState(() {
        useMaster = Data1;
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
          //height: 8 * MediaQuery.of(context).size.width / 5,
          height: 450,
          child: Stack(
            children: <Widget>[
              Container(
                height: 4 * MediaQuery.of(context).size.width / 5,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyThemeColor.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                /* child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                  ],
                ),*/
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.width / 8),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 5),
                        child: Text(
                          "Swadesi",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: MyThemeColor.primaryTextColor),
                        ),
                      ),
                      //butoon goes here
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    child: Text(
                      "#vocalforlocal",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextField(
                        onChanged: (value) {},
                        controller: editingController,
                        cursorColor: MyThemeColor.secondaryColor,
                        decoration: InputDecoration(
//                        labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                        )),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 2.5 * MediaQuery.of(context).size.width / 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 15, 5, 0),
                      child: Text(
                        "Categories".toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 16,
                            letterSpacing: 1,
                            color: MyThemeColor.secondaryDarkColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      height: 190,
                      child: category_list(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 5, 5),
          child: Text(
            "Country".toUpperCase(),
            style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 16,
                letterSpacing: 1,
                color: MyThemeColor.secondaryDarkColor,
                fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomLeft,
            height: MediaQuery.of(context).size.height,
            child: country_list(),
          ),
        ),
      ],
    ));
  }

  Widget country_list() {
    return new ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        itemCount: country_a.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 80,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  c_name_card(index),
                  c_image_card(index),
                ],
              ));
        });
  }

  Widget category_list() {
    return new ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        itemCount: category_a.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryPageOne(),
                      settings: RouteSettings(
                          arguments: category_a[index]["mc_name"])));
            },
            child: Container(
                height: 130,
                margin: const EdgeInsets.only(right: 10.0),
                width: MediaQuery.of(context).size.width / 3,
                child: Stack(
                  children: <Widget>[
                    name_card(index),
                    image_card(index),
                  ],
                )),
          );
        });
  }

  Widget name_card(int index) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width / 2 - 25,
      child: Card(
          color: MyThemeColor.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 12.0, left: 8.0, right: 8.0),
              child: AutoSizeText(
                category_a[index]["mc_name"],
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 14,
                    letterSpacing: 1,
                    color: MyThemeColor.textWhite,
                    fontWeight: FontWeight.w600),
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
            child: showImage("images/" + category_a[index]["mc_url"] + ".jpg"),
          ),
        ),
      ),
    );
  }

  Widget c_name_card(int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyThemeColor.secondaryDarkColor,
              MyThemeColor.secondaryColor,
              MyThemeColor.secondaryLightColor
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30.0)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          country_a[index]["c_name"],
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            letterSpacing: 2,
            color: MyThemeColor.textWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget c_image_card(int index) {
    return Align(
        alignment: Alignment.centerRight,
        child: FractionallySizedBox(
          widthFactor: 0.2,
          heightFactor: 1,
          child: Container(
            margin: EdgeInsets.only(bottom: 0.0, top: 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: showImage(country_a[index]["c_url"]),
            ),
          ),
        ));
  }

  Widget showImage(String index) {
    return FutureBuilder(
      future: _getImage(context, index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Container(
            height: 100,
            width: 100,
            child: snapshot.data,
          );

        if (snapshot.connectionState == ConnectionState.waiting)
          return Container(
              height: 50, width: 50, child: CircularProgressIndicator());

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
        fit: BoxFit.cover,
      );
    });
    return fm;
  }
}
