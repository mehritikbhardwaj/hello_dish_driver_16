import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
  
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/mediaQuery.dart';
import '../controller/environmentController.dart';

class aboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EnvironmentController environmentController = Get.put(
      EnvironmentController(),
    );
    return GetBuilder<EnvironmentController>(builder: (environmentController) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text('About US'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.Height * 0.15,
                // width: double.infinity,
                color: AppColors.theme,
                padding: EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.Height * 0.034,
                      child: Row(
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              RotateAnimatedText(
                                'Movie marathon ?',
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              RotateAnimatedText(
                                'Game Night ?',
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              RotateAnimatedText(
                                'Unexpeced Guest ?',
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              RotateAnimatedText(
                                'Cooking gone wrong ?',
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              RotateAnimatedText(
                                'Late night at office ?',
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              RotateAnimatedText(
                                'Hungry ?',
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                            repeatForever: true,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Order food from favourite restaurants near you.",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restaurants in your pocket'.tr,
                      style: GoogleFonts.poppins(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ).paddingOnly(bottom: 10.0, top: 18.0),
                    Text(
                      "Order from your favorite restaurants & track on the go, with the all-new Hello Dish app."
                          .tr,
                      style: GoogleFonts.poppins(
                          fontSize: 14.0, fontWeight: FontWeight.w300),
                    ).paddingOnly(bottom: 5.0, top: 0.0),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About US'.tr,
                                style: GoogleFonts.poppins(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: appThemeColor),
                              ).paddingOnly(bottom: 5.0, top: 10.0),
                              Text(
                                "I started off by acquainting myself with the brand, inside out. My initial step was to clear all the questions I had, with respect to the business model, how does other earn revenue (since we pay for the food that we eat, right?), how it works and what is the plan of action, to be explicit.I learned few things from various sources but I shunned searching for any obvious sources available on the potential flaws, comparison done between both the applications on purpose, it was something I wanted to figure out on my own.Here’s what I discovered :"
                                    .tr,
                                style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300),
                              ).paddingOnly(bottom: 5.0, top: 0.0),
                            ])),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: appThemeColor,
                            radius: 5,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Type'.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0, fontWeight: FontWeight.w500),
                          ).paddingOnly(bottom: 0.0, top: 0.0),
                          Text(
                            ':  Delivery based start up'.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 12.0, fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: 0.0, top: 0.0),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: appThemeColor,
                            radius: 5,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Founders'.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0, fontWeight: FontWeight.w500),
                          ).paddingOnly(bottom: 0.0, top: 0.0),
                          Text(
                            ' : Bhavesh Soni, Nikunj'.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 12.0, fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: 0.0, top: 0.0),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: appThemeColor,
                            radius: 5,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Founded in '.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0, fontWeight: FontWeight.w500),
                          ).paddingOnly(bottom: 0.0, top: 0.0),
                          Text(
                            ' : 2023'.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 12.0, fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: 0.0, top: 0.0),
                        ],
                      ),
                    ),
                    Row(children: [
                      Image.asset(
                        "assets/images/HELLO DISH USER APP LOGO.png",
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'We are here to Serve \nGood FOOD at your Door step'
                              .tr,
                          style: GoogleFonts.poppins(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ).paddingOnly(bottom: 0.0, top: 0.0),
                      )
                    ])
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
