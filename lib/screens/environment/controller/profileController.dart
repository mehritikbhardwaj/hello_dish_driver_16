// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/authentication/signup/ui/upload_image_api.dart';
import 'package:hello_dish_driver/screens/environment/controller/environmentController.dart';
import 'package:hello_dish_driver/screens/home/controller/homeController.dart';
import 'package:hello_dish_driver/screens/home/dashboard_screen.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:hello_dish_driver/utils/api_manager/http_client.dart';
import 'package:hello_dish_driver/utils/api_manager/parammeters.dart';
import 'package:hello_dish_driver/utils/shared_pref..dart';
import 'package:hello_dish_driver/utils/utils.dart';

import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  File? profileEditImg;
  final EnvironmentController environmentContr =
      Get.put(EnvironmentController());
  RxBool isLoading = false.obs;
  var token = "";

  @override
  void onInit() {
    super.onInit();
    token = SharedPref.shared.pref!.getString(PrefKeys.token) == null
        ? ""
        : SharedPref.shared.pref!.getString(PrefKeys.token)!;
  }

  updateProfilePic() {
    if (profileEditImg == null) {
      Utils.showFlushBarWithMessage(
          "Please select image first", Get.context!, true);
    } else {
      UploadApi.uploadImage(profileEditImg!, token).then((String message) {
        updateFunction(Get.context!, message);
      });
    }
  }

  editImg() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      profileEditImg = File(pickedFile.path);
    }
    update();
  }

  updateFunction(BuildContext context, String path) async {
    isLoading = true.obs;
    update();

    final params = {
      "image": path,
    };
    final res = await HTTPClient.putRequest(APIs.updateProfile, params);
    if (res["success"] == true) {
      Utils.showFlushBarWithMessage(res["message"], context, true);
      final HomeController controller = Get.put(HomeController());
      controller.getProfileResponse();
      controller.update();

      environmentContr.refresh();
    }
    isLoading = false.obs;
    update();
  }
}
