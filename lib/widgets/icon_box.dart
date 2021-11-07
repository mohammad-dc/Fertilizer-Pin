import 'package:fertilizer_pin/common/colors.dart';
import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  final Icon icon;
  const IconBox({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: GREEN_OPACITY, borderRadius: BorderRadius.circular(8)),
      child: icon,
    );
  }
}
