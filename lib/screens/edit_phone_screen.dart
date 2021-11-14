import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/controllers/user/edit_phone.dart';
import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPhoneScreen extends StatelessWidget {
  const EditPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: WIHTE_COLOR,
          body: SafeArea(
            child: SingleChildScrollView(
              child: GetBuilder<EditPhoneController>(
                builder: (controller) => Form(
                  key: controller.editPhoneFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: BLACK_COLOR),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: const Icon(Icons.arrow_back),
                                )),
                            FertilizerText(text: 'رقم الهاتف'),
                            FertilizerText(text: '')
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FertilizerFormField(
                          hintText: 'رقم الهاتف',
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.phoneController,
                          onSaved: (value) => controller.phone = value!,
                          validator: (value) =>
                              controller.valideatePhone(value!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FertilizerButton(
                          text: 'حفظ',
                          onPressed: () => controller.checkEditPhone(),
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
