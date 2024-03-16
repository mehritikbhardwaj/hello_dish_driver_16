import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/custom_button.dart';
import 'package:hello_dish_driver/screens/authentication/createPassword/ui/createPasswordScreen.dart';
import 'package:hello_dish_driver/screens/authentication/login/ui/loginScreen.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    super.dispose();
  }

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
          child: InkWell(
            splashColor: Colors.transparent, // Set splash color to transparent

            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verification Code',
                  style: th.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Check your email for the verification code and enter it here to secure your account.',
                  style: th.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.grey),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: PinCodeTextField(
                        obscureText: true,
                        blinkWhenObscuring: true,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade800),
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(100),
                          fieldHeight: 55,
                          fieldWidth: 45,
                          inactiveColor: AppColors.white,
                          activeColor: AppColors.white,
                          selectedFillColor: AppColors.white,
                          activeFillColor: AppColors.white,
                          inactiveFillColor: AppColors.white,
                          selectedColor: appThemeColor,
                        ),
                        controller: otpController,
                        cursorColor: appThemeColor,
                        cursorHeight: 16,
                        keyboardType: TextInputType.number,
                        appContext: context,
                        length: 6,
                        animationType: AnimationType.scale,
                        enableActiveFill: true,
                        validator: (otpController) {
                          if (otpController == null || otpController.isEmpty) {
                            return 'Enter Otp';
                          }
                          if (otpController.length < 6) {
                            return 'Otp Should be 6 digit';
                          }
                        },
                        //
                        onChanged: (pin) async {}),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: CustomRoundedElevatedButton(
                    text: 'Verify and Continue',
                    onPressed: () {
                      Get.to(const CreatePasswordScreen());
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Didn't get the OTP?",
                        style: th.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500, color: AppColors.grey),
                        children: [
                          TextSpan(
                              text: " Resend",
                              style: TextStyle(
                                color: appThemeColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
