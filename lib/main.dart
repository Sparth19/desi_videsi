import 'package:desividesi/pages/HomePage.dart';
import 'package:desividesi/pages/MainPage.dart';
import 'package:flutter/material.dart';

void main()=>runApp(Myapp());


class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Homepage(),
    );
  }
}
