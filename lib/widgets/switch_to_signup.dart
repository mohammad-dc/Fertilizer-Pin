import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_pin/common/colors.dart';

class FertilizerAuthLink extends StatelessWidget {
  final String staticText;
  final String linkText;
  final dynamic onTap;
  const FertilizerAuthLink(
      {Key? key,
      required this.linkText,
      required this.staticText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FertilizerText(
          text: staticText,
          fontSize: 13,
          fontFamily: 'Montserrat-Light',
        ),
        SizedBox(
          width: 2,
        ),
        GestureDetector(
          child: FertilizerText(
            text: linkText,
            fontSize: 13,
            fontFamily: 'Montserrat-Light',
            color: LINK_COLOR,
          ),
          onTap: onTap,
        )
      ],
    );
  }
}
