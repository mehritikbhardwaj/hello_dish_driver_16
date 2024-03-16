import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/custom_button.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/custom_text__field.dart';
import 'package:hello_dish_driver/screens/authentication/createPassword/ui/successPage.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isVisible = false;
  bool _isVisible1 = false;
  IconData _icon = Icons.visibility_off;
  IconData _icon1 = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    final th = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF7F9FC),
          leading: InkWell(
              onTap: () {
                Get.back();
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
                'Create a New Password',
                style: th.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Set a strong and secure password for your account to ensure your food orders are safe and sound.',
                style: th.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.grey),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Password ',
                style: th.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
              SizedBox(
                height: 80,
                child: Center(
                  child: DCustomTextField(
                    obscureText: !_isVisible,
                    suffixIcon: _icon,
                    controller: passwordController,
                    prefixIcon: Icons.lock_outlined,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    onTap: () {},
                    hintText: 'Enter your password',
                    onIconTap: () {
                      setState(() {
                        _isVisible = !_isVisible;
                        _icon = _isVisible
                            ? Icons.visibility
                            : Icons.visibility_off;
                      });
                    },
                  ),
                ),
              ),
              Text(
                'Confirm Password ',
                style: th.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
              SizedBox(
                height: 80,
                child: Center(
                  child: DCustomTextField(
                    obscureText: !_isVisible1,
                    suffixIcon: _icon1,
                    controller: confirmPasswordController,
                    prefixIcon: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    hintText: 'Confirm your Password',
                    onIconTap: () {
                      setState(() {
                        _isVisible1 = !_isVisible1;
                        _icon1 = _isVisible1
                            ? Icons.visibility
                            : Icons.visibility_off;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: CustomRoundedElevatedButton(
                  text: 'Reset Password',
                  onPressed: () {
                    Get.to(const SuccessPageScreen());
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
