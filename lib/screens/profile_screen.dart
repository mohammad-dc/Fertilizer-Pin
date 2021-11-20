import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:fertilizer_pin/widgets/image.dart';
import 'package:fertilizer_pin/widgets/logout_button.dart';
import 'package:fertilizer_pin/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GetBuilder<AccountController>(
              init: AccountController(),
              builder: (controller) => Container(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: BLACK_COLOR),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: const Icon(Icons.arrow_back),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Center(
                        child: FertilizerImage(
                            image: controller.account.image.length != 0,
                            width: 100,
                            height: 100,
                            networkImage:
                                "$IMAGE_URL/" + controller.account.image),
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => controller.changeImageProfile(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 15,
                            color: LINK_COLOR,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          FertilizerText(
                              text: 'تغير الصورة الشخصية',
                              fontSize: 12,
                              color: LINK_COLOR)
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    UserInfo(
                        icon: Icon(
                          Icons.account_circle_outlined,
                          color: GREEN_GRADIENT_DARK,
                        ),
                        route: 'editName',
                        label: 'الاسم',
                        value: controller.account.fullName),
                    SizedBox(height: 15),
                    UserInfo(
                        icon: Icon(
                          Icons.email_outlined,
                          color: GREEN_GRADIENT_DARK,
                        ),
                        route: 'editEmail',
                        label: 'البريد الالكتروني',
                        value: controller.account.email),
                    SizedBox(height: 15),
                    UserInfo(
                        icon: Icon(
                          Icons.phone_android_rounded,
                          color: GREEN_GRADIENT_DARK,
                        ),
                        route: 'editPhone',
                        label: 'رقم الهاتف',
                        value: controller.account.phone),
                    SizedBox(height: 15),
                    UserInfo(
                        icon: Icon(
                          Icons.location_on_outlined,
                          color: GREEN_GRADIENT_DARK,
                        ),
                        route: 'editLocation',
                        label: 'العنوان',
                        value: controller.account.address +
                            ',' +
                            ' ' +
                            controller.account.city),
                    SizedBox(height: 15),
                    UserInfo(
                        icon: Icon(
                          Icons.lock_outline_rounded,
                          color: GREEN_GRADIENT_DARK,
                        ),
                        route: 'editPassword',
                        label: 'كلمة المرور',
                        value: ''),
                    SizedBox(height: 40),
                    LogoutButton()
                  ],
                ),
              ),
            ),
          )),
        )));
  }
}
