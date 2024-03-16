import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/home/controller/homeController.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';

import '../../../../utils/mediaQuery.dart';

class ProfileCard extends StatefulWidget {
  final HomeController controller;
  const ProfileCard({super.key, required this.controller});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                boxA3(),
                Text(
                  'Welcome,',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.controller.profileResponse!.value.user.name,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            CircleAvatar(
              radius: SizeConfig.Height * 0.05,

              // height: SizeConfig.Height * 0.09,
              // width: SizeConfig.Width * 0.18,
              // // padding: const EdgeInsets.all(12.0),
              // decoration: const BoxDecoration(color: AppColors.theme, shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: APIs.imageUrl +
                        widget.controller.profileResponse!.value.user
                            .profileImage,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://img.freepik.com/premium-photo/memoji-happy-man-white-background-emoji_826801-6839.jpg",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                        )),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 18.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    widget.controller.profileResponse!.value.user.rating
                            .toString() +
                        ' (' +
                        widget
                            .controller.profileResponse!.value.user.driverReview
                            .toString() +
                        ")",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.controller.profileResponse!.value.user
                              .onlineOffline ==
                          1
                      ? Colors.green.withOpacity(0.2)
                      : AppColors.theme.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.controller.profileResponse!.value.user
                                      .onlineOffline ==
                                  1
                              ? Colors.green
                              : AppColors.theme),
                    ),
                    Text(
                      widget.controller.profileResponse!.value.user
                                  .onlineOffline ==
                              1
                          ? '  AVAILABLE FOR WORK'
                          : '  UNAVAILABLE FOR WORK',
                      style: GoogleFonts.poppins(
                          color: widget.controller.profileResponse!.value.user
                                      .onlineOffline ==
                                  1
                              ? Colors.green
                              : AppColors.theme,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              CustomSwitch(
                value: widget
                        .controller.profileResponse!.value.user.onlineOffline ==
                    1, // Set your initial switch state
                onChanged: (value) {
                  setState(() {
                    widget.controller.updateOnlineStatus();
                  });
                  print(value);
                },
              ),
            ],
          ),
        ).paddingAll(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 14,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today Completed order',
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 12,
                            offset: Offset(3, 8),
                          ),
                        ],
                      ),
                      child: Text(
                        widget.controller.profileResponse!.value
                            .todayCompleteCount
                            .toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            boxB1(),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 14,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Completed order',
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purpleAccent.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 12,
                            offset: Offset(3, 8),
                          ),
                        ],
                      ),
                      child: Text(
                        widget.controller.profileResponse!.value
                            .totalCompleteCount
                            .toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16)
      ],
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  CustomSwitch({required this.value, required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged!(!widget.value);
      },
      child: Container(
        width: 45.0,
        height: 27.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.value ? Colors.grey : Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15.0),
          color: widget.value ? Colors.white : Colors.white,
        ),
        child: Align(
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.all(3),
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.value
                  ? Colors.green
                  : Colors.grey, // Set the dot color
            ),
          ),
        ),
      ),
    );
  }
}
