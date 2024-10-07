// ignore_for_file: avoid_print, prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http ;

import '../../core/constant/api_url_const.dart';

class SignUpProvider extends ChangeNotifier{

   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   
   bool _isTap = false;
   bool get isTap => _isTap;
   bool _signUpSuccess = false;
   bool get signUpSuccess => _signUpSuccess;

   void eyeIconTap(){
     _isTap = !_isTap;
     notifyListeners();
   }

 Future<void> signUpUser ( {required String email, required String password} ) async{

   try{
     Uri apiUrl = Uri.parse(ApiUrlConstant.baseUrl + ApiUrlConstant.signUpEndPoint);
     var response = await http.post(
      apiUrl,
      body: {
        'email' : email,
        'password' : password
       },
    );
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
       _signUpSuccess = true;
       Fluttertoast.showToast(msg:'SignUp Successfull' );
       emailController.clear();
       passwordController.clear();
       
      
    }
    else{
      _signUpSuccess = false;
      print("Login failed ${response.body}");
      Fluttertoast.showToast(msg:data['error'] );
    }
   }
   catch(e){
    _signUpSuccess = false;
     print("Error Occured :$e");

   }
  
  }

}