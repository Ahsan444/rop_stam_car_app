import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_images.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  var splashController = Get.find<SplashController>();
  @override
  void initState() {
    splashController.controller = AnimationController(vsync: this);
    splashController.moveToDashBoard();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          AppImages.SPLASH_ANIMATION,
          controller: splashController.controller,
          onLoaded: (composition) {
            splashController.controller
              ..duration = composition.duration
              ..forward();
          },
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  void dispose() {
    splashController.controller.dispose();
    super.dispose();
  }
}
