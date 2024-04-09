import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../Model/Model_Class.dart';

class ProviderClass with ChangeNotifier{

  List<CountryApiModel> countryList = [];
  List<FavoriteModel> favoriteList=[];


  setApiData(value){
    countryList=value;
    notifyListeners();
  }
  setcountryListAddData(object){
    countryList.add(object);
    notifyListeners();
  }
  setFavoriteListAddData(favorite){
    favoriteList.add(favorite);

  }
  DelateFavoriteListData(index){
    favoriteList.removeAt(index);
    notifyListeners();
  }



}