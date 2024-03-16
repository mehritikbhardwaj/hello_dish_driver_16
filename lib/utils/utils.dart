import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/theme.dart';

class Utils {
  static showFlushBarWithMessage(
      String msg, BuildContext context, bool status) {
    Get.rawSnackbar(
      title: msg,
      message: " ",
      duration: const Duration(seconds: 3),
    );
    // Flushbar(
    //   title: status ? "Success" : "Error",
    //   forwardAnimationCurve: Curves.decelerate,
    //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //   padding: const EdgeInsets.all(10),
    //   backgroundColor: appThemeColor,
    //   flushbarPosition: FlushbarPosition.TOP,
    //   reverseAnimationCurve: Curves.easeOutSine,
    //   borderRadius: const BorderRadius.all(Radius.circular(8)),
    //   positionOffset: 20,
    //   message: msg,
    //   duration: const Duration(seconds: 3),
    // ).show(context);
  }

  static showAlertDialog(String midleText) {
    Get.rawSnackbar(
      title: midleText,
      message: " ",
      duration: const Duration(seconds: 3),
    );
    // Get.defaultDialog(
    //     title: 'Alert',
    //     titleStyle: appTheme.textTheme.bodyLarge!
    //         .copyWith(fontSize: 20, color: AppColors.theme),
    //     middleText: midleText,
    //     middleTextStyle: appTheme.textTheme.bodyLarge!.copyWith(fontSize: 18),
    //     barrierDismissible: false,
    //     actions: [
    //       ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //             backgroundColor: AppColors.theme,
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
    //             textStyle: appTheme.textTheme.bodyLarge!
    //                 .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
    //           ),
    //           onPressed: () {
    //             Get.back();
    //           },
    //           child: Text('OK',
    //               style: appTheme.textTheme.bodyLarge!
    //                   .copyWith(fontSize: 15, color: Colors.white)))
    //     ],
    //     contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20));
  }
}
