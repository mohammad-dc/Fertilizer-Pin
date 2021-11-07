import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:fertilizer_pin/widgets/image.dart';
import 'package:fertilizer_pin/widgets/logout_button.dart';
import 'package:fertilizer_pin/widgets/user_info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              alignment: Alignment.topRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: BLACK_COLOR),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: const Icon(Icons.arrow_back),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Center(
                      child: const FertilizerImage(
                          width: 100,
                          height: 100,
                          circular: 16,
                          networkImage:
                              'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg'),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 15,
                          color: LINK_COLOR,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        FertilizerText(
                            text: 'تغير الصورة الشخصية',
                            fontSize: 12,
                            color: LINK_COLOR)
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  UserInfo(
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: GREEN_GRADIENT_DARK,
                      ),
                      label: 'الاسم',
                      value: 'محمد احمد'),
                  SizedBox(height: 15),
                  UserInfo(
                      icon: Icon(
                        Icons.email_outlined,
                        color: GREEN_GRADIENT_DARK,
                      ),
                      label: 'البريد الالكتروني',
                      value: 'mohamamd@gmail.com'),
                  SizedBox(height: 15),
                  UserInfo(
                      icon: Icon(
                        Icons.phone_android_rounded,
                        color: GREEN_GRADIENT_DARK,
                      ),
                      label: 'رقم الهاتف',
                      value: '+97012345678'),
                  SizedBox(height: 15),
                  UserInfo(
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: GREEN_GRADIENT_DARK,
                      ),
                      label: 'العنوان',
                      value: 'اليامون, جنين'),
                  SizedBox(height: 15),
                  UserInfo(
                      icon: Icon(
                        Icons.lock_outline_rounded,
                        color: GREEN_GRADIENT_DARK,
                      ),
                      label: 'كلمة المرور',
                      value: ''),
                  SizedBox(height: 40),
                  LogoutButton()
                ],
              ),
            ),
          )),
        )));
  }
}
