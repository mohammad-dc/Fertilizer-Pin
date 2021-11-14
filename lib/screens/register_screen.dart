import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/controllers/auth/register.dart';
import 'package:fertilizer_pin/models/city/city.dart';
import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/logo.dart';
import 'package:fertilizer_pin/widgets/switch_to_login.dart';
import 'package:fertilizer_pin/widgets/switch_to_register.dart';
import 'package:fertilizer_pin/widgets/toast.dart';
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
          child: GetX<RegisterController>(
            init: RegisterController(),
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
                      !controller.registerError.success &&
                              controller.registerError.message.isNotEmpty
                          ? Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FertilizerToast(
                                      status: 'error',
                                      text: controller.registerError.message),
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
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: GREY_LIGHT_COLOR),
                                  child: DropdownButtonFormField<City>(
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent))),
                                      hint: Text(
                                        'المدينة',
                                        style: TextStyle(
                                            color: HINT_COLOR,
                                            fontFamily: 'Montserrat-Light',
                                            fontSize: 12),
                                      ),
                                      isExpanded: true,
                                      value: controller.citySelected.value,
                                      elevation: 1,
                                      onChanged: (City? city) {
                                        controller.onCitySelected(city!);
                                      },
                                      items: controller.cities),
                                ),
                              ),
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
                                loading: controller.loading.value,
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
