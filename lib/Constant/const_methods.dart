
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';



void showMessages(String msg){
  Fluttertoast.showToast(
  msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: GColor.app_color,
    textColor: Colors.white,
    fontSize: 16.sp,

  );
}


showLoaderDialog(BuildContext context){
  AlertDialog _alert=AlertDialog(
    content: Builder(builder: (context){
      return SizedBox(
        width: 100.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: GColor.app_color,),
            SizedBox(height: 18.0,),
            Container(
              margin: EdgeInsets.only(left: 7),
              child: Text("Loading..."),
            )
          ],
        ),
      );
    },),
  );
  showDialog(
      barrierDismissible: false,
      context: context, builder: (BuildContext context){
        return _alert;
  });
}


getMessageFromErrorCode(String errorCode){
  switch(errorCode){
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used. Go to Login Page";
    case "account_exist-with-different-credential":
      return "Email already used. Go to Login Page";
    case "email_already_in_use":
      return "Email already used. Go to Login Page";
    case "Error_Wrong_Password":
      return "wrong password";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email.";
    case "user_not_found":
      return "No user found with this email.";
    case "Error_User_Disabled":
      return "User Disabled.";
    case "User_Disabled":
      return "User Disabled";
    case "ERROR_TOO_MANY_REQUESTS":
      return "Too many request to log into this account.";
    case "ERROR_INVALID_EMAIL":
      return "Email address is invalid";

  }
}

bool loginValidation(String email,String pass){
  if(email.isEmpty && pass.isEmpty){
    showMessages("Email & Password is Required");
    return false;
  }
  else if(email.isEmpty){
    showMessages("Email is Required");
    return false;
  }
  else if(pass.isEmpty){
    showMessages("Password is Required");
    return false;
  }
  else{
    return true;
  }
}

bool signUpValidation(String email,String pass,String name,String cpass){
  if(email.isEmpty && pass.isEmpty && cpass.isEmpty  && name.isEmpty){
    showMessages("All fields Required");
    return false;
  }
  else if(email.isEmpty){
    showMessages("Email is Required");
    return false;
  }
  else if(name.isEmpty){
    showMessages("Name is Required");
    return false;
  }
  else if(cpass.isEmpty){
    showMessages("confirm password is Required");
    return false;
  }
  else if(pass.isEmpty){
    showMessages("Password is Required");
    return false;
  }
  else{
    return true;
  }
}