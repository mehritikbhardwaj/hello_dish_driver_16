import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/order/controller/order_controller.dart';

import '../../../utils/mediaQuery.dart';
import '../../../utils/sizedBox.dart';
import '../components/order_cards.dart';
import 'oder_status.dart';

class ActiveOrdersScreeen extends StatefulWidget {
  const ActiveOrdersScreeen({super.key});

  @override
  State<ActiveOrdersScreeen> createState() => _ActiveOrdersScreeenState();
}

class _ActiveOrdersScreeenState extends State<ActiveOrdersScreeen> {
  final OrderController controller = Get.put(OrderController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getOrderList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        builder: (c) => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                body: SafeArea(
                  child: GetBuilder<OrderController>(builder: (c) {
                    return Container(
                      height: SizeConfig.Height * 0.9,
                      width: double.infinity,
                      child: Container(
                        height: SizeConfig.Height * 0.9,
                        child: ListView.builder(
                            itemCount: c.activeList.length,
                            itemBuilder: (context, index) {
                              //  if (c.allOrderList!.value.data[index].status <5 && c.allOrderList!.value.data[index].cancelStatus==0) {
                              final list = c.activeList[index];
                              return SizedBox(
                                width: SizeConfig.Width * 1,
                                child: orderCard(() {
                                  Get.to(OrderStatus(
                                    list: list,
                                  ));
                                },
                                    list.status < 5 &&
                                        list.driverAcceptStatus == 1,
                                    list.orderItems[0].quantity,
                                    list.orderItems[0].item,
                                    list.orderItems[0].price,
                                    list.orderItems[0].image,
                                    list.totalCost.toStringAsFixed(2),
                                    list.createdAt,
                                    list.id,
                                    list.status < 5 && list.status == 4,
                                    list),
                              ).paddingOnly(left: 18.0, right: 18.0);
                              //  }
                              // else {
                              //   return SizedBox.shrink();
                              // }
                            }),
                      ),
                    );
                  }),
                ),
              ));
  }
}
