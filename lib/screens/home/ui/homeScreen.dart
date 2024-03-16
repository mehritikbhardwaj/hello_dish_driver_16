import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/home/controller/homeController.dart';
import 'package:hello_dish_driver/utils/shared_pref..dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/mediaQuery.dart';
import '../../../utils/sizedBox.dart';
import '../controller/getalllcontroller.dart';
import 'components/ordeer_card.dart';
import 'components/profileCard.dart';
import 'order_tracking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController(), permanent: true);

  @override
  void initState() {
    super.initState();
    Get.put(GetAllOrderController());
    Get.find<GetAllOrderController>().getOrderList();
    SharedPref.shared.getPref();
    controller.getProfileResponse();

    controller.getCurrentLoc(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (c) => Scaffold(
              appBar: AppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Iconsax.location,
                          size: 20.0,
                        ).paddingOnly(right: 2.0),
                        Text(
                          controller.name.value,
                          style: GoogleFonts.poppins(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      controller.area.value,
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                      ),
                    ).paddingOnly(top: 3.0),
                  ],
                ),
                // actions: [const Icon(Iconsax.notification).paddingAll(18.0)],
              ),
              body: controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileCard(
                          controller: controller,
                        ),
                        // boxA3(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: GoogleFonts.poppins(color: AppColors.grey),
                            ),
                            Text(
                              'OnBoard',
                              style: GoogleFonts.poppins(fontSize: 24.0),
                            ),
                          ],
                        ).paddingAll(18.0),

                        SizedBox(
                          width: SizeConfig.Width * 1,
                          child: driverOrdersCard(onPressed: () {
                            Get.to(DriverOrderTrackingScreen());
                          }),
                        ).paddingOnly(left: 18.0, right: 18.0),
                      ],
                    )),
            ));
  }
}
