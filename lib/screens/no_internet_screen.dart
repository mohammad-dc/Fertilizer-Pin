import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/controllers/app/app.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WIHTE_COLOR,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/internet.png',
              width: 250,
              height: 250,
            ),
            SizedBox(
              height: 10,
            ),
            FertilizerText(
              text: 'لا يوجد اتصال بالانترنت, يرجى التحقق من الاتصال',
              fontSize: 12,
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitFadingCircle(
              color: GREEN_GRADIENT_DARK,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
