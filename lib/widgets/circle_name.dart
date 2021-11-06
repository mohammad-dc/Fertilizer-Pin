import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';

class CircleName extends StatelessWidget {
  final String text;
  final Color color;
  const CircleName({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: FertilizerText(
          text: text,
          fontFamily: 'Montserrat-Regular',
          color: WIHTE_COLOR,
        ),
      ),
    );
  }
}
