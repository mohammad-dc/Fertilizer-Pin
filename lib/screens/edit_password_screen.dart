import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/controllers/account/edit_password.dart';
import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: WIHTE_COLOR,
          body: SafeArea(
            child: SingleChildScrollView(
              child: GetX<EditPasswordController>(
                init: EditPasswordController(),
                builder: (controller) => Form(
                  key: controller.editPasswordFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: BLACK_COLOR),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: const Icon(Icons.arrow_back),
                                  )),
                            ),
                            FertilizerText(text: 'كلمة المرور'),
                            FertilizerText(text: '')
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FertilizerFormField(
                          hintText: 'كلمة المرور الاساسية',
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: controller.passwordController,
                          onSaved: (value) => controller.password = value!,
                          validator: (value) =>
                              controller.valideatePassword(value!),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FertilizerFormField(
                          hintText: 'كلمة المرور الجديدة',
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: controller.newPasswordController,
                          onSaved: (value) => controller.newPassword = value!,
                          validator: (value) =>
                              controller.valideateNewPassword(value!),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FertilizerFormField(
                          hintText: 'تأكيد كلمة المرور',
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: controller.confirmPassowrdController,
                          onSaved: (value) =>
                              controller.confirmPassword = value!,
                          validator: (value) =>
                              controller.valideateConfirmPassword(value!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FertilizerButton(
                          text: 'حفظ',
                          onPressed: () => controller.checkEditPassowrd(),
                          loading: controller.loading.value,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
