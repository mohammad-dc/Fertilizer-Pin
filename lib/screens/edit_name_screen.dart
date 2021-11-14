import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/controllers/user/edit_name.dart';
import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: WIHTE_COLOR,
          body: SafeArea(
            child: SingleChildScrollView(
              child: GetBuilder<EditFullNameController>(
                builder: (controller) => Form(
                  key: controller.editFullNameFormKey,
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
                            FertilizerText(text: 'الاسم'),
                            FertilizerText(text: '')
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FertilizerFormField(
                          hintText: 'الاسم بالكامل',
                          keyboardType: TextInputType.text,
                          controller: controller.fullNameController,
                          onSaved: (value) => controller.fullName = value!,
                          validator: (value) =>
                              controller.valideateFullName(value!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FertilizerButton(
                          text: 'حفظ',
                          onPressed: () => controller.checkEditName(),
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
