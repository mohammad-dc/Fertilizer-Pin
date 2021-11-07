import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:fertilizer_pin/widgets/icon_box.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final Icon icon;
  final String label, value;
  const UserInfo(
      {Key? key, required this.icon, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconBox(icon: icon),
                SizedBox(
                  width: 3,
                ),
                FertilizerText(
                  text: label,
                  fontSize: 13,
                  fontFamily: 'Montserrat-Regular',
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FertilizerText(
                  text: value,
                  fontSize: 12,
                  fontFamily: 'Montserrat-Light',
                  color: GREY_DARK_COLOR,
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
