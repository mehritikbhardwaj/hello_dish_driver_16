import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/home/model/profileRespose.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:hello_dish_driver/utils/api_manager/http_client.dart';
import 'package:hello_dish_driver/utils/shared_pref..dart';
import 'package:hello_dish_driver/utils/utils.dart';

class HomeController extends GetxController {
  RxString latitude = "".obs;
  RxString longitude = "".obs;
  RxString name = "".obs;
  RxString area = "".obs;
  RxBool isLoading = false.obs;
  Rx<ProfileResponse>? profileResponse;

  RxBool restaurantStatus = false.obs;

  ///

  Future<void> getCurrentLoc(BuildContext context) async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude.value = position.latitude.toString();
    longitude.value = position.longitude.toString();
    List<Placemark> placemark = await placemarkFromCoordinates(
        double.parse(latitude.value), double.parse(longitude.value),
        localeIdentifier: "en");

    // var stateName =
    //     stateAbbreviationMapFunction(placemark[0].administrativeArea!);

    name.value = placemark[0].locality!;
    area.value = placemark[0].subLocality!;
    SharedPref.shared.pref?.setString(PrefKeys.localityName, area.value);
    SharedPref.shared.pref?.setString(PrefKeys.areaName, name.value);

    update();

    latitude.value = (position.latitude.toString());
    longitude.value = position.longitude.toString();
  }

  String stateAbbreviationMapFunction(String administrativeArea) {
    // Mapping of Indian state abbreviations to full names
    Map<String, String> stateAbbreviationMap = {
      'AP': 'Andhra Pradesh',
      'AR': 'Arunachal Pradesh',
      'AS': 'Assam',
      'BR': 'Bihar',
      'CT': 'Chhattisgarh',
      'GA': 'Goa',
      'GJ': 'Gujarat',
      'HR': 'Haryana',
      'HP': 'Himachal Pradesh',
      'JH': 'Jharkhand',
      'KA': 'Karnataka',
      'KL': 'Kerala',
      'MP': 'Madhya Pradesh',
      'MH': 'Maharashtra',
      'MN': 'Manipur',
      'ML': 'Meghalaya',
      'MZ': 'Mizoram',
      'NL': 'Nagaland',
      'OR': 'Odisha',
      'PB': 'Punjab',
      'RJ': 'Rajasthan',
      'SK': 'Sikkim',
      'TN': 'Tamil Nadu',
      'TG': 'Telangana',
      'TR': 'Tripura',
      'UP': 'Uttar Pradesh',
      'UK': 'Uttarakhand',
      'WB': 'West Bengal',
      'AN': 'Andaman and Nicobar Islands',
      'CH': 'Chandigarh',
      'DN': 'Dadra and Nagar Haveli and Daman and Diu',
      'DL': 'Delhi',
      'JK': 'Jammu and Kashmir',
      'LA': 'Lakshadweep',
      'LD': 'Ladakh',
      'PY': 'Puducherry',
    };

    return stateAbbreviationMap[administrativeArea] ?? 'Unknown';
  }

  getProfileResponse() async {
    isLoading.value = true;
    update();
    try {
      final res = await HTTPClient.getProfileResponse(APIs.profile);
      profileResponse = res.obs;
      SharedPref.shared.pref?.setString(PrefKeys.userDetails, jsonEncode(res));
    } catch (stacktrace) {
      print(stacktrace.toString());
    }
    isLoading.value = false;
    update();
  }

  updateOnlineStatus() async {
    isLoading = true.obs;
    update();

    final params = {
      "onlineOffline": restaurantStatus.value ? "1" : "0",
    };
    //Get.offAll(const DashboardScreen());
    print(params.toString());
    Utils.showAlertDialog("Active status changed successfully");

    final res = await HTTPClient.putRequest(APIs.updateProfile, params);
    getProfileResponse();

    isLoading = false.obs;
    update();
  }
}
