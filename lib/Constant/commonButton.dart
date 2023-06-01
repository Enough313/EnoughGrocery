

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'color.dart';

class CommonButton extends StatelessWidget {

String title;
Function() onpress;
Color? color;
Color? textcolor;
   CommonButton({
    Key? key,
    required this.title,
    required this.onpress,
    this.color=GColor.app_color,
    this.textcolor=GColor.color_white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.sp),
        child: Container(
           height: 6.7.h,
        width: 84.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.5.w),
              ),),
            onPressed: onpress,
            child: Text(title,style: TextStyle(color:textcolor,fontWeight: FontWeight.w500,fontSize: 14.sp),),
            
          )
        ),
      ),
    );
  }
}
