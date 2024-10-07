

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentatiom/state_management/login_provider.dart';
import 'package:flutter_assignment/presentatiom/view/auth/sign_up_screen.dart';
import 'package:flutter_assignment/presentatiom/view/user/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
   final loginProvider = Provider.of<LoginProvider>(context,listen: false);
    return Scaffold(
         body: SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //!------Main body Section---------/// 
              SizedBox(height: 150.h,),
              SizedBox(
              width: double.infinity,
              height: 178.h,  
                child: Image.asset("assets/images/login_image.png"),
              ),
           
              SizedBox(height: 12.h,),
           
              SizedBox(
                width: 311.w,
               
                child: Center(
                  child: Text("Welcome to our login page",style: TextStyle(
                    fontSize: 22.sp,fontWeight: FontWeight.w500,
                  ),)
                ),
               ),
           
               SizedBox(
                width: 311.w,
                height: 24.h,
                child: Center(
                  child: Text("Login to your account",style: TextStyle(
                    fontSize: 18.sp,fontWeight: FontWeight.w500,
                  ),)
                ),
               ),
           
               SizedBox(height: 29.h,),
           
               SizedBox(
                width: 312.w,
                height: 50.h,
                 child: TextField(
                  controller: loginProvider.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    
                    prefixIcon:const Icon(Icons.email),
                    contentPadding: EdgeInsets.only(left: 22.w,top: 14.sp,bottom: 14.sp),
                    hintText: "Email address",
                    hintStyle: TextStyle(fontSize: 14.sp,
                    color: const Color(0xFF64748B),
                    ),
                    filled: true,
                    fillColor: const Color(0x00ffffff),
                    border: OutlineInputBorder(
                     borderSide: const BorderSide(
                      width: 0,
                      color: Color(0xFFD6DDE1)
                     ), 
                     borderRadius: BorderRadius.circular(8.r)
                    )
                  ),
                 ),
               ),
               SizedBox(height: 20.h,),
               
               Consumer<LoginProvider>(
                builder: (context,loginProvider,child){
    
                  return SizedBox(
                  width: 312.w,
                  height: 50.h,
                   child: TextField(
                    controller: loginProvider.passwordController,
                    obscureText: loginProvider.isTap,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon:const Icon(Icons.password),
                      suffixIcon: IconButton(
                        
                        style: IconButton.styleFrom(
                          minimumSize: const Size(0, 0),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: (){
                        loginProvider.eyeButtonTap();   
                                  
                        },
                        icon:Icon(
                          loginProvider.isTap ?
                          Icons.visibility_off:
                          Icons.remove_red_eye,
                          color: const Color(0xFF64748B,),
                        size: 21,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 22.w,top: 14.sp,bottom: 14.sp),
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 14.sp,
                      color: const Color(0xFF64748B),
                      ),
                      filled: true,
                      fillColor: const Color(0x00ffffff),
                      border: OutlineInputBorder(
                       borderSide: const BorderSide(
                        width: 0,
                        color: Color(0xFFD6DDE1)
                       ), 
                       borderRadius: BorderRadius.circular(8.r)
                      )
                    ),
                   ),
                 );
                },
                
               ),
               SizedBox(height: 52.h,),
    
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF274757),
                  fixedSize: Size(312.w, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.sp)
                  )
                ),
                onPressed: () async{
                 
                 await loginProvider.loginUser(
                  email: loginProvider.emailController.text.toString(),
                  password: loginProvider.passwordController.text.toString()
                  );
                 
                

                 loginProvider.loginSuccess 
                 ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return const HomeScreen();
                   }))

                : const SizedBox();
               
                },
                child:Text("Login",
                style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.white),) 
               ,),
             
             
                SizedBox(
                  height: 15.h,
                ),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text("Don't have an account? ",
                style: TextStyle(color:Color(0xFF274757),
               
                ),
                ),

                GestureDetector(
                  onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (contex)=>const SignUpScreen()), (route) => false);

                  },
                  child:const Text("Sign Up",
                  style: TextStyle(color: Color(0xFF274757) ,
                  fontWeight: FontWeight.bold
                  ),
                  ),
                )
              ]
              ),
    
               SizedBox(
                height: 71.h,
               ),
                
         ]
       )
      )
    );
  }}