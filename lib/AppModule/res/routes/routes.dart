import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:rop_stam_assignment/AppModule/dashboard/screen/dashboard_screen.dart';
import 'package:rop_stam_assignment/AppModule/login/screen/login_screen.dart';
import 'package:rop_stam_assignment/AppModule/res/routes/route_name.dart';
import 'package:rop_stam_assignment/AppModule/resgister/screen/register_screen.dart';

import '../../binding/dashboard_binding.dart';
import '../../binding/login_binding.dart';
import '../../binding/register_binding.dart';
import '../../binding/splash_binding.dart';
import '../../splash/screen/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteName.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      curve: Curves.easeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: RouteName.dashboardScreen,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RouteName.registerScreen,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
      curve: Curves.easeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}