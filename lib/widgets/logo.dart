import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double fontSize;

  const Logo({Key? key, this.fontSize = 12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/logo2.png',
      ),
    );
  }
}
