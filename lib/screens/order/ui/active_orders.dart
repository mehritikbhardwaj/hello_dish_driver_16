import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/order/controller/order_controller.dart';

import '../../../utils/mediaQuery.dart';
import '../../../utils/sizedBox.dart';
import '../components/order_cards.dart';
import 'oder_status.dart';

class ActiveOrdersScreeen extends StatelessWidget {
  const ActiveOrdersScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         boxA1(),
    //         SizedBox(
    //           width: SizeConfig.Width * 1,
    //           child: orderCard(() {Get.to(OrderStatus());}, true),
    //         ).paddingOnly(left: 18.0, right: 18.0),
    //         // boxA3(),
    //         SizedBox(
    //           width: SizeConfig.Width * 1,
    //           child: orderCard(() {}, false),
    //         ).paddingOnly(left: 18.0, right: 18.0),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OrderController>(
          builder: (c) {
            if(c.allOrderList?.value.data!=null) {
              return Container(
                height: SizeConfig.Height * 0.9,
                width: double.infinity,
                child: Container(
                  height: SizeConfig.Height * 0.9,
                  child: ListView.builder(
                      itemCount: c.allOrderList?.value.data.length,
                      itemBuilder: (context, index) {
                        if (c.allOrderList!.value.data[index].status <5 && c.allOrderList!.value.data[index].cancelStatus==0) {
                          final list=c.allOrderList!.value.data[index];
                          return SizedBox(
                            width: SizeConfig.Width * 1,
                            child: orderCard(() {
                              Get.to(OrderStatus());
                            }, list.status<5 && list.driverAcceptStatus==1,list.orderItems[0].quantity,
                                list.orderItems[0].item,
                                list.orderItems[0].price,
                                list.orderItems[0].image,list.orderPrice,list.createdAt,list.id,list.status<5 && list.status==4),
                          ).paddingOnly(left: 18.0, right: 18.0);
                        }
                        else {
                          return SizedBox.shrink();
                        }
                      }),
                ),
              );
            }
            else{
              return Container();
            }
          }
        ),
      ),
    );
  }
}
