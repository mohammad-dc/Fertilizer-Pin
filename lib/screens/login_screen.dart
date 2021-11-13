import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/logo.dart';
import 'package:fertilizer_pin/widgets/switch_to_signup.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(child: const Logo()),
                  SizedBox(
                    height: 50,
                  ),
                  FertilizerText(
                    text: 'تسجيل الدخول',
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      child: Column(
                        children: [
                          FertilizerFormField(
                            hintText: 'البريد الالكتروني',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FertilizerFormField(
                            hintText: 'كلمة المرور',
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FertilizerButton(text: 'تسجيل الدخول'),
                          SizedBox(
                            height: 20,
                          ),
                          FertilizerAuthLink(
                              staticText: 'ليس لديك حساب؟',
                              linkText: 'انشأ حساب جديد',
                              onTap: Get.toNamed('/register'))
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
