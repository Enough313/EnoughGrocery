

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';

class CommonIconButton extends StatelessWidget {

  String title;
  Function() onpress;
  Color? color;
  IconData? icon;
  Color? textcolor;
  Color? ic;
  CommonIconButton({
    Key? key,
    required this.title,
    required this.onpress,
    this.icon,
    this.ic=GColor.color_white,
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
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.5.w),
                ),
              ),
              onPressed: onpress,

              icon: Icon(icon,size: 19.sp,color: ic,),
              label: Text(title,style: TextStyle(color:textcolor,fontWeight: FontWeight.w500,fontSize: 14.sp),),

            )
        ),
      ),
    );
  }
}
