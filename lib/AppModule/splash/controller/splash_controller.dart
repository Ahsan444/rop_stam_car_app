import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:rop_stam_assignment/AppModule/login/controller/user_pref/user_pref.dart';

import '../../res/routes/route_name.dart';

class SplashController extends GetxController {
  late final AnimationController controller;
  UserPref userPref = UserPref();

  void moveToDashBoard() {
    Future.delayed(const Duration(seconds: 4), () {
      /*Get.offNamed(
        RouteName.loginScreen,
      );*/
      userPref.getUserToken().then((value) {
        if (value.token == null ) {
          Get.offNamed(
            RouteName.loginScreen,
          );

        } else {
          Get.offAllNamed(RouteName.dashboardScreen);
        }
      });
    });
  }
}
