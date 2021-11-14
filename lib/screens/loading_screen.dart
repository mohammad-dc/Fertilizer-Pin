import 'package:fertilizer_pin/controllers/auth/auth.dart';
import 'package:fertilizer_pin/controllers/city/city.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_pin/widgets/logo.dart';
import 'package:get/get.dart';

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
