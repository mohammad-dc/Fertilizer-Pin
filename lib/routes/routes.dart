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
    GetPage(name: '/', page: () => LoadingScreen()),
    GetPage(name: '/register', page: () => RegisterScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/profile', page: () => ProfileScreen()),
    GetPage(name: '/editProfile', page: () => EditProfileScreen()),
    GetPage(name: '/posts', page: () => PostsScreen()),
    GetPage(name: '/weather', page: () => WeatherScreen()),
    GetPage(name: '/readers', page: () => ReadersScreen())
  ];
}
