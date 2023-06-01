
import 'package:enoughgrocery/Constant/color.dart';
import 'package:enoughgrocery/Constant/commonAppbar.dart';
import 'package:enoughgrocery/Constant/commonButton.dart';
import 'package:enoughgrocery/Constant/commonText.dart';
import 'package:enoughgrocery/Constant/common_EditText.dart';
import 'package:enoughgrocery/Constant/common_passtextfield.dart';
import 'package:enoughgrocery/Constant/commoniconButton.dart';
import 'package:enoughgrocery/Constant/const_methods.dart';
import 'package:enoughgrocery/Constant/image.dart';
import 'package:enoughgrocery/Constant/string.dart';
import 'package:enoughgrocery/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:enoughgrocery/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 40.sp),
          child: CommonAppBar(title: 'Login', icon: IconButton(icon: Icon(Icons.arrow_back_ios,size: 20,),onPressed: (){Get.back();},),)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.sp,horizontal: 20.sp),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(GImages.greenicon,height: 20.h,width: 27.w,)),
                SizedBox(height: 0.1.h,),
                Center(
                  child: CommonText(title: Strings.app_name,
                    textSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: GColor.app_color,
                  ),
                ),
                SizedBox(height: 0.8.h,),
                Center(
                  child: CommonText(title: Strings.comment,
                    textSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: GColor.color_black,
                  ),
                ),
                SizedBox(height: 15.sp,),
                CommonText(title: "Log in",textSize: 24.sp,fontWeight: FontWeight.bold,),
                SizedBox(height: 10.sp,),
                EditText(hint: 'Email', formvalidate: (value) {
                  if (value.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },icon: Icons.email,textController: email,textInputType: TextInputType.emailAddress,),
                SizedBox(height: 10.sp,),
                PasswordTextField(hint: 'Password', formvalidate: (value) {
                  if (value.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  return null;
                },icon: Icons.lock,textController: pass,textInputType: TextInputType.visiblePassword,),
                SizedBox(height: 10.sp,),
                Align(alignment: Alignment.topRight,child: TextButton(onPressed: (){}, child: Text("Forgot Password?",style: TextStyle(color: GColor.app_color,fontSize: 14.sp),))),
                SizedBox(height: 7.sp,),
                CommonButton(title: "Log In", onpress: ()async{
                  // _submit();
                  bool isValidate=loginValidation(email.text, pass.text,);
                  if(isValidate){
                    bool isLogined= await FirebaseAuthHelper.instance.login(email.text, pass.text, context);
                    if(isLogined){
                      Get.off(HomePage());
                    }
                  }


                }),
                SizedBox(height: 2.sp,),
                Row(children: [
                  SizedBox(width: 110.sp,child: Divider(thickness: 2,color: GColor.color_grey.withOpacity(0.3),)),
                  SizedBox(width: 10.sp,),
                  Text("OR",style: TextStyle(color: GColor.color_grey.withOpacity(0.3),fontSize: 14.sp,fontWeight: FontWeight.bold),),
                  SizedBox(width: 10.sp,),
                  SizedBox(width: 110.sp,child: Divider(thickness: 2,color: GColor.color_grey.withOpacity(0.3),)),
                ],),
                SizedBox(height: 7.sp,),
                CommonIconButton(title: "Login with Google",textcolor: GColor.color_black,ic: GColor.app_color, onpress: (){},icon: Icons.g_mobiledata,color: Color(0xffDCDFE0),),
                SizedBox(height: 5.sp,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to Enough Grocery?",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w300),),
                    SizedBox(width: 0.5.w,),
                    TextButton(onPressed: (){Get.to(SignUpScreen());}, child: Text("Register",style: TextStyle(color: GColor.app_color,fontSize: 13.sp),))
                  ],)

        ],
            ),
          ),
        ),
      ),
    );
  }
}
