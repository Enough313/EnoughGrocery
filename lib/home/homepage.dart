import 'package:enoughgrocery/Constant/color.dart';
import 'package:enoughgrocery/Constant/commonText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: CommonText(title: 'Welcome',color: GColor.app_color,textSize: 28.sp,)),
      ),
    );
  }
}
