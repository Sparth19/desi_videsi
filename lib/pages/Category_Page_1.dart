import 'package:desividesi/color/MyTheme.dart';
import 'package:desividesi/pages/HomePage.dart';
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

List getCategoryData(category_name) {
  x = new List();
  showData = new List();
  List categoryData = x;
  List<String> temp = new List();
  for (MasterData x in Homepage.useMaster) {
//      print(x.mainCategory);
//      print(mainCategoryValues.map[category_name]);
    if (x.mainCategory == mainCategoryValues.map[category_name]) {
      print("name" + category_name);
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

class _CategoryPageOneState extends State<CategoryPageOne> {
  @override
  Widget build(BuildContext context) {
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
          child: create_Category_List(context),
        ));
  }

  Widget create_Category_List(context) {
    return GridView.builder(

      itemCount: showData.length,
      padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Container(

            padding: EdgeInsets.all(0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: showImage("images/" +
                              showData[index].category1Pics +
                              ".jpg"),
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                           // color: MyThemeColor.secondaryColor,
                            child: Text(
                              showData[index].category1.toString(),
                              style: TextStyle(
                                  fontFamily: 'RobotoMono',
                                  fontSize: 14,
                                  letterSpacing: 1,
                                  color: MyThemeColor.secondaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ))),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
    );
  }

  Widget showImage(String index) {
    print(index);
    return FutureBuilder(
      future: _getImage(context, index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Container(
            height: 100,
            width: 100,
//            height: MediaQuery.of(context).size.height * 0.4,
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
