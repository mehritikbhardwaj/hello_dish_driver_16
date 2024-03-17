import 'dart:developer';

import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/order/model/cancelModel.dart';

import '../../../utils/api_manager/apis.dart';
import '../../../utils/api_manager/http_client.dart';
import '../model/orderModel.dart';

class OrderCancelController extends GetxController {
  Rx<CancelModel>? cancelOrderList;

  getCancelOrderList() async {
    log("CANCEL");
    try {
      final res = await HTTPClient.getCancelOrders(
        APIs.allCancelOrder,
      );
      cancelOrderList = res.obs;
    } catch (stacktrace, error) {
      log(stacktrace.toString());
      log(error.toString());
    }

    update();
  }
}
