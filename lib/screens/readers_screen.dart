import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:fertilizer_pin/widgets/image.dart';
import 'package:fertilizer_pin/widgets/reader.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_pin/common/colors.dart';

class ReadersScreen extends StatelessWidget {
  const ReadersScreen({Key? key}) : super(key: key);

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
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FertilizerImage(
                                  width: 40,
                                  height: 40,
                                  networkImage:
                                      'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg'),
                              SizedBox(
                                width: 5,
                              ),
                              FertilizerText(
                                text: 'مرحبا بك , مرح',
                                fontSize: 14,
                              )
                            ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Reader(text: 'PH', value: 4.22, color: PH_COLOR),
                        Reader(text: 'EC', value: 5.22, color: EC_COLOR),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Reader(text: 'TDS', value: 6.22, color: TDS_COLOR),
                        Reader(text: 'HU', value: 7.22, color: HU_COLOR),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Reader(text: 'N', value: 8.22, color: N_COLOR),
                        Reader(text: 'P', value: 9.22, color: P_COLOR),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Reader(text: 'K', value: 3.22, color: K_COLOR),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
