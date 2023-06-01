

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';

class CommonOutlinedButton extends StatelessWidget {

String title;
Function() onpress;
Color? color;
Color? textcolor;
   CommonOutlinedButton({
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
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
           height: 6.7.h,
        width: 84.w,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: GColor.app_color),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.5.w),
              ),),
            onPressed: onpress,
            child: Text(title,style: TextStyle(color:GColor.color_black,fontWeight: FontWeight.w500,fontSize: 14.sp),),
            
          )
        ),
      ),
    );
  }
}
