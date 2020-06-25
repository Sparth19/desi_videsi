import 'package:desividesi/color/light_color.dart';
import 'package:desividesi/service/models.dart';
import 'package:desividesi/service/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override


  List<FetchData> useData = new List<FetchData>();
  List<FetchData> _UseList = new List<FetchData>();

  Future LoadData() async {
    Services.getDetails(http.Client()).then((Data) {
      setState(() {
        useData.addAll(Data);
        _UseList = useData;
        // print("p" + _UseList.length.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
      title: new Text("Desi Videsi"),
      centerTitle: true,
      elevation: 5,
    ),
      body: new ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        itemCount: _UseList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              elevation: 5,
              child: InkWell(
                onTap: () {
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullProfile(),
                          settings:
                          RouteSettings(arguments: _UseList[index])));*/
                },
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text("Data here")
                      /*_courceInfo(_UseList[index], _decorationContainerA(),
                          background: LightColor.lightOrange)*/
                    ],
                  ),
                ),
              ));
        },
      ));






  }
}
