// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/custom_button.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/custom_text__field.dart';
import 'package:hello_dish_driver/screens/authentication/forgotPassword/ui/forgotPasswordScreen.dart';
import 'package:hello_dish_driver/screens/authentication/login/controller/loginController.dart';
import 'package:hello_dish_driver/screens/home/dashboard_screen.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';

import '../../signup/ui/signUpscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  IconData _icon = Icons.visibility_off;
  final LoginController loginContr = Get.put(LoginController());

  @override
  void dispose() {
    loginContr.emailController.dispose();
    loginContr.passwordController.dispose();
    super.dispose();
  }

  String? validateField(String? value, {String? customErrorMessage}) {
    if (value == null || value.isEmpty) {
      return customErrorMessage ?? 'This field is required';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }

    // if (value.length < 8) {
    //   return 'Password must be at least 8 characters.';
    // }

    // final List<Map<RegExp, String>> patterns = [
    //   {RegExp(r'[a-z]'): 'Lowercase letter'},
    //   {RegExp(r'[A-Z]'): 'Uppercase letter'},
    //   {RegExp(r'[0-9]'): 'Numeric digit'},
    //   {
    //     RegExp(r'[!@#\$%^&*()_+{}|:<>?~]'):
    //         'Special character\n like :!@#\$%^&*()_+{}|:<>?~'
    //   },
    // ];

    // for (final pattern in patterns) {
    //   final entry = pattern.entries.first;
    //   if (!entry.key.hasMatch(value)) {
    //     return 'Password must contain ${entry.value}.';
    //   }
    // }

    return null;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _dropDownValue = 'English (India)';
  @override
  Widget build(BuildContext context) {
    final th = Theme.of(context).textTheme;
    return GetBuilder<LoginController>(
      builder: (c) => Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'By continuing, you agree to our',
                  style: th.bodyMedium?.copyWith(color: Colors.grey),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms of sevice',
                      style: th.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    Container(
                      height: 15,
                      width: 1,
                      color: Colors.grey,
                      margin: EdgeInsets.only(left: 5, right: 5),
                    ),
                    Text(
                      'Privacy Policy',
                      style: th.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    Container(
                      height: 15,
                      width: 1,
                      color: Colors.grey,
                      margin: EdgeInsets.only(left: 5, right: 5),
                    ),
                    Text(
                      'Content Policy',
                      style: th.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    underline: Container(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    hint: Text(
                      _dropDownValue,
                      style: th.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                    items: <String>[
                      'English (India)',
                      'Hindi',
                      'Gujarati',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: th.bodyMedium?.copyWith(color: Colors.grey),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownValue = val!;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome back!',
                      style: th.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Image.asset(
                      'assets/images/loginIcon.png',
                      height: 120,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text(
                    'Phone or mail ',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ),
                Center(
                  child: DCustomTextField(
                    controller: loginContr.emailController,
                    labelText: '',
                    // prefixIcon: Icons.person,
                    keyboardType: TextInputType.name,
                    onTap: () {}, hintText: 'Enter your phone or email',
                    validator: (value) => validateField(value,
                        customErrorMessage: 'Please enter your Email'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Text(
                    'Password ',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ),
                Center(
                  child: DCustomTextField(
                    obscureText: !loginContr.isVisible.value,
                    suffixIcon: _icon,
                    controller: loginContr.passwordController,
                    keyboardType: TextInputType.name,
                    onTap: () {},
                    hintText: 'Enter your password',
                    validator: validatePassword,
                    onIconTap: () {
                      setState(() {
                        loginContr.isVisible.value =
                            !loginContr.isVisible.value;
                        _icon = loginContr.isVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ForgotPasswordScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: th.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomRoundedElevatedButton(
                  text: 'Log In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginContr.loginFunction();
                    }
                    // Get.offAll(const DashboardScreen());
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "OR",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/apple.png',
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/icons/google.png',
                      height: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: th.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(const SignUpScreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: th.bodyMedium?.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
