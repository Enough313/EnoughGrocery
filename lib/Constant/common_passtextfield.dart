import 'package:flutter/material.dart';

import 'color.dart';


class PasswordTextField extends StatefulWidget {
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
  PasswordTextField({
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
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscure = false;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscure ?? true;
  }

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
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: widget.hint,
              labelText: widget.lable,
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GColor.app_color)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GColor.app_color)),
              suffixIcon: IconButton(
                icon: Icon(obscure ? Icons.visibility_off : Icons.visibility,color: obscure ? GColor.color_grey : GColor.app_color,),
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                  if (widget.suffixIconOnpress != null) {
                    widget.suffixIconOnpress!();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
