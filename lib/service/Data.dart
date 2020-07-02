import 'package:desividesi/service/models.dart';

class Data {
  int flag = 404;
  List masterDataList = new List();
  List countryDataList = new List();
  MasterData masterData = new MasterData();
  Welcome countryData = new Welcome();

  // ignore: non_constant_identifier_names
  int len_masterList() {
    return masterDataList.length;
  }

  // ignore: non_constant_identifier_names
  int len_countryList() {
    return countryDataList.length;
  }
}
