
import 'package:enoughgrocery/Constant/color.dart';
import 'package:enoughgrocery/Constant/commonAppbar.dart';
import 'package:enoughgrocery/Constant/commonButton.dart';
import 'package:enoughgrocery/Constant/commonText.dart';
import 'package:enoughgrocery/Constant/common_EditText.dart';
import 'package:enoughgrocery/Constant/common_passtextfield.dart';
import 'package:enoughgrocery/Constant/const_methods.dart';
import 'package:enoughgrocery/Constant/image.dart';
import 'package:enoughgrocery/Constant/string.dart';
import 'package:enoughgrocery/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:enoughgrocery/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController confirmpass=TextEditingController();

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
          child: CommonAppBar(title: 'Signup', icon: IconButton(icon: Icon(Icons.arrow_back_ios,size: 20,),onPressed: (){Get.back();},),)),
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
                SizedBox(height: 12.sp,),
                CommonText(title: "Sign Up",textSize: 24.sp,fontWeight: FontWeight.bold,),
                SizedBox(height: 5.sp,),
                EditText(textController: name,hint: "Full Name", formvalidate: (value){
                  if (value.isEmpty) {
                    return 'Enter a name!';
                  }
                  return null;
                },icon: Icons.person,),
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
                  else if(value != confirmpass.text){
                    return 'Password not matched';
                  }
                  return null;
                },icon: Icons.lock,textController: pass,textInputType: TextInputType.visiblePassword,),
                SizedBox(height: 10.sp,),
                PasswordTextField(hint: 'Confirm Password', formvalidate: (value) {
                  if (value.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  else if(value != pass.text){
                    return 'Password not matched';
                  }
                  return null;
                },icon: Icons.lock,textController: confirmpass,textInputType: TextInputType.visiblePassword,),
                SizedBox(height: 7.sp,),
                SizedBox(
                  height: 23.sp,
                  child: Row(children: [
                    Text("By signing, you're agree to our",style: TextStyle(fontSize: 10.sp),),
                    Flexible(child: TextButton(onPressed: (){},child: Text("Term & Conditions",style: TextStyle(fontSize: 10.sp,color: GColor.app_color),))),
                  ],),
                ),
                SizedBox(
                  height: 24.sp,
                  child: Row(
                    children: [
                      Text("and ",style: TextStyle(fontSize: 10.sp),),
                      TextButton(onPressed: (){},child: Text("Privacy Policy",style: TextStyle(fontSize: 10.sp,color: GColor.app_color),)),
                    ],
                  ),
                ),
                SizedBox(height: 5.sp,),
                CommonButton(title: "Log In", onpress: ()async{
                  // _submit();
                  bool isValidate=signUpValidation(email.text, pass.text, name.text,confirmpass.text);
                  if(isValidate){
                    bool isLogined= await FirebaseAuthHelper.instance.signUp(email.text, pass.text, context);
                    if(isLogined){
                      Get.off(HomePage());
                    }
                  }


                }),
                SizedBox(
                  height: 32.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Joined us Before?",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w300),),
                      SizedBox(width: 0.5.w,),
                      Flexible(child: TextButton(onPressed: (){Get.to(LoginScreen());}, child: Text("Login",style: TextStyle(color: GColor.app_color,fontSize: 13.sp),)))
                    ],),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
