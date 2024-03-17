import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/order/controller/order_controller.dart';
import 'package:hello_dish_driver/screens/order/model/orderModel.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/const.dart';
import '../../../utils/mediaQuery.dart';
import '../../../utils/sizedBox.dart';
import '../ui/completed_otrders.dart';

orderCard(
  onPressed,
  isready,
  quantity,
  item,
  price,
  imgUrl,
  orderPrice,
  createdAt,
  orderId,
  isPicked,
  DatumOrders list,
) {
  return GestureDetector(
    onTap: () {
      onPressed();
    },
    child: Column(
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
                        list.status == 2
                            ? "Preparing Food"
                            : list.status == 3
                                ? "Order ready to pick"
                                : "Out for Delivery",
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
                  boxA2(),
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
                      "https://assets.gqindia.com/photos/6213cbed18140d747a9b0a6e/16:9/w_1920,h_1080,c_limit/new%20restaurant%20menus%20in%20Mumbai.jpg",
                    ),
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
              Text(list.paymentType == "prepayment" ? "Paid" : "Unpaid",
                  style: GoogleFonts.poppins(color: AppColors.redGradient))
            ]),
            Text(formatDate(createdAt),
                style: GoogleFonts.poppins(color: AppColors.grey, fontSize: 12))
          ],
        ),
        boxA1(),
        isready
            ? isPicked
                ? Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.redGradient)),
                        onPressed: () async {
                          Get.find<OrderController>()
                              .getCollectOrder(orderId, 5);
                          await Get.find<OrderController>().getOrderList();
                        },
                        child: const Text("Complete Order"),
                      ),
                      boxB2(),
                      InkWell(
                        onTap: () async {
                          Get.find<OrderController>()
                              .rejectAndCancelOrder(orderId, 1);
                          await Get.find<OrderController>().getOrderList();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: AppColors.redGradient)),
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.redGradient)),
                            onPressed: () async {
                              Get.find<OrderController>()
                                  .getCollectOrder(orderId, 4);
                              await Get.find<OrderController>().getOrderList();
                            },
                            child: const Text("Collect Order"),
                          ),
                        ],
                      ),
                      boxB2(),
                      InkWell(
                        onTap: () async {
                          Get.find<OrderController>()
                              .rejectAndCancelOrder(orderId, 1);
                          await Get.find<OrderController>().getOrderList();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: AppColors.redGradient)),
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  )
            : Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: AppColors.redGradient)),
                      child: Text(
                        'Reject',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  boxB1(),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.redGradient)),
                    onPressed: () {
                      Get.find<OrderController>().getCollectOrder(orderId, 1);
                      Get.find<OrderController>().getOrderList();
                    },
                    child: const Text("Accept"),
                  ),
                ],
              ),
        boxA3(),
        customDevider(),
        boxA3(),
      ],
    ),
  );
}
