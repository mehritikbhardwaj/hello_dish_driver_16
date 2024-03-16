// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/authentication/login/model/loginResponseModel.dart';
import 'package:hello_dish_driver/screens/authentication/login/ui/loginScreen.dart';
import 'package:hello_dish_driver/screens/home/controller/homeController.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:hello_dish_driver/utils/const.dart';
import 'package:hello_dish_driver/utils/language_dropdown.dart';
import 'package:hello_dish_driver/utils/mediaQuery.dart';
import 'package:hello_dish_driver/utils/shared_pref..dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/localeString.dart';
import 'aboutUs.dart';
import 'customerHelp.dart';
import 'inviteaFriend.dart';
import 'profileEdit.dart';
import 'termsPrivacy.dart';

class EnvironmentScreen extends StatefulWidget {
  const EnvironmentScreen({super.key});

  @override
  State<EnvironmentScreen> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // environmentContr.setProfileData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // profile
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
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
                                homeController
                                    .profileResponse!.value.user.profileImage,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      "https://img.freepik.com/premium-photo/memoji-happy-man-white-background-emoji_826801-6839.jpg",
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                )),
                      ),
                    ),
                  ),
                  boxB1(),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: SizeConfig.Width * 0.6,
                          child: Text(
                              homeController.profileResponse!.value.user.name,
                              style: GoogleFonts.poppins(
                                  fontSize: 22.0, fontWeight: FontWeight.w500)),
                        ).paddingOnly(bottom: 6.0),
                        Text(homeController.profileResponse!.value.user.phone,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                            )),
                      ],
                    ),
                  ),
                  boxB1(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ProfileEditScreen());
                    },
                    child: const Icon(
                      Iconsax.edit_2,
                      // color: darkGrey,
                    ),
                  ),
                ],
              ),
              //
              boxA2(),
              customDevider(),
              boxA2(),

              SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Bank'),
                      subtitle: const Text(
                        "Add or Update bank details",
                      ),
                      titleTextStyle: GoogleFonts.poppins(
                          fontSize: 15.0, color: Colors.black),
                      subtitleTextStyle: GoogleFonts.poppins(
                          fontSize: 12.0, color: AppColors.grey),
                      leading: const Icon(Iconsax.bank),
                      onTap: () {
                        // languageBottomSheet(context);
                      },
                    ),
                    ListTile(
                      title: Text('App Language'.tr),
                      subtitle: Text(
                          "${LocaleString().keys[SharedPref.shared.pref?.getString(PrefKeys.appLanguage)]?['languageName'] == null ? "Select Language" : LocaleString().keys[SharedPref.shared.pref?.getString(PrefKeys.appLanguage)]?['languageName']}"),
                      titleTextStyle: GoogleFonts.poppins(
                          fontSize: 15.0, color: Colors.black),
                      subtitleTextStyle: GoogleFonts.poppins(
                          fontSize: 12.0, color: Colors.black),
                      leading: const Icon(Iconsax.global),
                      onTap: () {
                        languageBottomSheet(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Invite a friend'),
                      subtitle: const Text('Invite via SMS, WhataApp, etc..'),
                      titleTextStyle: GoogleFonts.poppins(
                          fontSize: 15.0, color: Colors.black),
                      subtitleTextStyle: GoogleFonts.poppins(
                          fontSize: 12.0, color: AppColors.grey),
                      leading: const Icon(Iconsax.link),
                      onTap: () {
                        Get.to(() => inviteaFriendScreen());
                      },
                    ),
                    ListTile(
                      title: const Text('Customer Help'),
                      subtitle: const Text(
                        'FAQ, Feedback, Chat/Call',
                      ),
                      titleTextStyle: GoogleFonts.poppins(
                          fontSize: 15.0, color: Colors.black),
                      subtitleTextStyle: GoogleFonts.poppins(
                          fontSize: 12.0, color: AppColors.grey),
                      leading: const Icon(Iconsax.messages_2),
                      onTap: () {
                        Get.to(() => CustomerHelpScreen());
                      },
                    ),
                    ListTile(
                      title: const Text('Terms and Privacy Policy'),
                      subtitle: const Text("Your Data and User Rights"),
                      titleTextStyle: GoogleFonts.poppins(
                          fontSize: 15.0, color: Colors.black),
                      subtitleTextStyle: GoogleFonts.poppins(
                          fontSize: 12.0, color: AppColors.grey),
                      leading: const Icon(Iconsax.document_text_1),
                      onTap: () {
                        Get.to(() => const TermsAndPrivacyScreen());
                      },
                    ),
                    ListTile(
                      title: const Text('About us'),
                      subtitle: const Text(
                        'Who We Are, The Heart of "THE HELLODISH',
                      ),
                      titleTextStyle: GoogleFonts.poppins(
                          fontSize: 15.0, color: Colors.black),
                      subtitleTextStyle: GoogleFonts.poppins(
                          fontSize: 12.0, color: AppColors.grey),
                      leading: const Icon(Iconsax.info_circle),
                      onTap: () {
                        Get.to(() => aboutUsScreen());
                      },
                    ),
                    InkWell(
                      onTap: () {
                        SharedPref.shared.pref?.setInt(PrefKeys.isLoggedIn, 0);

                        Get.offAll(const LoginScreen());
                      },
                      child: ListTile(
                        title: InkWell(
                          onTap: () {
                            SharedPref.shared.pref
                                ?.setInt(PrefKeys.isLoggedIn, 0);

                            Get.offAll(const LoginScreen());
                          },
                          child: const Text(
                            'Logout',
                          ),
                        ),
                        titleTextStyle: GoogleFonts.poppins(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.redGradient),
                        leading: const Icon(Iconsax.logout_1,
                            color: AppColors.redGradient),
                        onTap: () {
                          // SharedPref.shared.pref?.remove(PrefKeys.userID);
                          Get.offAll(() => LoginScreen());
                        },
                      ),
                    ),
                    // const Spacer(),
                    // const Text('App Version : 1.0.0'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
