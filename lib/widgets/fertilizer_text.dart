import 'package:flutter/material.dart';
import 'package:fertilizer_pin/common/colors.dart';

class FertilizerText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final Color color;
  const FertilizerText(
      {Key? key,
      required this.text,
      this.fontFamily = 'Montserrat-SemiBold',
      this.fontSize = 16,
      this.color = BLACK_COLOR})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: color),
    );
  }
}
