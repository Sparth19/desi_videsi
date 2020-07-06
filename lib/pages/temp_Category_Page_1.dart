import 'package:desividesi/color/MyTheme.dart';
import 'package:desividesi/pages/HomePage.dart';
import 'package:desividesi/service/models.dart';
import 'package:desividesi/storage/mobile_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TempCategoryPageOne extends StatefulWidget {
  @override
  _TempCategoryPageOneState createState() => _TempCategoryPageOneState();
}

List x;
List showData;

List getCategoryData(categoryName) {
  x = new List();
  showData = new List();
  List categoryData = x;
  List<String> temp = new List();
  for (MasterData x in Homepage.useMaster) {
//      print(x.mainCategory);
//      print(mainCategoryValues.map[category_name]);
    if (x.mainCategory == mainCategoryValues.map[categoryName]) {
      print("name" + categoryName);
      categoryData.add(x);
      if (!temp.contains(x.category1)) {
        showData.add(x);
        temp.add(x.category1);
      }
    }
  }
  print("Length : " + categoryData.length.toString());
  return categoryData;
}

class _TempCategoryPageOneState extends State<TempCategoryPageOne> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
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
        return Card(
            child: Column(
          children: <Widget>[
            Container(
                child: showImage(
                    "images/" + showData[index].category1Pics + ".jpg"),
                height: 150),
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

//            Text(wonders[index].country),
          ],
        ));
      },
    ); //    return ListView.builder(
//      itemCount: showData.length,
//      itemBuilder: _getListItemUI,
//      padding: EdgeInsets.all(0.0),
//    );
  }

  Widget showImage(String index) {
    print(index);
    return FutureBuilder(
      future: _getImage(context, index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Container(
//            height: 100,
//            width: 100,
//            height: MediaQuery.of(context).size.height * 0.4,
            child: snapshot.data,
          );

        if (snapshot.connectionState == ConnectionState.waiting)
          return Container(
              height: 50, width: 50, child: Image.asset("assets/icon.jpg"));

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

  _showSnackBar(BuildContext context, MasterData item) {
    final SnackBar objSnackbar = new SnackBar(
      content: new Text("${item.category1} is a city in ${item.country}"),
      backgroundColor: Colors.amber,
    );

    Scaffold.of(context).showSnackBar(objSnackbar);
  }
}
