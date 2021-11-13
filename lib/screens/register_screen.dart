import 'package:fertilizer_pin/controllers/auth/register.dart';
import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/logo.dart';
import 'package:fertilizer_pin/widgets/switch_to_login.dart';
import 'package:fertilizer_pin/widgets/switch_to_register.dart';
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
          child: GetBuilder<RegisterController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: controller.registerFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                controller: controller.fullNameController,
                                onSaved: (value) =>
                                    controller.fullName = value!,
                                validator: (value) =>
                                    controller.valideateFullName(value!),
                              ),
                              SizedBox(
                                height: 20,
                              ),
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
                                hintText: 'رقم الهوية',
                                keyboardType: TextInputType.text,
                                controller: controller.ssnNumberController,
                                onSaved: (value) =>
                                    controller.snnNumber = value!,
                                validator: (value) =>
                                    controller.valideateSSNNumber(value!),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FertilizerFormField(
                                hintText: 'رقم الهاتف',
                                keyboardType: TextInputType.phone,
                                controller: controller.phoneController,
                                onSaved: (value) => controller.phone = value!,
                                validator: (value) =>
                                    controller.valideatePhone(value!),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FertilizerFormField(
                                  hintText: 'المدينة',
                                  keyboardType: TextInputType.text,
                                  controller: controller.addressController,
                                  onSaved: (value) =>
                                      controller.address = value!,
                                  validator: (value) {
                                    return;
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              FertilizerFormField(
                                  hintText: 'العنوان بالتفصيل',
                                  keyboardType: TextInputType.text,
                                  controller: controller.addressController,
                                  onSaved: (value) =>
                                      controller.address = value!,
                                  validator: (value) {
                                    return;
                                  }),
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
                                text: 'تسجيل',
                                onPressed: () => controller.checkRegister(),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              FertilizerSwitchToLogin(),
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
        ),
      ),
    );
  }
}
