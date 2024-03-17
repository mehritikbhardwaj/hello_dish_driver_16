import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/order/controller/order_controller.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/const.dart';
import '../../../utils/mediaQuery.dart';
import '../../../utils/sizedBox.dart';
import '../controller/cancel_order_controller.dart';
import 'completed_otrders.dart';
import 'oder_status.dart';

class CancelOrdersScreeen extends StatelessWidget {
  const CancelOrdersScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OrderCancelController>(builder: (c) {
          if (c.cancelOrderList.toString() != 'null') {
            return Container(
              height: SizeConfig.Height * 0.9,
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: c.cancelOrderList?.value.data.length,
                  itemBuilder: (context, index) {
                    if (c.cancelOrderList!.value.data[index].cancelStatus ==
                        1) {
                      final list = c.cancelOrderList!.value.data[index];
                      return SizedBox(
                        width: SizeConfig.Width * 1,
                        child: cancelOrderCard(() {
                          // Get.to(OrderStatus(list: list,));
                        },
                            list.orderItems[0].quantity,
                            list.orderItems[0].item,
                            list.orderItems[0].price,
                            list.orderItems[0].image,
                            list.orderPrice,
                            list.createdAt),
                      ).paddingOnly(left: 18.0, right: 18.0);
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}

cancelOrderCard(
    onPressed, quantity, item, price, imgUrl, orderPrice, createdAt) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: SizeConfig.Height * 0.024,
                      width: SizeConfig.Width * 0.01,
                      decoration: BoxDecoration(
                          color: AppColors.redGradient,
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                    Text(
                      "Order Canceled",
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ).paddingOnly(left: 12.0)
                  ],
                ),
                boxA2(),
                Row(children: [
                  Text(
                    "$quantity X ",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                  Text(item,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500))
                ]),
                Text("₹ $price"),
                boxA1(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: SizeConfig.Height * 0.09,
              width: SizeConfig.Width * 0.18,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22.0),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: APIs.imageUrl + imgUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Image.network(
                      "https://assets.gqindia.com/photos/6213cbed18140d747a9b0a6e/16:9/w_1920,h_1080,c_limit/new%20restaurant%20menus%20in%20Mumbai.jpg"),
                ),
              ),
            ),
          ),
        ],
      ),
      Divider(
        color: Colors.grey.shade300,
      ),
      boxA1(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text("₹ $orderPrice /- "),
          ]),
          Text(formatDate(createdAt),
              style: GoogleFonts.poppins(color: AppColors.grey, fontSize: 12))
        ],
      ),
      boxA3(),
      customDevider(),
      boxA3(),
    ],
  );
}
