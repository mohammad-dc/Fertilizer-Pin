import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_pin/common/colors.dart';

class FertilizerButton extends StatelessWidget {
  final String text;
  const FertilizerButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [GREEN_GRADIENT_DARK, GREEN_GRADIENT_LIGHT])),
        child: TextButton(onPressed: null, child: FertilizerText(text: text)));
  }
}
