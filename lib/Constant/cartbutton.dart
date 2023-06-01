import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';

class CartButton extends StatelessWidget {
  Function() onpress;
  CartButton({
    required this.onpress,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.1.h,
      width: 24.5.w,
      child: ElevatedButton.icon(onPressed: onpress,
          icon: Container( height: 1.7.h,width:1.7.h,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),child: Icon(Icons.shopping_cart,color: GColor.cart,size: 8,)),
          style: ElevatedButton.styleFrom(
              backgroundColor: GColor.cart,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
          label: Text("Add to cart",maxLines:1,style: TextStyle(color: GColor.color_white,fontSize: 6.5.sp),)),
    );
  }
}
