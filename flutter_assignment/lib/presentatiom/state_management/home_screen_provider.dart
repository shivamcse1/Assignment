
// ignore_for_file: avoid_print, prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constant/api_url_const.dart';
import 'package:http/http.dart' as http;

class HomeScreenProvider extends ChangeNotifier{

// bool _isLoading = true;
// bool get isLoading =>_isLoading ;


Future<List<dynamic>> getUserDetails () async{

  List<dynamic> userData = [];

   try{
     Uri uriUrl = Uri.parse(ApiUrlConstant.baseUrl + ApiUrlConstant.userDetails);
     var response = await http.get(uriUrl);

     if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      userData = data["data"];
      print(userData);
      notifyListeners();
      return userData;
     }
     else{
       notifyListeners();
      return userData;
     }

   }
   catch (e){
    notifyListeners();
    print("Exception Occurs :$e");
     return userData;
   }
  
   

  }
}