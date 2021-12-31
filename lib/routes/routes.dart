import 'package:fertilizer_pin/screens/edit_email_screen.dart';
import 'package:fertilizer_pin/screens/edit_location_screen.dart';
import 'package:fertilizer_pin/screens/edit_name_screen.dart';
import 'package:fertilizer_pin/screens/edit_password_screen.dart';
import 'package:fertilizer_pin/screens/edit_phone_screen.dart';
import 'package:fertilizer_pin/screens/home_screen.dart';
import 'package:fertilizer_pin/screens/loading_screen.dart';
import 'package:fertilizer_pin/screens/login_screen.dart';
import 'package:fertilizer_pin/screens/no_internet_screen.dart';
import 'package:fertilizer_pin/screens/profile_screen.dart';
import 'package:fertilizer_pin/screens/register_screen.dart';
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
        name: '/home', page: () => HomeScreen(), transition: Transition.zoom),
    GetPage(
        name: '/editName',
        page: () => EditNameScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/editEmail',
        page: () => EditEmailScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/editPhone',
        page: () => EditPhoneScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/editLocation',
        page: () => EditLocationScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/editPassword',
        page: () => EditPasswordScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/noInternet',
        page: () => NoInternetConnectionScreen(),
        transition: Transition.zoom),
  ];
}
