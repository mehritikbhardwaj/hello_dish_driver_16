import 'package:get/get.dart';

import '../../../utils/api_manager/apis.dart';
import '../../../utils/api_manager/http_client.dart';
import '../../order/model/orderModel.dart';
import '../model/allModel.dart';

class GetAllOrderController extends GetxController{

  Rx<HomeAllOrder>? allHomeOrderList;

  getOrderList() async {
    final res = await HTTPClient.getHomeAllOrders(
      APIs.allOrder ,
    );
    allHomeOrderList=res.obs;
    update();
  }
  getCollectOrder(id,type ) async{
    await HTTPClient.getCollectOrder(APIs.collectOrder+'/'+id.toString()+'/'+type.toString());
  }
}