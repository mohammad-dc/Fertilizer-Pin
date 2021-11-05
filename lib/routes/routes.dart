import 'package:fertilizer_pin/screens/edit_profile_screen.dart';
import 'package:fertilizer_pin/screens/loading_screen.dart';
import 'package:fertilizer_pin/screens/login_screen.dart';
import 'package:fertilizer_pin/screens/posts_screen.dart';
import 'package:fertilizer_pin/screens/profile_screen.dart';
import 'package:fertilizer_pin/screens/readers_screen.dart';
import 'package:fertilizer_pin/screens/register_screen.dart';
import 'package:fertilizer_pin/screens/weather_screen.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(
        name: '/', page: () => LoadingScreen(), transition: Transition.zoom),
    GetPage(
        name: '/register',
        page: () => RegisterScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/login', page: () => LoginScreen(), transition: Transition.zoom),
    GetPage(
        name: '/profile',
        page: () => ProfileScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/editProfile',
        page: () => EditProfileScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/posts', page: () => PostsScreen(), transition: Transition.zoom),
    GetPage(
        name: '/weather',
        page: () => WeatherScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/readers',
        page: () => ReadersScreen(),
        transition: Transition.zoom)
  ];
}
