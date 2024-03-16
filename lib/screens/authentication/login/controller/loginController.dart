import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/home/dashboard_screen.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:hello_dish_driver/utils/api_manager/http_client.dart';
import 'package:hello_dish_driver/utils/api_manager/parammeters.dart';
import 'package:hello_dish_driver/utils/shared_pref..dart';
import 'package:hello_dish_driver/utils/utils.dart';

class LoginController extends GetxController {
  RxBool isVisible = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  loginFunction() async {
    isLoading = true.obs;
    update();

    if (!emailController.text.isEmail &&
        !emailController.text.isPhoneNumber &&
        emailController.text.trim().isEmpty) {
      Utils.showFlushBarWithMessage(
          "Enter Email or Phone Number", Get.context!, false);
      return false;
    } else if (passwordController.text.toString().trim().isEmpty) {
      Utils.showFlushBarWithMessage("Enter Password", Get.context!, false);

      return false;
    }
    final params = {
      Params.key: emailController.text,
      Params.password: passwordController.text,
    };

    final res = await HTTPClient.postRequest(APIs.login, params);
    print(res);

    if (res["success"] == true) {
      SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 1);
      SharedPref.shared.pref?.setString(PrefKeys.token, res["token"]);
      print(SharedPref.shared.pref!.getString(PrefKeys.token)!);

      // SharedPref.shared.pref
      //     ?.setString(PrefKeys.userDetails, jsonEncode(res["user"]));

      Get.offAll(const DashboardScreen());
    } else {
      SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 0);
      Utils.showFlushBarWithMessage(res["status"], Get.context!, true);
    }

    isLoading = false.obs;
    update();
  }
}
