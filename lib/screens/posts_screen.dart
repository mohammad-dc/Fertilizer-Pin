import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/widgets/image.dart';
import 'package:fertilizer_pin/widgets/post.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: GREY_BG_COLOR,
          appBar: AppBar(
            backgroundColor: WIHTE_COLOR,
            title: FertilizerImage(
                width: 40,
                height: 40,
                networkImage:
                    'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg'),
            actions: [
              Image.asset(
                'assets/images/logoIcon.png',
                width: 40,
                height: 40,
              ),
            ],
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
              child: Column(
                children: [
                  Post(
                      content:
                          'أصبح التسويق عبر تويتر جانبًا مهمًا يجب أن تعتمد عليه الكثير من الشركات الإلكترونية وغيرها من الشركات الأخرى. وذلك بسبب',
                      date: new DateTime.now()),
                  SizedBox(
                    height: 10,
                  ),
                  Post(
                      content:
                          'أصبح التسويق عبر تويتر جانبًا مهمًا يجب أن تعتمد عليه الكثير من الشركات الإلكترونية وغيرها من الشركات الأخرى. وذلك بسبب',
                      date: new DateTime.now())
                ],
              ),
            ),
          )),
        ));
  }
}
