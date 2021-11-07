import 'package:flutter/material.dart';
import 'package:fertilizer_pin/widgets/logo.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/splash.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Logo(),
      ),
    );
  }
}
