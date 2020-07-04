import 'package:desividesi/color/MyTheme.dart';
import 'package:desividesi/pages/Fragment.dart';
import 'package:desividesi/pages/HomePage.dart';
import 'package:desividesi/service/Data.dart';
import 'package:desividesi/service/models.dart';
import 'package:desividesi/storage/mobile_storage.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryPageOne extends StatefulWidget {
  @override
  _CategoryPageOneState createState() => _CategoryPageOneState();
}

List x;
List showData;
Data data;

List getCategoryData(category_name) {
  x = new List();
  showData = new List();
  List categoryData = x;
  {
    List<String> temp = new List();
    for (MasterData x in Homepage.useMaster) {
      if (x.mainCategory == mainCategoryValues.map[category_name]) {
        print("name" + category_name);
        categoryData.add(x);
        if (!temp.contains(x.category1)) {
          showData.add(x);
          temp.add(x.category1);
        }
      }
    }
  }
  print("Length : " + categoryData.length.toString());
  return categoryData;
}

class _CategoryPageOneState extends State<CategoryPageOne> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 100) / 2;
    final double itemWidth = size.width / 2;
    String check = ModalRoute.of(context).settings.arguments;
    x = getCategoryData(check);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            check.toUpperCase().toString(),
            style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          child: create_Category_List(context, itemWidth, itemHeight),
        ));
  }

  Widget create_Category_List(context, itemWidth, itemHeight) {
    return GridView.builder(
      padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
      itemCount: showData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              if (isCategoryNext(showData[index].category1)) {
//                print("Data Flag1 " + data.flag.toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Fragment(data: data)));
              } else {
                data.flag = 102;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Fragment(data: data)));
              }
            },
            child: Card(
                child: Column(
              children: <Widget>[
                Container(
                    child: showImage(
                        "images/" + showData[index].category1Pics + ".jpg"),
                    height: 130),
                Container(
                  height: 20,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    showData[index].category1.toString(),
                    style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 14,
                        letterSpacing: 1,
                        color: MyThemeColor.secondaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )));
      },
    );
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

  bool isCategoryNext(nextCategory) {
    data = new Data();
    data.masterDataList = x;
    for (MasterData temp in showData) {
      if (temp.category1 == nextCategory) {
        data.masterData = temp;
        if (temp.category2.isNotEmpty) {
          data.flag = 101;
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }
}
