import 'package:desividesi/color/MyTheme.dart';
import 'package:desividesi/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Raleway',
          primaryColor: MyThemeColor.primaryColor,
          primaryColorDark: MyThemeColor.primaryDarkColor,
          primaryColorLight: MyThemeColor.primaryLightColor,
          secondaryHeaderColor: MyThemeColor.secondaryColor,
          accentColor: MyThemeColor.secondaryColor),
      home: Homepage(),
    );
  }
}
