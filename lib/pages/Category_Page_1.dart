import 'package:desividesi/color/MyTheme.dart';
import 'package:desividesi/pages/HomePage.dart';
import 'package:desividesi/service/models.dart';
import 'package:flutter/material.dart';

class CategoryPageOne extends StatefulWidget {
  @override
  _CategoryPageOneState createState() => _CategoryPageOneState();
}

List getCategoryData(category_name) {
  List CategoryData = new List();
  for (MasterData x in Homepage.useMaster) {
//      print(x.mainCategory);
//      print(mainCategoryValues.map[category_name]);
    if (x.mainCategory == mainCategoryValues.map[category_name]) {
      print("name" + category_name);
      CategoryData.add(x);
    }
  }
  print("Length : " + CategoryData.length.toString());
  return CategoryData;
}

class _CategoryPageOneState extends State<CategoryPageOne> {
  @override
  Widget build(BuildContext context) {
    String check = ModalRoute.of(context).settings.arguments;
    List x = getCategoryData(check);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            check.toUpperCase().toString(),
            style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w700),
          ),
        ),
        body: Text(
          x.length.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: MyThemeColor.primaryTextColor),
        ));
  }
}
