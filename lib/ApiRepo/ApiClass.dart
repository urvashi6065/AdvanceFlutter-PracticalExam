import 'dart:convert';



import 'package:advanceflutterexampractical/Model/Model_Class.dart';
import 'package:advanceflutterexampractical/Provider/ProviderClass.dart';

 import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';


class ApiClass{
  CountryApiModel? object;
  Future loadApiData(context) async {
    final providerVar=Provider.of<ProviderClass>(context,listen: false);

    var data=await http.get(Uri.parse('https://restcountries.com/v3.1/all?_gl=1*1v8iho1*_ga*MjAwMzIxMzc4MC4xNzExNjAyNjk5*_ga_ZCYG64C7PL*MTcxMjI5OTA0My41LjEuMTcxMjI5OTA0Ny4wLjAuMA..'));
    print(data.body);
    var convrt=jsonDecode(data.body);
    print(convrt);

    for(var e in convrt){
      object=CountryApiModel.fromJson(e);
      providerVar.setcountryListAddData(object);
    }
    return providerVar.countryList;
  }

}