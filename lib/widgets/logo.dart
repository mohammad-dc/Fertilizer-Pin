import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;

  const Logo({Key? key, this.width = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/logo2.png',
        width: width,
      ),
    );
  }
}
