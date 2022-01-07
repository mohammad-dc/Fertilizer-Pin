import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDialog extends StatelessWidget {
  final String content;
  final String title;
  const PostDialog({Key? key, required this.content, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: AlertDialog(
          title: FertilizerText(
            text: title,
            fontSize: 20,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              FertilizerText(
                text: content,
                fontSize: 13,
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: FertilizerText(
                text: 'اغلاق',
                fontSize: 13,
                color: LINK_COLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
