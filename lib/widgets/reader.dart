import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/widgets/circle_name.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';

class Reader extends StatelessWidget {
  final String text;
  final String value;
  final Color color;
  const Reader(
      {Key? key, required this.text, required this.value, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: WIHTE_COLOR,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 20,
              offset: Offset(0, 3),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleName(text: text, color: color),
            SizedBox(
              height: 15,
            ),
            FertilizerText(
              text: value,
              fontSize: 13,
            )
          ],
        ),
      ),
    );
  }
}
