import 'package:get/get.dart';

import '../../../utils/api_manager/apis.dart';
import '../../../utils/api_manager/http_client.dart';
import '../model/orderModel.dart';

class OrderController extends GetxController{
  Rx<AllOrder>? allOrderList;

  getOrderList() async {
    final res = await HTTPClient.getAllOrders(
      APIs.allOrderHistory ,
    );
    allOrderList=res.obs;
    update();
  }
  getCollectOrder(id,type ) async{
    await HTTPClient.getCollectOrder(APIs.collectOrder+'/'+id.toString()+'/'+type.toString());
  }
}