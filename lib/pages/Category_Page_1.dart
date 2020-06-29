import 'package:desividesi/pages/HomePage.dart';
import 'package:desividesi/service/models.dart';
import 'package:flutter/material.dart';

class CategoryPageOne extends StatefulWidget {
  @override
  _CategoryPageOneState createState() => _CategoryPageOneState();
}

class _CategoryPageOneState extends State<CategoryPageOne> {
  final mainCategoryValues = EnumValues({
    "Automobiles": MainCategory.AUTOMOBILES,
    "Baby Products": MainCategory.BABY_PRODUCTS,
    "Bakery & Snacks": MainCategory.BAKERY_SNACKS,
    "Beauty & Hygiene": MainCategory.BEAUTY_HYGIENE,
    "Cleaning & Household": MainCategory.CLEANING_HOUSEHOLD,
    "Dairy & Ice Creams": MainCategory.DAIRY_ICE_CREAMS,
    "Drinks & Beverages": MainCategory.DRINKS_BEVERAGES,
    "Electronics": MainCategory.ELECTRONICS,
    "Fashion": MainCategory.FASHION,
    "Foodgrains, Oil & Masala": MainCategory.FOODGRAINS_OIL_MASALA,
    "Frozen Foods": MainCategory.FROZEN_FOODS,
    "Health Drinks & Supplements": MainCategory.HEALTH_DRINKS_SUPPLEMENTS
  });

  @override
  Widget build(BuildContext context) {
    String check = ModalRoute.of(context).settings.arguments;
    List x = getCategoryData(check);

    return Scaffold(
      body: Text(x.length.toString()),
    );
  }

  List getCategoryData(category_name) {
    List _CategoryData=new List();
    for(MasterData x in Homepage.useMaster){
//      print("First:"+MainCategory.values[category_name.toString()]);
      print("name"+category_name);
      if(x.mainCategory == category_name){
        _CategoryData.add(x);
      }
    }
    return _CategoryData;
  }
}
