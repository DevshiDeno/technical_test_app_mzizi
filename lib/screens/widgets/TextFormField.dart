import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.inputType,
    this.hintText,
    this.suffixIcon,
    required this.isPasswordField,
    this.validator,
  });

  final TextEditingController? controller;
  final TextInputType inputType;
  final String? hintText;
  final Widget? suffixIcon;
  final bool isPasswordField;
  final String? Function(String?)? validator;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  var hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.isPasswordField ? hidePassword : false,
        keyboardType: widget.inputType,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          // suffixIcon: widget.isPasswordField
          //     ? IconButton(
          //   icon: SvgPicture.asset(_hidePassword ? "assets/svg/hide_password.svg" : "assets/svg/show_password.svg"),
          //   onPressed: () {
          //     setState(() {
          //       _hidePassword = !_hidePassword;
          //     });
          //   },
          // )
          //     : widget.suffixIcon ?? SizedBox.shrink(),
          contentPadding: const EdgeInsets.only(left: 16, top: 0, bottom: 0),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color(0xff9D9FAA)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xffDADEE3)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
