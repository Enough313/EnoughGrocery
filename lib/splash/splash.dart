import 'dart:async';

import 'package:enoughgrocery/Constant/color.dart';
import 'package:enoughgrocery/Constant/commonText.dart';
import 'package:enoughgrocery/Constant/image.dart';
import 'package:enoughgrocery/Constant/string.dart';
import 'package:enoughgrocery/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import '../home/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), navigateToNextScreen);
  }

  void navigateToNextScreen() {
    FirebaseAuthHelper.instance.getAuthChange.listen((user) {
      if (user != null) {
        Get.offAll(HomePage());
      } else {
        Get.offAll(LoginScreen());
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GColor.app_color,
        body:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25.h,),
              Image.asset(GImages.whiteicon,height: 26.h,width: 42.w,),
              SizedBox(height: 0.5.h,),
              CommonText(title: Strings.app_name,
              textSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: GColor.color_white,
              )
            ],
          ),
        ),

      ),
    );
  }
}
