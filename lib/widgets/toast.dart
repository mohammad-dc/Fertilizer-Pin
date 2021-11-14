import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// showToast(String msg, Color color) {
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: color,
//       fontSize: 16.0,
//       textColor: Colors.white);
// }

class FertilizerToast extends StatelessWidget {
  final String status;
  final String text;
  const FertilizerToast({Key? key, required this.status, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: status == 'error' ? RED_COLOR : GREEN_GRADIENT_DARK),
          borderRadius: BorderRadius.circular(8),
          color: status == 'error' ? RED_OPACITY : GREEN_GRADIENT_LIGHT),
      child: Center(
        child: FertilizerText(
          text: text,
          fontSize: 10,
        ),
      ),
    );
  }
}
