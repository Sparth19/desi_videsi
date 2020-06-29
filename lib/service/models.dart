import 'dart:convert';

/*class country_model {
  String country;
  String company;
  String countryPic;
  String companyPic;

  country_model({this.country, this.company, this.countryPic, this.companyPic});

  country_model.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    company = json['Company'];
    countryPic = json['Country Pic'];
    companyPic = json['Company Pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Country'] = this.country;
    data['Company'] = this.company;
    data['Country Pic'] = this.countryPic;
    data['Company Pic'] = this.companyPic;
    return data;
  }
}*/

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    this.country,
    this.company,
    this.countryPic,
    this.companyPic,
  });

  String country;
  String company;
  String countryPic;
  String companyPic;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        country: json["Country"],
        company: json["Company"],
        countryPic: json["Country Pic"],
        companyPic: json["Company Pic"],
      );

  Map<String, dynamic> toJson() => {
        "Country": country,
        "Company": company,
        "Country Pic": countryPic,
        "Company Pic": companyPic,
      };
}
// To parse this JSON data, do
//
//     final masterData = masterDataFromJson(jsonString);

List<MasterData> masterDataFromJson(String str) =>
    List<MasterData>.from(json.decode(str).map((x) => MasterData.fromJson(x)));

String masterDataToJson(List<MasterData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MasterData {
  MasterData({
    this.id,
    this.mainCategory,
    this.category1,
    this.category2,
    this.brandName,
    this.company,
    this.madeIn,
    this.shareholding,
    this.country,
    this.rank,
    this.brandPics,
    this.countryPic,
    this.mainCategoryPics,
    this.category1Pics,
    this.category2Pics,
    this.companyPic,
  });

  int id;
  MainCategory mainCategory;
  String category1;
  String category2;
  String brandName;
  String company;
  MadeIn madeIn;
  String shareholding;
  Country country;
  int rank;
  String brandPics;
  CountryPic countryPic;
  MainCategoryPics mainCategoryPics;
  String category1Pics;
  String category2Pics;
  String companyPic;

  factory MasterData.fromJson(Map<String, dynamic> json) => MasterData(
        id: json["id"],
        mainCategory: mainCategoryValues.map[json["Main Category"]],
        category1: json["Category 1"],
        category2: json["Category 2"],
        brandName: json["Brand Name"],
        company: json["Company"],
        madeIn: madeInValues.map[json["Made in"]],
        shareholding: json["Shareholding"],
        country: countryValues.map[json["Country"]],
        rank: json["rank"],
        brandPics: json["BRAND PICS"],
        countryPic: countryPicValues.map[json["Country Pic"]],
        mainCategoryPics:
            mainCategoryPicsValues.map[json["Main Category pics"]],
        category1Pics: json["CATEGORY 1 PICS"],
        category2Pics: json["CATEGORY 2 PICS"],
        companyPic: json["Company Pic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Main Category": mainCategoryValues.reverse[mainCategory],
        "Category 1": category1,
        "Category 2": category2,
        "Brand Name": brandName,
        "Company": company,
        "Made in": madeInValues.reverse[madeIn],
        "Shareholding": shareholding,
        "Country": countryValues.reverse[country],
        "rank": rank,
        "BRAND PICS": brandPics,
        "Country Pic": countryPicValues.reverse[countryPic],
        "Main Category pics": mainCategoryPicsValues.reverse[mainCategoryPics],
        "CATEGORY 1 PICS": category1Pics,
        "CATEGORY 2 PICS": category2Pics,
        "Company Pic": companyPic,
      };
}

enum Country {
  INDIA,
  FRANCE,
  GERMANY,
  ITALY,
  USA,
  JAPAN,
  SOUTH_KOREA,
  CHINA,
  UK,
  NETHERLANDS,
  SPAIN,
  TAIWAN,
  SWEDEN,
  INDIA_AUSTRIA,
  SWITZERLAND,
  AUSTRIA,
  DENMARK,
  HONG_KONG,
  CANADA,
  FINLAND,
  UAE,
  SRI_LANKA,
  SINGAPORE
}

final countryValues = EnumValues({
  "Austria": Country.AUSTRIA,
  "Canada": Country.CANADA,
  "China": Country.CHINA,
  "Denmark": Country.DENMARK,
  "Finland": Country.FINLAND,
  "France": Country.FRANCE,
  "Germany": Country.GERMANY,
  "Hong Kong": Country.HONG_KONG,
  "India": Country.INDIA,
  "India & Austria": Country.INDIA_AUSTRIA,
  "Italy": Country.ITALY,
  "Japan": Country.JAPAN,
  "Netherlands": Country.NETHERLANDS,
  "Singapore": Country.SINGAPORE,
  "South Korea": Country.SOUTH_KOREA,
  "Spain": Country.SPAIN,
  "Sri Lanka": Country.SRI_LANKA,
  "Sweden": Country.SWEDEN,
  "Switzerland": Country.SWITZERLAND,
  "Taiwan": Country.TAIWAN,
  "UAE": Country.UAE,
  "UK": Country.UK,
  "USA": Country.USA
});

enum CountryPic {
  INDIA_FLAG,
  FRANCE_FLAG,
  GERMANY_FLAG,
  ITALY_FLAG,
  USA_FLAG,
  JAPAN_FLAG,
  SOUTH_KOREA_FLAG,
  CHINA_FLAG,
  UK_FLAG,
  NETHERLANDS_FLAG,
  SPAIN_FLAG,
  TAIWAN_FLAG,
  SWEDEN_FLAG,
  WORLD_FLAG,
  SWITZERLAND_FLAG,
  AUSTRIA_FLAG,
  DENMARK_FLAG,
  HONG_KONG_FLAG,
  CANADA_FLAG,
  FINLAND_FLAG,
  UAE_FLAG,
  SRI_LANKA_FLAG,
  SINGAPORE_FLAG
}

final countryPicValues = EnumValues({
  "austria_flag": CountryPic.AUSTRIA_FLAG,
  "canada_flag": CountryPic.CANADA_FLAG,
  "china_flag": CountryPic.CHINA_FLAG,
  "denmark_flag": CountryPic.DENMARK_FLAG,
  "finland_flag": CountryPic.FINLAND_FLAG,
  "france_flag": CountryPic.FRANCE_FLAG,
  "germany_flag": CountryPic.GERMANY_FLAG,
  "hong_kong_flag": CountryPic.HONG_KONG_FLAG,
  "india_flag": CountryPic.INDIA_FLAG,
  "italy_flag": CountryPic.ITALY_FLAG,
  "japan_flag": CountryPic.JAPAN_FLAG,
  "netherlands_flag": CountryPic.NETHERLANDS_FLAG,
  "singapore_flag": CountryPic.SINGAPORE_FLAG,
  "south_korea_flag": CountryPic.SOUTH_KOREA_FLAG,
  "spain_flag": CountryPic.SPAIN_FLAG,
  "sri_lanka_flag": CountryPic.SRI_LANKA_FLAG,
  "sweden_flag": CountryPic.SWEDEN_FLAG,
  "switzerland_flag": CountryPic.SWITZERLAND_FLAG,
  "taiwan_flag": CountryPic.TAIWAN_FLAG,
  "uae_flag": CountryPic.UAE_FLAG,
  "uk_flag": CountryPic.UK_FLAG,
  "usa_flag": CountryPic.USA_FLAG,
  "world_flag": CountryPic.WORLD_FLAG
});

enum MadeIn {
  EMPTY,
  INDIA,
  CHINA,
  GERMANY,
  ITALY,
  MULTIPLE_COUNTRIES,
  AUSTRALIA,
  SWITZERLAND,
  KOREA,
  FRANCE,
  UK,
  IRELAND,
  AUSTRIA,
  SPAIN
}

final madeInValues = EnumValues({
  "Australia": MadeIn.AUSTRALIA,
  "Austria": MadeIn.AUSTRIA,
  "China": MadeIn.CHINA,
  "": MadeIn.EMPTY,
  "France": MadeIn.FRANCE,
  "Germany": MadeIn.GERMANY,
  "India": MadeIn.INDIA,
  "Ireland": MadeIn.IRELAND,
  "Italy": MadeIn.ITALY,
  "Korea": MadeIn.KOREA,
  "Multiple Countries": MadeIn.MULTIPLE_COUNTRIES,
  "Spain": MadeIn.SPAIN,
  "Switzerland": MadeIn.SWITZERLAND,
  "UK": MadeIn.UK
});

enum MainCategory {
  AUTOMOBILES,
  BABY_PRODUCTS,
  BAKERY_SNACKS,
  BEAUTY_HYGIENE,
  CLEANING_HOUSEHOLD,
  DAIRY_ICE_CREAMS,
  DRINKS_BEVERAGES,
  ELECTRONICS,
  FASHION,
  FOODGRAINS_OIL_MASALA,
  FROZEN_FOODS,
  HEALTH_DRINKS_SUPPLEMENTS
}

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

enum MainCategoryPics {
  AUTOMOBILES,
  BABY_PRODUCTS,
  BAKERY_SNACKS,
  BEAUTY_HYGIENE,
  CLEANING_HOUSEHOLD,
  DAIRY_ICECREAMS,
  BEVERAGES,
  ELECTRONICS,
  FASHION,
  FOODGRAINS_OIL_MASALA,
  FROZEN_FOOD,
  HEALTH_SUPPLEMENTS
}

final mainCategoryPicsValues = EnumValues({
  "automobiles": MainCategoryPics.AUTOMOBILES,
  "baby_products": MainCategoryPics.BABY_PRODUCTS,
  "bakery_snacks": MainCategoryPics.BAKERY_SNACKS,
  "beauty_hygiene": MainCategoryPics.BEAUTY_HYGIENE,
  "beverages": MainCategoryPics.BEVERAGES,
  "cleaning_household": MainCategoryPics.CLEANING_HOUSEHOLD,
  "dairy_icecreams": MainCategoryPics.DAIRY_ICECREAMS,
  "electronics": MainCategoryPics.ELECTRONICS,
  "fashion": MainCategoryPics.FASHION,
  "foodgrains_oil_masala": MainCategoryPics.FOODGRAINS_OIL_MASALA,
  "frozen_food": MainCategoryPics.FROZEN_FOOD,
  "health_supplements": MainCategoryPics.HEALTH_SUPPLEMENTS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

/*
class countrylist {
  final List<country_model> country_var;

  countrylist({
    this.country_var,
  });

  factory countrylist.fromJson(List<dynamic> parsedJson) {

    List<country_model> photos = new List<country_model>();
    photos = parsedJson.map((i)=>country_model.fromJson(i)).toList();

    return new countrylist(
        country_var: country_var
    );
  }
}
*/

/*
class master_model {
  int id;
  String mainCategory;
  String category1;
  String category2;
  String brandName;
  String company;
  String madeIn;
  String shareholding;
  String country;
  int rank;
  String bRANDPICS;
  String countryPic;
  String mainCategoryPics;
  String cATEGORY1PICS;
  String cATEGORY2PICS;
  String companyPic;

  master_model(
      {this.id,
      this.mainCategory,
      this.category1,
      this.category2,
      this.brandName,
      this.company,
      this.madeIn,
      this.shareholding,
      this.country,
      this.rank,
      this.bRANDPICS,
      this.countryPic,
      this.mainCategoryPics,
      this.cATEGORY1PICS,
      this.cATEGORY2PICS,
      this.companyPic});

  master_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainCategory = json['Main Category'];
    category1 = json['Category 1'];
    category2 = json['Category 2'];
    brandName = json['Brand Name'];
    company = json['Company'];
    madeIn = json['Made in'];
    shareholding = json['Shareholding'];
    country = json['Country'];
    rank = json['rank'];
    bRANDPICS = json['BRAND PICS'];
    countryPic = json['Country Pic'];
    mainCategoryPics = json['Main Category pics'];
    cATEGORY1PICS = json['CATEGORY 1 PICS'];
    cATEGORY2PICS = json['CATEGORY 2 PICS'];
    companyPic = json['Company Pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Main Category'] = this.mainCategory;
    data['Category 1'] = this.category1;
    data['Category 2'] = this.category2;
    data['Brand Name'] = this.brandName;
    data['Company'] = this.company;
    data['Made in'] = this.madeIn;
    data['Shareholding'] = this.shareholding;
    data['Country'] = this.country;
    data['rank'] = this.rank;
    data['BRAND PICS'] = this.bRANDPICS;
    data['Country Pic'] = this.countryPic;
    data['Main Category pics'] = this.mainCategoryPics;
    data['CATEGORY 1 PICS'] = this.cATEGORY1PICS;
    data['CATEGORY 2 PICS'] = this.cATEGORY2PICS;
    data['Company Pic'] = this.companyPic;
    return data;
  }
}
*/
