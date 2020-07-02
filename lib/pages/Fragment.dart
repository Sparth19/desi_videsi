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

  @override
  Widget build(BuildContext context) {
//    data = ModalRoute.of(context).settings.arguments;
    print(data.flag);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Parth Roy",
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
                      height: 150),
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
    } else {
      widget = Container();
    }

    return widget;
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
}
