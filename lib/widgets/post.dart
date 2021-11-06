import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/widgets/fertilizer_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Post extends StatelessWidget {
  final String content;
  final DateTime date;
  const Post({Key? key, required this.content, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: WIHTE_COLOR,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 20,
              offset: Offset(0, 3),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logoIcon.png',
                        width: 40,
                        height: 40,
                      ),
                      FertilizerText(
                        text: 'المسؤول',
                        fontSize: 13,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer,
                        color: LINK_COLOR,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      FertilizerText(
                        text: DateFormat('yyyy-MM-dd').format(date),
                        fontSize: 12,
                        color: LINK_COLOR,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FertilizerText(
                  text: content,
                  fontSize: 13,
                  fontFamily: 'Montserrat-Light',
                  color: GREY_DARK_COLOR,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
