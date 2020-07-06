import 'package:desividesi/color/MyTheme.dart';
import 'package:desividesi/service/Data.dart';
import 'package:desividesi/service/models.dart';
import 'package:desividesi/storage/mobile_storage.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class Fragment extends StatefulWidget {
  Data data;

  Fragment({this.data});

  @override
  _FragmentState createState() => _FragmentState(data: data);
}

class _FragmentState extends State<Fragment> {
  Data data;

  _FragmentState({this.data});

  var title = "";

  @override
  Widget build(BuildContext context) {
//    data = ModalRoute.of(context).settings.arguments;
    print(data.flag);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            data.masterData.category1.toString(),
            style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w700),
          ),
        ),
        body: new Container(
          child: genrateView(),
        ));
  }

  Widget genrateView() {
    Widget widget;
    if (data.flag == 101) {
      List showData = new List();
      List<String> temp = new List();
      {
        for (MasterData x in data.masterDataList) {
          if (data.masterData.category1 == x.category1) {
            if (!temp.contains(x.category2)) {
              showData.add(x);
              temp.add(x.category2);
            }
          }
        }
      }
      widget = GridView.builder(
        padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
        itemCount: showData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              data.masterData = showData[index];
              data.flag = 103;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Fragment(data: data)));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Container(
                      child: showImage(
                          "images/" + showData[index].category2Pics + ".jpg"),
                      height: 130),
                  Container(
                    height: 20,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      showData[index].category2.toString(),
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 14,
                          letterSpacing: 1,
                          color: MyThemeColor.secondaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    } else if (data.flag == 102) {
      print("hello" + 102.toString());
      //comparison
      widget = compare_widget();
    } else if (data.flag == 103) {
      //noyt useful
      List compare1 = new List();
      List compare2 = new List();
      {
        List showData = new List();
        for (MasterData x in data.masterDataList) {
          if (data.masterData.category2 == x.category2) {
            showData.add(x);
          }
        }
        for (MasterData x in showData) {
//        if (x.mainCategory == mainCategoryValues.map[category_name]) {
          if (x.country == countryValues.map["India"]) {
            compare1.add(x);
          } else {
            compare2.add(x);
          }
        }
      }
      print("Length : " + compare2.length.toString());
      widget = Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12.0),
                  color: MyThemeColor.greenLightColor,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "Indian",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "RobotoMono",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  color: MyThemeColor.redLightColor,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "Foreign",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "RobotoMono",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: displayList1(compare1),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: displayList2(compare2),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      widget = Container();
    }

    return widget;
  }

  Future<Widget> _getImage(BuildContext context, String image) async {
    FadeInImage fm;
    await FireStorageService.loadFromStorage(context, image)
        .then((downloadUrl) {
      fm = FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: downloadUrl.toString(),
        fit: BoxFit.fill,
      );
    }).catchError((e) => {
              /*print(e.error)*/
            });
    return fm;
  }

  Widget compare_widget() {
    List compare1 = new List();
    List compare2 = new List();
    {
      List showData = new List();
      for (MasterData x in data.masterDataList) {
        if (data.masterData.category1 == x.category1) {
          showData.add(x);
        }
      }
      for (MasterData x in showData) {
//        if (x.mainCategory == mainCategoryValues.map[category_name]) {
        if (x.country == countryValues.map["India"]) {
          compare1.add(x);
        } else {
          compare2.add(x);
        }
      }
    }
    print("Length : " + compare2.length.toString());
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12.0),
              color: MyThemeColor.greenLightColor,
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                "Indian",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "RobotoMono",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              color: MyThemeColor.redLightColor,
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                "Foreign",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "RobotoMono",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: displayList1(compare1),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: displayList2(compare2),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget displayList1(List compare1) {
    print("in" + compare1.length.toString());
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: compare1.length,
        itemBuilder: (BuildContext context, int index) {
          var img_height = MediaQuery.of(context).size.width / 2 * (3 / 10) - 5;
          var card_img_width =
              MediaQuery.of(context).size.width / 2 * (3 / 10) - 5;
          var card_text_width =
              MediaQuery.of(context).size.width / 2 * (6 / 10) - 5;
          return Padding(
            padding: const EdgeInsets.all(1.5),
            child: Card(
                child: Row(
              children: <Widget>[
                Container(
                    color: MyThemeColor.textWhite,
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    width: card_img_width,
                    child: showImage(
                        "images/" + compare1[index].brandPics + ".jpg")),
                Expanded(
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: Container(
                      color: MyThemeColor.greenLightColor,
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              width: card_text_width,
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  compare1[index].brandName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
                              )),
                          Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              width: card_text_width,
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    compare1[index].category1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: 1),
                                  ))),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            width: card_text_width,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: card_text_width * (1 / 5) - 5,
                                  child: showImage("images/" +
                                      countryPicValues
                                          .reverse[compare1[index].countryPic] +
                                      ".jpg"),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  width: card_text_width * (4 / 5) - 5,
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        compare1[index].company,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            letterSpacing: 1),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          );
        });
  }

  Widget displayList2(List compare1) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: compare1.length,
        itemBuilder: (BuildContext context, int index) {
          var img_height = MediaQuery.of(context).size.width / 2 * (3 / 10) - 5;
          var card_img_width =
              MediaQuery.of(context).size.width / 2 * (3 / 10) - 5;
          var card_text_width =
              MediaQuery.of(context).size.width / 2 * (6 / 10) - 5;
          return Padding(
            padding: const EdgeInsets.all(1.5),
            child: Card(
                child: Row(
              children: <Widget>[
                Container(
                    color: MyThemeColor.textWhite,
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    width: card_img_width,
                    child: showImage(
                        "images/" + compare1[index].brandPics + ".jpg")),
                Expanded(
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: Container(
                      color: MyThemeColor.redLightColor,
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              width: card_text_width,
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  compare1[index].brandName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
                              )),
                          Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              width: card_text_width,
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    compare1[index].category1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: 1),
                                  ))),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            width: card_text_width,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: card_text_width * (1 / 5) - 5,
                                  child: showImage("images/" +
                                      countryPicValues
                                          .reverse[compare1[index].countryPic] +
                                      ".jpg"),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  width: card_text_width * (4 / 5) - 5,
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        compare1[index].company,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            letterSpacing: 1),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          );
        });
  }

  Widget showImage(String index) {
    print(index);
    return FutureBuilder(
      future: _getImage(context, index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Container(
            child: snapshot.data,
          );

        if (snapshot.connectionState == ConnectionState.waiting)
          return Container(child: Image.asset("assets/icon.jpg"));

        return Container();
      },
    );
  }
}
