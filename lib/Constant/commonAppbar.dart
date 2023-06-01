import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';

class CommonAppBar extends StatelessWidget {
  String title;
  bool? centertitle;
  Widget? icon;
  CommonAppBar({
    required this.title,
    this.icon,
    this.centertitle,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GColor.app_color,
      leading: icon,
      // centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(title,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,fontFamily: "Poppins"),),
    );
  }
}
