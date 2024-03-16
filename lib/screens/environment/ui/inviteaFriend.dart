import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/environmentController.dart';

class inviteaFriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EnvironmentController environmentController = Get.put(
      EnvironmentController(),
    );
    return GetBuilder<EnvironmentController>(builder: (environmentControllerc) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // This line removes the back arrow

          title: const Text('Invite a friend'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: Center(child: Image.asset('assets/images/Group 126936.png'))),
            Text(
              "\n🎉 Invite a Friend and Unlock Perks! 🎉",
              style: GoogleFonts.poppins(fontSize: 18.0),
            ),
            Text(
              "\nShare the excitement of HELLO DISH with friends! 🚀 Invite them to join, and you both get exclusive rewards.",
              style: GoogleFonts.poppins(fontSize: 14.0),
            ),
            Text(
              "\n🌟 How to Invite:",
              style: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            const Text(
              "1. Tap `Invite Friends` below.",
            ),
            const Text(
              "2. Select friends or share the invite link.",
            ),
            const Text(
              "3. Enjoy perks together!",
            ),
            const Text(
              "\nSnap a screenshot, tag us with #InviteJoy, and spread the love!  ❤️",
            ),
            Text(
              "\nTap `Invite Friends` now and let the fun begin! 🌈\n",
              style: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
                onPressed: () async {
                  Share.share('check out my website https://example.com');
                  // String url = 'tel:+91 7575757575';
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
                    const Icon(
                      Iconsax.link,
                      size: 18.0,
                    ).paddingOnly(right: 12.0),
                    const Text("Invite a friend"),
                  ],
                )),
          ],
        ).paddingAll(18.0),
      );
    });
  }
}
