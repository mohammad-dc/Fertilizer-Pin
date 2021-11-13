import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_pin/common/colors.dart';
import 'package:get/get.dart';

class FertilizerSwitchToLogin extends StatelessWidget {
  const FertilizerSwitchToLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FertilizerText(
          text: 'لديك حساب بالفعل؟',
          fontSize: 13,
          fontFamily: 'Montserrat-Light',
        ),
        SizedBox(
          width: 2,
        ),
        GestureDetector(
          child: FertilizerText(
            text: 'دخول',
            fontSize: 13,
            fontFamily: 'Montserrat-Light',
            color: LINK_COLOR,
          ),
          onTap: () => Get.offNamed('/login'),
        )
      ],
    );
  }
}
