import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentatiom/state_management/home_screen_provider.dart';
import 'package:flutter_assignment/presentatiom/state_management/login_provider.dart';
import 'package:flutter_assignment/presentatiom/state_management/sign_up_provider.dart';
import 'package:flutter_assignment/presentatiom/view/auth/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,800), 
      builder: (_,child){

        return  MultiProvider(
         providers: [
          ChangeNotifierProvider(create: (context)=> LoginProvider()),
          ChangeNotifierProvider(create: (context)=> SignUpProvider()),
          ChangeNotifierProvider(create: (context)=>HomeScreenProvider())
         ],
        
         builder: (context,child){
          return    MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          ),
          home:const LoginScreen(),
          );
     
         },
       
        );
      }
    );
  }
}
