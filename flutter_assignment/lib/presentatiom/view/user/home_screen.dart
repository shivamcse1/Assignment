// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentatiom/state_management/home_screen_provider.dart';
import 'package:flutter_assignment/presentatiom/view/auth/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  var dataList=[];
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();

    final homeProvider = Provider.of<HomeScreenProvider>(context,listen: true);
    
    Future.delayed(Duration(milliseconds: 1000),() async{
      dataList = await homeProvider.getUserDetails();
    }) ;
   
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text('Home Screen',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
      ),

      actions: [
       
       IconButton(onPressed: (){
        
        Fluttertoast.showToast(msg: "Logout Successfull");
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
          (route) => false
          );
       }, 
       icon:  Icon(Icons.logout,color: Colors.white,)
       )
       
      ],
    ),

  body: dataList.isEmpty ? Center(child: CircularProgressIndicator(color: Colors.deepOrange,),)
   : SizedBox(
    child: ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 80,
          child: Card(
            child: ListTile(
              leading: Container(
                height: 60,
                width: 60, 
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .6,
                    color: Colors.blue
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(dataList[index]['avatar']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(dataList[index]['first_name'] + " " + dataList[index]['last_name'] ,style: TextStyle(fontWeight:FontWeight.bold),),
              subtitle: Text((dataList[index]['email']),
              ),
              ),
            ));
          },
        ),
      ),
       );
      }
}