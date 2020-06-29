import 'package:desividesi/pages/HomePage.dart';
import 'package:desividesi/service/models.dart';
import 'package:flutter/material.dart';

class CategoryPageOne extends StatefulWidget {
  @override
  _CategoryPageOneState createState() => _CategoryPageOneState();
}

List x = new List();
List showData = new List();

List getCategoryData(category_name) {
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: create_Category_List(),
              ),
            )
          ],
        ));
  }

  Widget create_Category_List() {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(showData.length, (int index) {
          return InkWell(
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width / 2,
              child: Text("TExt"),
            ),
          );
        }));
    /*return new ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        itemCount: showData.length,
        itemBuilder: (BuildContext context, int index) {

        });*/
  }
}
