
// ignore_for_file: avoid_print, prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constant/api_url_const.dart';
import 'package:http/http.dart' as http;

class HomeScreenProvider extends ChangeNotifier{

// bool _isLoading = true;
// bool get isLoading =>_isLoading ;
List<dynamic> _userData = [];
List<dynamic> get userData =>_userData ;

List<dynamic> _filterList = [];
List<dynamic> get filterList =>_filterList ;

Future<void> getUserDetails () async{

   try{
     Uri uriUrl = Uri.parse(ApiUrlConstant.baseUrl + ApiUrlConstant.userDetails);
     var response = await http.get(uriUrl);

     if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      _userData = data["data"];
      _filterList = _userData;
      print(userData);
      notifyListeners();
  
     }

   }
   catch (e){
    print("Exception Occurs :$e");

   }
   notifyListeners();

  }


void filterData(String query){

   _filterList = userData.where(
    (element) {

      String name = element['first_name']+element['last_name']?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }
    ).toList();
    notifyListeners();
}
}