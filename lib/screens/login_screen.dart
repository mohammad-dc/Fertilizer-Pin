import 'package:fertilizer_pin/controllers/auth/login.dart';
import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/logo.dart';
import 'package:fertilizer_pin/widgets/switch_to_register.dart';
import 'package:fertilizer_pin/widgets/toast.dart';
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
          child: GetX<LoginController>(
            init: LoginController(),
            builder: (controller) => Padding(
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
                    !controller.loginError.success &&
                            controller.loginError.message.isNotEmpty
                        ? Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                FertilizerToast(
                                    status: 'error',
                                    text: controller.loginError.message),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: controller.loginFormKey,
                          child: Column(
                            children: [
                              FertilizerFormField(
                                hintText: 'البريد الالكتروني',
                                keyboardType: TextInputType.emailAddress,
                                controller: controller.emailController,
                                onSaved: (value) => controller.email = value!,
                                validator: (value) =>
                                    controller.valideateEmail(value!),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FertilizerFormField(
                                hintText: 'كلمة المرور',
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                controller: controller.passwordController,
                                onSaved: (value) =>
                                    controller.password = value!,
                                validator: (value) =>
                                    controller.valideatePassword(value!),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              FertilizerButton(
                                  text: 'تسجيل الدخول',
                                  onPressed: () => controller.checkLogin(),
                                  loading: controller.loading.value),
                              SizedBox(
                                height: 20,
                              ),
                              FertilizerSwitchToRegister()
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
