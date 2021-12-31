import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/controllers/account/edit_email.dart';
import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEmailScreen extends StatelessWidget {
  const EditEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: WIHTE_COLOR,
          body: SafeArea(
            child: SingleChildScrollView(
              child: GetX<EditEmailController>(
                init: EditEmailController(),
                builder: (controller) => Form(
                  key: controller.editEmailFormKey,
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
                            FertilizerText(text: 'البريد الالكتروني'),
                            FertilizerText(text: '')
                          ],
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
                          height: 30,
                        ),
                        FertilizerButton(
                          text: 'حفظ',
                          onPressed: () => controller.checkEditEmail(),
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
