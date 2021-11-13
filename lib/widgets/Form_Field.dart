import 'package:flutter/material.dart';
import 'package:fertilizer_pin/common/colors.dart';

class FertilizerFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  const FertilizerFormField(
      {Key? key,
      required this.hintText,
      required this.keyboardType,
      required this.controller,
      required this.onSaved,
      required this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8)),
          hintText: hintText,
          hintStyle: TextStyle(
              color: HINT_COLOR, fontFamily: 'Montserrat-Light', fontSize: 12),
          filled: true,
          fillColor: GREY_LIGHT_COLOR),
    );
  }
}
