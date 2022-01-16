import 'package:fertilizer_pin/common/colors.dart';
import 'package:fertilizer_pin/controllers/app/app.dart';
import 'package:fertilizer_pin/screens/posts_screen.dart';
import 'package:fertilizer_pin/screens/readers_screen.dart';
import 'package:fertilizer_pin/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetX<AppController>(
        init: AppController(),
        builder: (controller) => Scaffold(
          body: Container(
              child: [ReadersScreen(), PostsScreen(), WeatherScreen()]
                  .elementAt(controller.currentPage.value)),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: WIHTE_COLOR,
            unselectedItemColor: GREY_DARK_COLOR,
            currentIndex: controller.currentPage.value,
            selectedItemColor: N_COLOR,
            onTap: controller.onPageTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book_rounded,
                ),
                label: 'القراءات',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.my_library_books_rounded,
                  ),
                  label: 'المنشورات'),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.cloud_queue,
              //   ),
              //   label: 'الطقس',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
