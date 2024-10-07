// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentatiom/state_management/sign_up_provider.dart';
import 'package:flutter_assignment/presentatiom/view/auth/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    final signUpProvider = Provider.of<SignUpProvider>(context,listen: false);
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
                child: Image.asset("assets/images/otp_verify_image.png"),
              ),
           
              SizedBox(height: 12.h,),
           
              SizedBox(
                width: 311.w,
               
                child: Center(
                  child: Text("Welcome to our sign up page",style: TextStyle(
                    fontSize: 22.sp,fontWeight: FontWeight.w500,
                  ),)
                ),
               ),
           
              SizedBox(
                width: 311.w,
               
                child: Center(
                  child: Text("Create your account",style: TextStyle(
                    fontSize: 18.sp,fontWeight: FontWeight.w500,
                  ),)
                ),
               ),
           
           
               SizedBox(height: 29.h,),
           
               SizedBox(
                width: 312.w,
                height: 50.h,
                 child: TextField(
                  controller: signUpProvider.emailController,
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
               

               Consumer<SignUpProvider>(
                builder: (context,signUpProvider,child){
                  return  SizedBox(
                width: 312.w,
                height: 50.h,
                 child: TextField(
                  controller: signUpProvider.passwordController,
                  obscureText: signUpProvider.isTap,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon:const Icon(Icons.password),
                    suffixIcon: IconButton(
                      
                      style: IconButton.styleFrom(
                        minimumSize: const Size(0, 0),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: (){
                        signUpProvider.eyeIconTap();
                      },
                      icon: Icon(
                          signUpProvider.isTap?
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
              }),
              
               SizedBox(height: 52.h,),

                Consumer<SignUpProvider>(
                  builder: (context, signUpObject, child) {

                  return 
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF274757),
                    fixedSize: Size(312.w, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.sp)
                    )
                  ),
                  onPressed: () async{

                        await signUpProvider.signUpUser(email: signUpProvider.emailController.text, password: signUpProvider.passwordController.text) ;
                        signUpProvider.signUpSuccess 
                        ? Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false)
                        : const SizedBox();
                  },
                  child:Text("Sign In",
                  style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.white),) 
                 ,);
           
                  },
                  ),

               SizedBox(
                height: 71.h,
               ),
                    
            ]
          )
          )
        );
 
  
  }
}