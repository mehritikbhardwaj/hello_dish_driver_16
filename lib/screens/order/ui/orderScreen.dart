import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/order/ui/active_orders.dart';
import 'package:hello_dish_driver/screens/order/ui/cancel_order.dart';

import '../../../utils/AppColors.dart';
import '../controller/order_controller.dart';
import 'completed_otrders.dart';

class OderScreen extends StatelessWidget {
  const OderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    Get.find<OrderController>().getOrderList();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(0, 1),
                    blurRadius: 9,
                  ),
                ],
              ),
              width: double.infinity,
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        surfaceVariant: Colors.transparent,
                      ),
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: AppColors.redGradient,
                      borderRadius: BorderRadius.circular(16.0)),
                  tabs: const [
                    Tab(text: 'Active'),
                    Tab(text: 'Completed'),
                    Tab(text: 'Cancelled'),
                  ],
                ),
              ),
            ).paddingAll(18.0),
            const Expanded(
              child: TabBarView(
                children: [
                  ActiveOrdersScreeen(),
                  CompletedOrdersScreeen(),
                  CancelOrdersScreeen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
