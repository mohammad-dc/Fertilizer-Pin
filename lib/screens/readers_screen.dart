import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/controllers/readers/readers.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:fertilizer_pin/widgets/image.dart';
import 'package:fertilizer_pin/widgets/reader.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_pin/common/colors.dart';
import 'package:get/get.dart';

class ReadersScreen extends StatelessWidget {
  final AccountController accountController = Get.find();
  final ReaderController readerController = Get.find();
  ReadersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: GREY_BG_COLOR,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      text: 'جميع القراءات',
                      fontSize: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Container(
                        child: readerController.loading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      GREEN_GRADIENT_DARK),
                                ),
                              )
                            : readerController.readers.sensors.length == 0
                                ? Center(
                                    child: FertilizerText(
                                    text: 'لا يوجد قراءات للان',
                                    fontSize: 12,
                                  ))
                                : Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Reader(
                                              text: 'PH',
                                              value: readerController
                                                  .readers.sensors[3].value,
                                              color: PH_COLOR),
                                          Reader(
                                              text: 'EC',
                                              value: readerController
                                                  .readers.sensors[2].value,
                                              color: EC_COLOR),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Reader(
                                              text: 'T',
                                              value: readerController
                                                  .readers.sensors[1].value,
                                              color: TDS_COLOR),
                                          Reader(
                                              text: 'HU',
                                              value: readerController
                                                  .readers.sensors[0].value,
                                              color: HU_COLOR),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Reader(
                                              text: 'N',
                                              value: readerController
                                                  .readers.sensors[4].value,
                                              color: N_COLOR),
                                          Reader(
                                              text: 'P',
                                              value: readerController
                                                  .readers.sensors[5].value,
                                              color: P_COLOR),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Reader(
                                              text: 'K',
                                              value: readerController
                                                  .readers.sensors[6].value,
                                              color: K_COLOR),
                                          Reader(
                                              text: 'ET0',
                                              value: DateTime.now().month == 1
                                                  ? (1 * 0.7).toString() + ' ml'
                                                  : DateTime.now().month == 2
                                                      ? (0.5 * 0.7)
                                                              .toStringAsFixed(
                                                                  3)
                                                              .toString() +
                                                          ' ml'
                                                      : DateTime.now().month ==
                                                              3
                                                          ? (0.5 * 0.7)
                                                                  .toStringAsFixed(
                                                                      3)
                                                                  .toString() +
                                                              ' ml'
                                                          : DateTime.now()
                                                                      .month ==
                                                                  4
                                                              ? (0.7 * 0.7)
                                                                      .toStringAsFixed(
                                                                          3)
                                                                      .toString() +
                                                                  ' ml'
                                                              : DateTime.now()
                                                                          .month ==
                                                                      5
                                                                  ? (0.3 * 0.7)
                                                                          .toStringAsFixed(
                                                                              3)
                                                                          .toString() +
                                                                      ' ml'
                                                                  : '0 ml',
                                              color: ET0_COLOR),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Reader(
                                              text: 'WR',
                                              value: double.parse(readerController
                                                          .readers
                                                          .sensors[0]
                                                          .value
                                                          .substring(
                                                              0,
                                                              readerController
                                                                      .readers
                                                                      .sensors[
                                                                          0]
                                                                      .value
                                                                      .length -
                                                                  1)) >
                                                      45
                                                  ? "لا يحتاج"
                                                  : (((0.7 * 0.7) * 0.8) + 8)
                                                          .toString() +
                                                      'L',
                                              color: K_COLOR),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
