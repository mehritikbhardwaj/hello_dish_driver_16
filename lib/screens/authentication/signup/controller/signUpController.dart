import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/authentication/signup/ui/upload_image_api.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../utils/api_manager/apis.dart';
import '../../../../utils/api_manager/http_client.dart';
import '../../../../utils/api_manager/parammeters.dart';
import '../../../../utils/shared_pref..dart';
import '../../../../utils/utils.dart';
import '../../../home/dashboard_screen.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController bankNumberController = TextEditingController();
  final TextEditingController bankHolderNameController =
      TextEditingController();
  final TextEditingController bankIFSCController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController fssaiController = TextEditingController();
  RxString bankAddress = "".obs;
  File? adharFront;
  File? adharBack;
  File? panCard;
  File? drivingFront;
  File? drivingBack;
  File? selfie;
  bool ismale = true;
  bool isfemale = false;
  bool isother = false;
  RxBool isVisible = false.obs;
  RxBool isVisible1 = false.obs;
  RxBool isLoading = false.obs;
  String selectedDate = "Select date of birth";

  bool isElec = false;
  bool isMoto = true;
  bool isSmall = false;
  bool ismed = true;
  bool islarge = false;
  bool isXl = false;
  bool isXll = false;
  String size = "m";
  late Razorpay _razorpay;
  String transactionId = "";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout(String amount) async {
    var options = {
      'key': 'rzp_test_utxGx5b5MsHgol',
      'amount': amount.toString(),
      'name': 'Hello Dish Driver',
      'description': 'Payment',
      // 'prefill': {
      //   'contact': '+91${PrefKeys..number}914492',
      //   'email': '${PrefKeys.userGlobal.email}'
      // },
      'theme': {
        'backdrop_color':
            '#F7F9FC', // Change this to the background color you want
        'color': "#DB1D1D", // Change this to the color you want
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("SUCCESS:  ${response.paymentId}");
    transactionId = response.paymentId.toString();
    update();
    signUpFunction();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("errror: " + "${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("EXTERNAL_WALLET: " + "${response.walletName}");
  }

  @override
  void onClose() {
    super.onClose();
    _razorpay.clear();
  }

  getBankName() async {
    if (bankIFSCController.text.length < 11 ||
        bankIFSCController.text.length > 12) {
      print("INVALID IFSC");
      bankNameController.text = "";
      bankAddress.value = "";
      update();
    } else {
      try {
        final res = await HTTPClient.getBankDetails(
          APIs.bankDetail + bankIFSCController.text,
        );
        bankNameController.text = res.bank;
        bankAddress.value = res.address;
        update();
      } catch (stacktrace) {
        bankNameController.text = "";
        bankAddress.value = "";

        update();
        Utils.showAlertDialog("Invalid IFSC");
        print("ERROR");
      }
    }
    update();
  }

  Future<bool> checkMailPhone() async {
    isLoading = true.obs;
    update();
    try {
      var params = {
        "email": emailController.text,
        "phone": numberController.text,
      };
      final res = await HTTPClient.postRequest(APIs.checkMailPhone, params);
      print(res);
      isLoading = false.obs;
      update();
      if (res['status'] == true) {
        return true;
      } else {
        Utils.showAlertDialog(res['message']);
        return false;
      }
    } catch (e, stackTrace) {
      isLoading = false.obs;
      update();
      print(stackTrace);
      throw Exception(e);
    }
  }

  printPara() {
    final params = {
      Params.name: nameController.text,
      Params.email: emailController.text,
      Params.phone: numberController.text,
      Params.password: passwordController.text,
      'dateOfBirth': selectedDate,
      'gender': ismale
          ? "Male"
          : isfemale
              ? "Female"
              : "Other",
    };

    final params2 = {
      "bankName": bankNameController.text,
      "bankHolderName": bankHolderNameController.text,
      "bankAccountNumber": bankNumberController.text,
      "ifscCode": bankIFSCController.text
    };
    print(params2.toString());

    try {
      final params3 = {
        "adharCardFront": adharFront!.path,
        "adharCardBack": adharBack!.path,
        "pandCard": panCard!.path,
        "drivingLicenseFront": drivingFront!.path,
        "drivingLicenseBack": drivingBack!.path,
        "selfie": selfie!.path,
      };
      print(params3.toString());
    } catch (err) {}

    print(params.toString());
  }

  uploadDocumnetApi() async {
    isLoading = true.obs;
    update();
    var token = SharedPref.shared.pref!.getString(PrefKeys.token) ?? "";
    print("HERE TOKEN" + token);
    String adharImage = "";
    String adharBackImage = "";
    String panImage = "";
    String drivingFronPath = "";
    String drivingBackPath = "";
    String selfiePath = "";
    await UploadApi.uploadImage(adharFront!, token).then((String message) {
      adharImage = message;
    });
    await UploadApi.uploadImage(adharBack!, token).then((String message) {
      adharBackImage = message;
    });
    await UploadApi.uploadImage(panCard!, token).then((String message) {
      panImage = message;
    });
    await UploadApi.uploadImage(drivingFront!, token).then((String message) {
      drivingFronPath = message;
    });

    await UploadApi.uploadImage(drivingBack!, token).then((String message) {
      drivingBackPath = message;
    });
    await UploadApi.uploadImage(selfie!, token).then((String message) {
      selfiePath = message;
    });

    try {
      final params3 = {
        "adharCardFront": adharImage,
        "adharCardBack": adharBackImage,
        "pandCard": panImage,
        "drivingLicenseFront": drivingFronPath,
        "drivingLicenseBack": drivingBackPath,
        "selfie": selfiePath,
      };
      print(params3.toString());
      final res = await HTTPClient.postRequest(APIs.addDocument, params3);
      if (res["success"] == true) {
        SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 1);
        // SharedPref.shared.pref?.setString(PrefKeys.token, res["token"]);
        // print(SharedPref.shared.pref!.getString(PrefKeys.token)!);
        updateBankDetails();
      } else {
        SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 0);
        Utils.showFlushBarWithMessage(
            res["message"], Get.context!, res["success"]);
        isLoading = false.obs;
        update();
      }
    } catch (err) {
      isLoading = false.obs;
      update();
    }

    isLoading = false.obs;
    update();
  }

  updateBankDetails() async {
    isLoading = true.obs;
    update();

    final params2 = {
      "bankName": bankNameController.text,
      "bankHolderName": bankHolderNameController.text,
      "bankAccountNumber": bankNumberController.text,
      "ifscCode": bankIFSCController.text
    };
    final res = await HTTPClient.postRequest(APIs.addBank, params2);
    if (res["success"] == true) {
      SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 1);
      updateVehicleType();
    } else {
      SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 0);
      Utils.showFlushBarWithMessage(
          res["message"], Get.context!, res["success"]);
    }

    isLoading = false.obs;
    update();
  }

  updateVehicleType() async {
    isLoading = true.obs;
    update();

    final params2 = {
      "vehicleType": isElec ? "0" : "1",
      "tshirtSize": size,
      "transactionId": transactionId
    };
    final res = await HTTPClient.putRequest(APIs.updateVehicleType, params2);
    if (res["status"] == true) {
      SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 1);
      Utils.showFlushBarWithMessage(
          "User created successfully.", Get.context!, res["status"]);
      Get.offAll(const DashboardScreen());
    } else {
      SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 0);
      Utils.showFlushBarWithMessage(
          res["message"], Get.context!, res["success"]);
    }

    isLoading = false.obs;
    update();
  }

  signUpFunction() async {
    isLoading = true.obs;
    update();

    if (validate()) {
      final params = {
        Params.name: nameController.text,
        "email": emailController.text,
        "phone": numberController.text,
        Params.password: passwordController.text,
        'dateOfBirth': selectedDate,
        'gender': ismale
            ? "Male"
            : isfemale
                ? "Female"
                : "Other",
      };
      final res = await HTTPClient.postRequest(APIs.signup, params);
      if (res["success"] == true) {
        SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 1);
        SharedPref.shared.pref?.setString(PrefKeys.token, res["token"]);

        uploadDocumnetApi();
        print(SharedPref.shared.pref!.getString(PrefKeys.token)!);
      } else {
        SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 0);
        Utils.showFlushBarWithMessage(
            res["message"], Get.context!, res["success"]);
      }
    }

    isLoading = false.obs;
    update();
  }

  validate() {
    String? passwordValidationMessage =
        validatePassword(passwordController.text);

    if (nameController.text.isEmpty) {
      Utils.showFlushBarWithMessage("Name can't be empty", Get.context!, false);
      return false;
    } else if (emailController.text.isEmpty || !emailController.text.isEmail) {
      Utils.showFlushBarWithMessage(
          "Email can't be empty or Invalid Email", Get.context!, false);
      return false;
    } else if (numberController.text.isEmpty ||
        !numberController.text.isPhoneNumber) {
      Utils.showFlushBarWithMessage(
          "Number can't be empty or Invalid number", Get.context!, false);
      return false;
    } else if (passwordValidationMessage != null) {
      Utils.showFlushBarWithMessage(
          passwordValidationMessage, Get.context!, false);
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      Utils.showFlushBarWithMessage(
          "Password and confirm password should be same", Get.context!, false);
      return false;
    } else {
      return true;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }
    if (!value.contains(RegExp(r'[!@#\$%^&*()_+{}|:<>?~]'))) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  bool validateBank() {
    if (nameController.text.isEmpty) {
      Utils.showAlertDialog("Name can't be empty");
      return false;
    } else if (bankHolderNameController.text.isEmpty) {
      Utils.showAlertDialog("Bank holder name can't be empty");
      return false;
    } else if (bankNameController.text.isEmpty) {
      Utils.showAlertDialog("Bank name can't be empty");
      return false;
    } else if (bankNumberController.text.isEmpty) {
      Utils.showAlertDialog("Bank number  can't be empty");
      return false;
    } else if (bankIFSCController.text.isEmpty) {
      Utils.showAlertDialog("Bank IFSC  can't be empty");
      return false;
    }
    // signUpFunction();
    return true;
  }
}
