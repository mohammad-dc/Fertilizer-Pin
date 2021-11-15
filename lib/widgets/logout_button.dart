import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (controller) => GestureDetector(
        onTap: () => controller.logout(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: HINT_COLOR),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: FertilizerText(
              text: 'تسجيل الخروج',
              color: RED_COLOR,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
