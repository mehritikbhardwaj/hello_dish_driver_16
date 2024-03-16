import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:iconsax/iconsax.dart';

import '../controller/environmentController.dart';
import '../model/faqModel.dart';

class CustomerHelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EnvironmentController environmentController = Get.put(
      EnvironmentController(),
    );
    return GetBuilder<EnvironmentController>(builder: (environmentControllerc) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // This line removes the back arrow

          title: Text('Customer Help'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                      onPressed: () async {
                        String url = 'tel:+91 7575757575';
                        // if (!await launchUrl(Uri.parse(url),
                        //     mode: LaunchMode.externalApplication)) {
                        //   throw Get.rawSnackbar(
                        //     message: "Available Soon",
                        //     title: "Call Support Currently Unavailable",
                        //     duration: const Duration(seconds: 3),
                        //   );
                        // }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.call,
                            size: 18.0,
                          ).paddingOnly(right: 12.0),
                          const Text("Talk to us !"),
                        ],
                      )),
                ),
                Spacer(),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.theme),
                        foregroundColor: MaterialStatePropertyAll(
                            AppColors.backgroundblueColour),
                      ),
                      onPressed: () async {
                        String url =
                            'https://wa.me/+917575757575?text=${Uri.encodeQueryComponent("Hello !!! ")}';
                        // if (!await launchUrl(Uri.parse(url),
                        //     mode: LaunchMode.externalApplication)) {
                        //   throw Get.rawSnackbar(
                        //     message: "Available Soon",
                        //     title: "Chat Support Currently Unavailable",
                        //     duration: const Duration(seconds: 3),
                        //   );
                        // }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.message,
                            size: 18.0,
                          ).paddingOnly(right: 12.0),
                          const Text("Chat"),
                        ],
                      )),
                )
              ],
            ),
            Text(
              'FAQs'.tr,
              style: GoogleFonts.poppins(
                  fontSize: 24.0, fontWeight: FontWeight.w500),
            ).paddingOnly(bottom: 18.0, top: 18.0),
            ListView.builder(
                shrinkWrap: true,
                itemCount: FAQmodel.questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors
                          .transparent, // Set divider color to transparent
                    ),
                    child: ExpansionTile(
                      title: Text(FAQmodel.questions[index].que.tr),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                          child: Text(
                            FAQmodel.questions[index].ans.tr,
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ).paddingAll(18.0),
      );
    });
  }
}
