import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';

class CommonListTile extends StatelessWidget {
  IconData? icon;
  double height;
  double? radius;
  String? title;
  Function() onpress;
  CommonListTile({
    this.radius,
    this.height= 7,
    required this.icon,
    required this.title,
    required this.onpress,
    Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: onpress,
      child: SizedBox(
        height: height.h,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 0)
          ),
          leading: Icon(icon,color: GColor.app_color,size: 18.sp,),
          title: Text(title.toString(),
            style: TextStyle(color: GColor.color_black,fontWeight: FontWeight.w500,fontSize: 14.sp),),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: GColor.color_black,
            size: 16.sp,
          ),),
      ),
    );
  }
}
