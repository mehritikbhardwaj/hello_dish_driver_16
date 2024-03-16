import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/mediaQuery.dart';

import 'controller/splashController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controll =
      Get.put(SplashController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/splash.png"), context);
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.redGradient,
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
