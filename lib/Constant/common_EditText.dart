
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';



class EditText extends StatefulWidget {
  TextEditingController? textController;
  String? lable;
  bool? suggestion;
  TextInputType? textInputType;
  bool? autocorrect;
  bool? obscure;
  String? hint;
  Color? color;
  Function()? suffixIconOnpress;
  FormFieldValidator formvalidate;
  IconData? icon;
   EditText({
    Key? key,
    this.textController,
    this.lable,
     this.textInputType,
    this.obscure,
    this.suffixIconOnpress,
    required this.hint,
    required this.formvalidate,
     this.color,
    this.icon,
  }) : super(key: key);
  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
   bool obscure = false;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(widget.icon, color: GColor.app_color),
        SizedBox(width: 10), // add some spacing between the icon and the TextFormField
        Flexible(
          child: TextFormField(
            keyboardType: widget.textInputType,
            cursorColor: GColor.app_color,
            controller: widget.textController,
            validator: widget.formvalidate,
            decoration: InputDecoration(
              hintText: widget.hint,
              labelText: widget.lable,
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GColor.app_color)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GColor.app_color)),
            ),
          ),
        ),
      ],
    );

  }
}