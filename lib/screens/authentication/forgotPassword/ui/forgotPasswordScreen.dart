import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/custom_button.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/custom_text__field.dart';
import 'package:hello_dish_driver/screens/authentication/login/ui/loginScreen.dart';
import 'package:hello_dish_driver/screens/authentication/otpVeriification/ui/otpVerificationScreen.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account?',
                style: th.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  //   Get.offAll(const SignUpScreen());
                },
                child: Text(
                  'Sign Up ',
                  style: th.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600, color: appThemeColor),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xffF7F9FC),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Your Password?',
                style: th.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Don’t worry we’ve got you covered. Enter your email, and we’ll help you reset your password.',
                style: th.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.grey),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Email Address',
                style: th.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
              SizedBox(
                height: 80,
                child: Center(
                  child: DCustomTextField(
                    controller: emailController,
                    prefixIcon: Icons.mail_outline,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    onTap: () {},
                    hintText: 'example@gmail.com',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: CustomRoundedElevatedButton(
                  text: 'Send mail',
                  onPressed: () {
                    Get.to(const OtpVerificationScreen());
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
