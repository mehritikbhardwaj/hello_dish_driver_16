import 'dart:developer';

import 'package:get/get.dart';

import '../../../utils/api_manager/apis.dart';
import '../../../utils/api_manager/http_client.dart';
import '../model/orderModel.dart';

class OrderController extends GetxController {
  Rx<AllOrder>? allOrderList;
  var activeList = <DatumOrders>[].obs;
  RxBool isLoading = false.obs;

  getOrderList() async {
    print(APIs.allOrderHistory.toString() + "URL");
    isLoading = true.obs;
    update();
    activeList.clear();
    update();
    try {
      final res = await HTTPClient.getAllOrders(
        APIs.allOrderHistory,
      );
      allOrderList = res.obs;
      for (int i = 0; i < allOrderList!.value.data.length; i++) {
        if (allOrderList!.value.data[i].status < 5 &&
            allOrderList!.value.data[i].cancelStatus == 0) {
          activeList.add(allOrderList!.value.data[i]);
        }
      }
    } catch (stacktrace, error) {
      log(stacktrace.toString());
      log(error.toString());
    }
    isLoading = false.obs;
    update();
  }

  getCollectOrder(id, type) async {
    isLoading = true.obs;
    update();
    await HTTPClient.getCollectOrder(
        APIs.collectOrder + '/' + id.toString() + '/' + type.toString());
    getOrderList();
  }

  rejectAndCancelOrder(id, type) async {
    isLoading = true.obs;
    update();
    await HTTPClient.deleteORder(APIs.rejectAndCancelOrder +
        '/' +
        id.toString() +
        '/' +
        type.toString());
    getOrderList();
    isLoading = false.obs;
    update();
  }
}
