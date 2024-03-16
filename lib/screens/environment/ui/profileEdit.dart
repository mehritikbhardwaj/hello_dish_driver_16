import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/environment/controller/profileController.dart';
import 'package:hello_dish_driver/screens/home/controller/homeController.dart';
import 'package:hello_dish_driver/utils/api_manager/apis.dart';
import 'package:hello_dish_driver/utils/const.dart';
import 'package:hello_dish_driver/utils/mediaQuery.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';

import 'package:iconsax/iconsax.dart';

import '../../authentication/login/model/loginResponseModel.dart';

class ProfileEditScreen extends StatefulWidget {
  final user;
  // final User  user;
  const ProfileEditScreen({
    super.key,
    this.user,
  });

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.nameController.text =
        homeController.profileResponse!.value.user.name;

    profileController.emailController.text =
        homeController.profileResponse!.value.user.email;
    profileController.numberController.text =
        homeController.profileResponse!.value.user.phone;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios)),
          automaticallyImplyLeading: false,
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  profileController.profileEditImg != null
                      ? CircleAvatar(
                          radius: SizeConfig.Height * 0.06,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.file(
                                profileController.profileEditImg!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: SizeConfig.Height * 0.06,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: APIs.imageUrl +
                                    homeController.profileResponse!.value.user
                                        .profileImage,
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
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        profileController.editImg();
                      },
                      child: Container(
                        height: SizeConfig.Height * 0.04,
                        width: SizeConfig.Width * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Iconsax.camera,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              boxA3(),
              customDevider(),
              boxA3(),
              TextFormField(
                controller: profileController.nameController,
                readOnly: true,
                decoration: const InputDecoration(
                  prefixIcon: InkWell(
                    child: Icon(
                      Iconsax.user,
                    ),
                  ),
                  hintText: 'Full Name',
                ),
                onChanged: (string) {},
              ).paddingAll(18.0),
              TextFormField(
                readOnly: true,
                enableInteractiveSelection: false,
                controller: profileController.emailController,
                decoration: const InputDecoration(
                  prefixIcon: InkWell(
                    child: Icon(
                      Iconsax.sms,
                    ),
                  ),
                  hintText: 'Email Address',
                ),
                onChanged: (string) {},
              ).paddingAll(18.0),
              TextFormField(
                enableInteractiveSelection: false,
                readOnly: true,
                controller: profileController.numberController,
                decoration: const InputDecoration(
                  prefixIcon: InkWell(
                    child: Icon(
                      Iconsax.sms,
                    ),
                  ),
                  hintText: 'Number',
                ),
                onChanged: (string) {},
              ).paddingAll(18.0),
              boxA3(),
              SizedBox(
                      width: double.infinity,
                      height: SizeConfig.Width * 0.12,
                      child: ElevatedButton(
                          onPressed: () async {
                            await profileController.updateProfilePic();
                            setState(() {});
                          },
                          child: const Text("Save")))
                  .paddingAll(18.0)
            ],
          ).paddingAll(18.0),
        ),
      );
    });
  }
}
