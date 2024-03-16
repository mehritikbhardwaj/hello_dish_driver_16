import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/custom_button.dart';
import 'package:hello_dish_driver/screens/authentication/login/ui/loginScreen.dart';

class SuccessPageScreen extends StatefulWidget {
  const SuccessPageScreen({super.key});

  @override
  State<SuccessPageScreen> createState() => _SuccessPageScreenState();
}

class _SuccessPageScreenState extends State<SuccessPageScreen> {
  @override
  Widget build(BuildContext context) {
    final th = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF7F9FC),
          leading: InkWell(
              onTap: () {
                Get.offAll(const LoginScreen());
              },
              child: const Icon(Icons.arrow_back_ios)),
        ),
        backgroundColor: const Color(0xffF7F9FC),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Check Icon.png",
                    height: 55,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/images/Heading and Description.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: CustomRoundedElevatedButton(
                      text: 'Continue',
                      onPressed: () {
                        Get.offAll(const LoginScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
