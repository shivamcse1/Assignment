// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  @override
  void initState() {

    super.initState();

     WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeScreenProvider>(context, listen: false).getUserDetails();
    });
  }

  @override
  Widget build(BuildContext context){

   final homeProvider = Provider.of<HomeScreenProvider>(context,listen: true);
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

  body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
            child: SizedBox(
              height: 50,
              child: TextFormField(
                onChanged: (value){
                   homeProvider.filterData(value.trim());
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                  contentPadding: EdgeInsets.only(top: 3) ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
          ),
          homeProvider.filterList.isEmpty ? Center(child: Text("No data found"),)
         : Expanded(
            child: ListView.builder(
              itemCount:  homeProvider.filterList.length,
             itemBuilder: (context, index) {

              var data = homeProvider.filterList;
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
                           image: NetworkImage(data[index]['avatar']),
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                     title: Text(data[index]['first_name'] + " " + data[index]['last_name'] ,style: TextStyle(fontWeight:FontWeight.bold),),
                     subtitle: Text((data[index]['email']),
                     ),
                     ),
                   ));
                 },
               ),
          ),
             ],
           ),
      ),
       );
      }
}