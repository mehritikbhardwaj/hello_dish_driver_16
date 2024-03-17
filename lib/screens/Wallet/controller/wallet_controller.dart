import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/Wallet/model/walletResposeModel.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:hello_dish_driver/utils/api_manager/http_client.dart';
import 'package:hello_dish_driver/utils/shared_pref..dart';
import 'package:hello_dish_driver/utils/utils.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class WalletController extends GetxController {
  late Razorpay _razorpay;
  TextEditingController addAmountTextController = TextEditingController();
  // bool amountTextFieldVisible = false;
  bool amountTextFieldWithdrawVisible = false;
  bool amountTextFieldAddVisible = false;
  RxBool isLoading = false.obs;
  Rx<WalletResponse>? response;
  var transList = <Datum>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  getTransList() async {
    isLoading.value = true;
    update();
    try {
      final res = await HTTPClient.getPaymentHistory(APIs.getPaymentHistory);
      response = res.obs;
      transList.clear();
      transList.addAll(response!.value.data);
    } catch (stacktrace, error) {
      log(stacktrace.toString());
      log(error.toString());
      isLoading.value = false;
      update();
    }

    isLoading.value = false;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    // _razorpay.clear();
    addAmountTextController.clear();
  }

  //

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_C56lfR8qLoKsu4',
      'amount': '${addAmountTextController.text}00',
      'name': 'Add Wallet',
      'description': 'Payment',
      // 'prefill': {
      //   'contact': '+91${PrefKeys..number}914492',
      //   'email': '${PrefKeys.userGlobal.email}'
      // },
      'theme': {
        'backdrop_color':
            '#FFFFFF', // Change this to the background color you want
        'color': '#618264', // Change this to the color you want
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
    print("SUCCESS: " + "${response.paymentId}");
    addWithdrawWallet(false);
    update();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("errror: " + "${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("EXTERNAL_WALLET: " + "${response.walletName}");
  }

  addWithdrawWallet(bool forWithdraw) async {
    isLoading = true.obs;
    update();

    final params = {
      "amount": int.parse(addAmountTextController.text),
      "type": forWithdraw ? 0 : 1
    };
    print(params.toString());

    final res = await HTTPClient.postRequest(APIs.paymentWithdrawAdd, params);
    if (res["status"]) {
      Utils.showAlertDialog(forWithdraw
          ? "Amount withdrawl successful"
          : "Amount added to wallet successfully");
    } else {
      Utils.showAlertDialog("Something went wrong");
    }

    amountTextFieldAddVisible = false;
    amountTextFieldWithdrawVisible = false;
    addAmountTextController.text = "";
    getTransList();

    isLoading = false.obs;
    update();
  }
  //
}
