// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constant/api_url_const.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier{
  
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

  bool _isTap = false;
  bool get isTap =>_isTap;
  bool _loginSuccess = false;
  bool get loginSuccess =>_loginSuccess; 


  void eyeButtonTap(){
    _isTap = !isTap;
    notifyListeners();
  }


  Future<void> loginUser ( {required String email, required String password} ) async{

   try{
     
     Uri apiUrl = Uri.parse(ApiUrlConstant.baseUrl + ApiUrlConstant.loginEndPoint);
     var response = await http.post(
      apiUrl,
      body: {
        'email' : email,
        'password' : password
       },
    );
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){

       Fluttertoast.showToast(msg:'Login Successfull' );
      _loginSuccess = true;
       emailController.clear();
       passwordController.clear();
       notifyListeners();
    }
    else{
      print("Login failed ${response.body}");
      Fluttertoast.showToast(msg:data['error'] );
     _loginSuccess = false;
    }
   }
   catch(e){
    _loginSuccess = false;
     print("Error Occured :$e");

   }
  
  }

}