import 'dart:convert';

FetchData fetchDataFromJson(String str) => FetchData.fromJson(json.decode(str));

String fetchDataToJson(FetchData data) => json.encode(data.toJson());

class FetchData {
  FetchData({
    this.country,
    this.master,
  });

  Map<String, Country> country;
  Map<String, Master> master;

  factory FetchData.fromJson(Map<String, dynamic> json) => FetchData(
    country: Map.from(json["Country"]).map((k, v) => MapEntry<String, Country>(k, Country.fromJson(v))),
    master: Map.from(json["Master"]).map((k, v) => MapEntry<String, Master>(k, Master.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "Country": Map.from(country).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "Master": Map.from(master).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Country {
  Country({
    this.country,
    this.countryPic,
    this.company,
    this.companyPic,
  });

  String country;
  String countryPic;
  String company;
  String companyPic;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    country: json["Country"],
    countryPic: json["Country Pic"],
    company: json["Company"],
    companyPic: json["Company Pic"],
  );

  Map<String, dynamic> toJson() => {
    "Country": country,
    "Country Pic": countryPic,
    "Company": company,
    "Company Pic": companyPic,
  };
}

class Master {
  Master({
    this.category1,
    this.category1Pics,
    this.country,
    this.brandPics,
    this.mainCategoryPics,
    this.shareholding,
    this.category2Pics,
    this.countryPic,
    this.category2,
    this.companyPic,
    this.madeIn,
    this.company,
    this.rank,
    this.mainCategory,
    this.brandName,
    this.id,
  });

  String category1;
  String category1Pics;
  String country;
  String brandPics;
  String mainCategoryPics;
  String shareholding;
  String category2Pics;
  String countryPic;
  String category2;
  String companyPic;
  String madeIn;
  String company;
  int rank;
  String mainCategory;
  String brandName;
  int id;

  factory Master.fromJson(Map<String, dynamic> json) => Master(
    category1: json["Category 1"],
    category1Pics: json["CATEGORY 1 PICS"],
    country: json["Country"],
    brandPics: json["BRAND PICS"],
    mainCategoryPics: json["Main Category pics"],
    shareholding: json["Shareholding"],
    category2Pics: json["CATEGORY 2 PICS"],
    countryPic: json["Country Pic"],
    category2: json["Category 2"],
    companyPic: json["Company Pic"],
    madeIn: json["Made in"],
    company: json["Company"],
    rank: json["rank"],
    mainCategory: json["Main Category"],
    brandName: json["Brand Name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "Category 1": category1,
    "CATEGORY 1 PICS": category1Pics,
    "Country": country,
    "BRAND PICS": brandPics,
    "Main Category pics": mainCategoryPics,
    "Shareholding": shareholding,
    "CATEGORY 2 PICS": category2Pics,
    "Country Pic": countryPic,
    "Category 2": category2,
    "Company Pic": companyPic,
    "Made in": madeIn,
    "Company": company,
    "rank": rank,
    "Main Category": mainCategory,
    "Brand Name": brandName,
    "id": id,
  };
}