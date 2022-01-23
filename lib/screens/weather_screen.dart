import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/controllers/weather/weather.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:fertilizer_pin/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherScreen extends StatelessWidget {
  final AccountController accountController = Get.find();
  final WeatherController weatherController = Get.find();
  WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: WIHTE_COLOR,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: accountController.loading.value
                                    ? Center(
                                        child: SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  BLACK_COLOR),
                                        ),
                                      ))
                                    : FertilizerImage(
                                        image: accountController
                                                .account.image.length !=
                                            0,
                                        width: 40,
                                        height: 40,
                                        networkImage: "$IMAGE_URL/" +
                                            accountController.account.image),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              FertilizerText(
                                text: 'مرحبا بك , ' +
                                    accountController.account.fullName
                                        .split(' ')[0],
                                fontSize: 14,
                              )
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/logoIcon.png',
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FertilizerText(
                    text: 'حالة الطقس اليوم',
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Container(
                      child: weatherController.loading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    GREEN_GRADIENT_DARK),
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage("https:" +
                                              weatherController.weatherSuccess
                                                  .condition.icon),
                                          fit: BoxFit.cover)),
                                ),
                                FertilizerText(
                                  text: weatherController
                                      .weatherSuccess.condition.text,
                                  fontSize: 15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    FertilizerText(
                                      text: "درجة الحرارة " +
                                          weatherController.weatherSuccess.tempF
                                              .toString() +
                                          "F",
                                      fontSize: 16,
                                    ),
                                    FertilizerText(
                                      text: "درجة الحرارة " +
                                          weatherController.weatherSuccess.tempC
                                              .toString() +
                                          "C",
                                      fontSize: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
