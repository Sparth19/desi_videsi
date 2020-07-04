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
            onTap: () {},
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
    } else {
      //noyt useful
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
    return Row(
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
    );
  }

  Widget displayList1(List compare1) {
    print("in" + compare1.length.toString());
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: compare1.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: Row(
              children: <Widget>[
                Container(
                    height: 80,
                    width: 80,
                    child: showImage(
                        "images/" + compare1[index].brandPics + ".jpg")),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(compare1[index].brandName),
                      Text(compare1[index].category1),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 20,
                            child: showImage(
                                "images/" + countryPicValues.reverse[compare1[index].countryPic] + ".jpg"),
                          ),
                          Text(compare1[index].company)
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            )),
          );
        });
  }

  Widget displayList2(List compare2) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: compare2.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(child: Text(compare2[index].brandName.toString()));
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
          return Container(
              height: 50, width: 50, child: CircularProgressIndicator());

        return Container();
      },
    );
  }
}
