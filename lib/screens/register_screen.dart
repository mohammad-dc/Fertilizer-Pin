import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/logo.dart';
import 'package:fertilizer_pin/widgets/switch_to_signup.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                    text: 'حساب جديد',
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
                            hintText: 'الاسم بالكامل',
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FertilizerFormField(
                            hintText: 'البريد الالكتروني',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FertilizerFormField(
                            hintText: 'رقم الهوية',
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FertilizerFormField(
                            hintText: 'رقم الهاتف',
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FertilizerFormField(
                            hintText: 'المدينة',
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FertilizerFormField(
                            hintText: 'العنوان بالتفصيل',
                            keyboardType: TextInputType.text,
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
                          FertilizerButton(text: 'تسجيل'),
                          SizedBox(
                            height: 40,
                          ),
                          FertilizerAuthLink(
                            staticText: 'لديك حساب بالفعل؟',
                            linkText: 'دخول',
                            onTap: Get.toNamed('/login'),
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
      ),
    );
  }
}
