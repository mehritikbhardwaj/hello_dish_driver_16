// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/authentication/signup/ui/add_information/upload_doc_screen.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';
import 'package:hello_dish_driver/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/AppColors.dart';
import '../../authWidgets/custom_button.dart';
import '../../authWidgets/custom_text__field.dart';
import '../../login/ui/loginScreen.dart';
import '../controller/signUpController.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  IconData _icon = Iconsax.eye_slash4;
  IconData _icon1 = Iconsax.eye_slash4;

  final SignupController signUpContr = Get.put(SignupController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2020, 8),
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2020, 8));
    if (picked != null && picked != signUpContr.selectedDate) {
      setState(() {
        signUpContr.selectedDate =
            "${picked.year}-${picked.month}-${picked.day.toString()}";
        print(picked.toString());
      });
    }
  }

  @override
  void dispose() {
    signUpContr.emailController.dispose();
    signUpContr.passwordController.dispose();
    signUpContr.nameController.dispose();
    signUpContr.numberController.dispose();
    signUpContr.confirmPasswordController.dispose();
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

    if (value.length < 8) {
      return 'Password must be at least 8 characters.';
    }

    final List<Map<RegExp, String>> patterns = [
      {RegExp(r'[a-z]'): 'Lowercase letter'},
      {RegExp(r'[A-Z]'): 'Uppercase letter'},
      {RegExp(r'[0-9]'): 'Numeric digit'},
      {
        RegExp(r'[!@#\$%^&*()_+{}|:<>?~]'):
            'Special character\n like :!@#\$%^&*()_+{}|:<>?~'
      },
    ];

    for (final pattern in patterns) {
      final entry = pattern.entries.first;
      if (!entry.key.hasMatch(value)) {
        return 'Password must contain ${entry.value}.';
      }
    }

    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Email';
    }

    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final th = Theme.of(context).textTheme;
    return GetBuilder<SignupController>(
        builder: (c) => Stack(
              children: [
                Scaffold(
                  appBar: AppBar(
                    leading: InkWell(
                        onTap: () {
                          Get.offAll(const LoginScreen());
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                  ),
                  backgroundColor: const Color(0xffF8F9FD),
                  body: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/JOIN.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    'assets/images/hello_dish.png',
                                    height: 60,
                                    width: 190,
                                  ),
                                ],
                              ),
                              Text(
                                'Create a new account and unlock a \ncreative world. Sign Up Now!',
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey),
                              ),
                              boxA3(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text(
                                  'Full Name ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 72,
                                child: Center(
                                  child: DCustomTextField(
                                    controller: signUpContr.nameController,
                                    prefixIcon: Icons.person,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    keyboardType: TextInputType.name,
                                    onTap: () {},
                                    hintText: 'Jenny Wilson',
                                    validator: validateField,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text(
                                  'Email Address',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 72,
                                child: Center(
                                  child: DCustomTextField(
                                    controller: signUpContr.emailController,
                                    prefixIcon: Icons.mail_outline,
                                    keyboardType: TextInputType.emailAddress,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.done,
                                    onTap: () {},
                                    hintText: 'example@gmail.com',
                                    validator: (value) => validateField(value,
                                        customErrorMessage:
                                            'Please enter your Email'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text(
                                  'Number',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 72,
                                child: Center(
                                  child: DCustomTextField(
                                    controller: signUpContr.numberController,
                                    labelText: '+91 955555566',
                                    keyboardType: TextInputType.number,
                                    onTap: () {},
                                    hintText: '+91 955555566',
                                    validator: (value) => validateField(value,
                                        customErrorMessage:
                                            'Please enter your Number'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text(
                                  'Password ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 72,
                                child: Center(
                                  child: DCustomTextField(
                                    controller: signUpContr.passwordController,
                                    obscureText: !signUpContr.isVisible.value,
                                    suffixIcon: _icon,
                                    prefixIcon: Iconsax.lock4,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    hintText: 'Enter your password',
                                    validator: validatePassword,
                                    onIconTap: () {
                                      setState(() {
                                        signUpContr.isVisible.value =
                                            !signUpContr.isVisible.value;
                                        _icon = signUpContr.isVisible.value
                                            ? Iconsax.eye3
                                            : Iconsax.eye_slash4;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text(
                                  'Confirm Password ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Center(
                                  child: DCustomTextField(
                                    obscureText: !signUpContr.isVisible1.value,
                                    suffixIcon: _icon1,
                                    controller:
                                        signUpContr.confirmPasswordController,
                                    prefixIcon: Iconsax.lock4,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    hintText: 'Confirm your password',
                                    validator: (value) =>
                                        validateConfirmPassword(
                                            value,
                                            signUpContr
                                                .passwordController.text),
                                    onIconTap: () {
                                      setState(() {
                                        signUpContr.isVisible1.value =
                                            !signUpContr.isVisible1.value;
                                        _icon1 = signUpContr.isVisible1.value
                                            ? Iconsax.eye3
                                            : Iconsax.eye_slash4;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              boxB2(),
                              Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      signUpContr.selectedDate,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: signUpContr.selectedDate ==
                                                  "Select date of birth"
                                              ? Colors.grey
                                              : AppColors.BlackColorCode),
                                    ),
                                    IconButton(
                                      onPressed: () => _selectDate(context),
                                      icon: const Icon(Iconsax.calendar5),
                                    ),
                                  ],
                                ),
                              ),
                              boxA2(),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        signUpContr.ismale = true;
                                        signUpContr.isfemale = false;
                                        signUpContr.isother = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          border: Border.all(
                                            color: signUpContr.ismale
                                                ? AppColors.redGradient
                                                : Colors.transparent,
                                          )),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Text('Male',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12)),
                                    ),
                                  ),
                                  boxB2(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        signUpContr.ismale = false;
                                        signUpContr.isfemale = true;
                                        signUpContr.isother = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          border: Border.all(
                                            color: signUpContr.isfemale
                                                ? AppColors.redGradient
                                                : Colors.transparent,
                                          )),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Text('Female',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12)),
                                    ),
                                  ),
                                  boxB2(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        signUpContr.ismale = false;
                                        signUpContr.isfemale = false;
                                        signUpContr.isother = true;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          border: Border.all(
                                            color: signUpContr.isother
                                                ? AppColors.redGradient
                                                : Colors.transparent,
                                          )),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Text(
                                        'Other',
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              boxA3(),
                              CustomRoundedElevatedButton(
                                text: 'Continue',
                                onPressed: () async {
                                  if (signUpContr.selectedDate ==
                                      "Select date of birth") {
                                    Utils.showFlushBarWithMessage(
                                        "Please enter date of birth",
                                        Get.context!,
                                        false);
                                    return;
                                  } else if (_formKey.currentState!
                                      .validate()) {
                                    signUpContr.printPara();
                                    if (await signUpContr.checkMailPhone()) {
                                      Get.to(const UploadDocScreen());
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(() {
                        return signUpContr.isLoading.value
                            ? Center(
                                child: const SizedBox(
                                    // width: 30,
                                    // height: 30,
                                    child: CircularProgressIndicator()),
                              )
                            : Container();
                      })
                    ],
                  ),
                ),
              ],
            ));
  }
}
