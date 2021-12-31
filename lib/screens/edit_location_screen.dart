import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/controllers/account/edit_email.dart';
import 'package:fertilizer_pin/controllers/account/edit_location.dart';
import 'package:fertilizer_pin/models/city/city.dart';
import 'package:fertilizer_pin/widgets/Form_Field.dart';
import 'package:fertilizer_pin/widgets/button.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLocationScreen extends StatelessWidget {
  const EditLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: WIHTE_COLOR,
          body: SafeArea(
            child: SingleChildScrollView(
              child: GetX<EditLocationController>(
                  init: EditLocationController(),
                  builder: (controller) => Form(
                        key: controller.editLocationFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: BLACK_COLOR),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: const Icon(Icons.arrow_back),
                                        )),
                                  ),
                                  FertilizerText(text: 'العنوان'),
                                  FertilizerText(text: '')
                                ],
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
                                keyboardType: TextInputType.emailAddress,
                                controller: controller.addressController,
                                onSaved: (value) => controller.address = value!,
                                validator: (value) {
                                  return;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              FertilizerButton(
                                text: 'حفظ',
                                onPressed: () => controller.checkEditLocation(),
                                loading: controller.loading.value,
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ),
        ));
  }
}
