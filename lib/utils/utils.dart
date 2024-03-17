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

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  static String convertTimestamp(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp).toLocal();

    String day = dateTime.day.toString();
    String month = getMonthName(dateTime.month);
    String year = dateTime.year.toString();
    String hour = (dateTime.hour % 12).toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String period = dateTime.hour < 12 ? 'AM' : 'PM';

    return '$day $month $year at $hour:$minute $period';
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
