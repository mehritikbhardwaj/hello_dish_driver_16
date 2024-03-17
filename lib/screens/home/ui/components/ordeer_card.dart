import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/home/controller/homeController.dart';
import 'package:hello_dish_driver/screens/home/model/activeOrdersModel.dart';
import 'package:hello_dish_driver/screens/home/ui/order_tracking.dart';
import 'package:hello_dish_driver/screens/order/ui/completed_otrders.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:hello_dish_driver/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/AppColors.dart';
import '../../../../utils/const.dart';
import '../../../../utils/mediaQuery.dart';
import '../../../../utils/sizedBox.dart';
import '../../controller/getalllcontroller.dart';

driverOrderCard(
  int index,
  DatumOrderActive list,
) {
  return GestureDetector(
    onTap: () {
      Get.to(DriverOrderTrackingScreen(
        list: list,
      ));
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                        (list.driverAcceptStatus == 1 && list.status == 2)
                            ? "Preparing Food"
                            : list.status == 3
                                ? "Ready for Pickup"
                                : list.driverAcceptStatus == 0
                                    ? "Pending Order"
                                    : list.status == 4
                                        ? "Out for Delivery"
                                        : "Order completed",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ).paddingOnly(left: 12.0)
                    ],
                  ),
                  boxA2(),
                  Row(children: [
                    Text(
                      "${list.orderItems.first.quantity} X ",
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                    Text(list.orderItems.first.item,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500))
                  ]),
                  Text("₹ ${list.orderItems.first.price}"),
                  boxA2(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.Height * 0.09,
                    width: SizeConfig.Width * 0.18,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: (APIs.imageUrl +
                                list.orderItems.first.image) ??
                            "https://assets.gqindia.com/photos/6213cbed18140d747a9b0a6e/16:9/w_1920,h_1080,c_limit/new%20restaurant%20menus%20in%20Mumbai.jpg",
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Iconsax.user),
                      ),
                    ),
                  ),
                  list.orderItems.length > 1
                      ? Text(
                          "(+${list.orderItems.length - 1} items)",
                          style: TextStyle(fontSize: 12),
                        )
                      : Text('')
                ],
              ),
            ),
          ],
        ),
        Divider(
          color: AppColors.grey,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("₹ ${list.orderPrice} /- "),
          Text(Utils.convertTimestamp(list.createdAt),
              style: GoogleFonts.poppins(color: AppColors.grey, fontSize: 12))
        ]),
        boxA1(),
        boxA1(),
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.find<HomeController>().rejectAndCancelOrder(list.id, 0);
                Get.find<HomeController>().getCurrentActiveOrder();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
            (list.driverAcceptStatus == 1 && list.status > 2)
                ? Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.find<HomeController>()
                              .rejectAndCancelOrder(list.id, 1);
                          Get.find<HomeController>().getCurrentActiveOrder();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
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
                : Container(),
            boxB1(),
            list.driverAcceptStatus == 1
                ? Container()
                : ElevatedButton(
                    onPressed: () {
                      Get.find<HomeController>().getCollectOrder(list.id, 1);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.redGradient)),
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

driverOrdersCard() {
  return GetBuilder<HomeController>(builder: (c) {
    log(c.ordersList.length.toString());
    if (c.ordersList.isNotEmpty) {
      return ListView.builder(
          itemCount: c.ordersList.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final list = c.ordersList[index];
            return driverOrderCard(index, list);
          });
    } else {
      return Container();
    }
  });
}
