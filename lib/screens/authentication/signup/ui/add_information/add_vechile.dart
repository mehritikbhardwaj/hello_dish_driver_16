import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/authentication/signup/controller/signUpController.dart';
import 'package:hello_dish_driver/screens/authentication/signup/ui/add_information/add_bank_info.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';

import '../../../authWidgets/custom_button.dart';

class AddVechileScreen extends StatefulWidget {
  const AddVechileScreen({super.key});

  @override
  State<AddVechileScreen> createState() => _AddVechileScreenState();
}

class _AddVechileScreenState extends State<AddVechileScreen> {
  final SignupController signUpContr = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Text(
                'Add Vehical Type',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 20),
              ),
              boxA2(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          signUpContr.isElec = true;
                          signUpContr.isMoto = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 8,
                              spreadRadius: 0,
                              color: Color.fromRGBO(0, 0, 0, 0.10),
                            ),
                          ],
                          color: AppColors.white,
                          border: Border.all(
                            color: signUpContr.isElec
                                ? AppColors.redGradient
                                : AppColors.white,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Image.asset(
                          'assets/images/elebike.png',
                          height: 70,
                        ),
                      ),
                    ),
                  ),
                  boxB2(),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          signUpContr.isElec = false;
                          signUpContr.isMoto = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 8,
                              spreadRadius: 0,
                              color: Color.fromRGBO(0, 0, 0, 0.10),
                            ),
                          ],
                          color: AppColors.white,
                          border: Border.all(
                            color: signUpContr.isMoto
                                ? AppColors.redGradient
                                : AppColors.white,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Image.asset(
                          'assets/images/motobike.png',
                          height: 70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              boxA3(),
              Card(
                color: AppColors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Dish T-Shirt',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          boxA2(),
                          Text('₹ 300 /~',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                          boxA1(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    signUpContr.isSmall = true;
                                    signUpContr.size = "s";
                                    signUpContr.ismed = false;
                                    signUpContr.islarge = false;
                                    signUpContr.isXl = false;
                                    signUpContr.isXll = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: signUpContr.isSmall
                                              ? AppColors.redGradient
                                              : Colors.transparent),
                                      color: signUpContr.isSmall
                                          ? AppColors.white
                                          : AppColors.grey.withOpacity(0.2)),
                                  height: 24,
                                  width: 24,
                                  child: Center(
                                    child: Text(
                                      'S',
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    signUpContr.isSmall = false;
                                    signUpContr.ismed = true;
                                    signUpContr.size = "m";

                                    signUpContr.islarge = false;
                                    signUpContr.isXl = false;
                                    signUpContr.isXll = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: signUpContr.ismed
                                              ? AppColors.redGradient
                                              : Colors.transparent),
                                      color: signUpContr.ismed
                                          ? AppColors.white
                                          : AppColors.grey.withOpacity(0.2)),
                                  height: 24,
                                  width: 24,
                                  child: Center(
                                    child: Text(
                                      'M',
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    signUpContr.isSmall = false;
                                    signUpContr.ismed = false;
                                    signUpContr.islarge = true;
                                    signUpContr.size = "l";

                                    signUpContr.isXl = false;
                                    signUpContr.isXll = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: signUpContr.islarge
                                              ? AppColors.redGradient
                                              : Colors.transparent),
                                      color: signUpContr.islarge
                                          ? AppColors.white
                                          : AppColors.grey.withOpacity(0.2)),
                                  height: 24,
                                  width: 24,
                                  child: Center(
                                    child: Text(
                                      'L',
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    signUpContr.isSmall = false;
                                    signUpContr.ismed = false;
                                    signUpContr.islarge = false;
                                    signUpContr.isXl = true;
                                    signUpContr.size = "xl";

                                    signUpContr.isXll = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: signUpContr.isXl
                                              ? AppColors.redGradient
                                              : Colors.transparent),
                                      color: signUpContr.isXl
                                          ? AppColors.white
                                          : AppColors.grey.withOpacity(0.2)),
                                  height: 24,
                                  width: 24,
                                  child: Center(
                                    child: Text(
                                      'XL',
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    signUpContr.isSmall = false;
                                    signUpContr.ismed = false;
                                    signUpContr.islarge = false;
                                    signUpContr.isXl = false;
                                    signUpContr.isXll = true;
                                    signUpContr.size = "xxl";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: signUpContr.isXll
                                              ? AppColors.redGradient
                                              : Colors.transparent),
                                      color: signUpContr.isXll
                                          ? AppColors.white
                                          : AppColors.grey.withOpacity(0.2)),
                                  height: 24,
                                  width: 24,
                                  child: Center(
                                    child: Text(
                                      'XXL',
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ).paddingSymmetric(horizontal: 12, vertical: 16),
                    ),
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        'assets/images/shirt.png',
                        fit: BoxFit.fill,
                        height: 125,
                      ),
                    ),
                  ],
                ),
              ),
              boxA3(),
              Card(
                color: AppColors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery  bag',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          boxA2(),
                          Text('₹ 600 /~',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                        ],
                      ).paddingSymmetric(horizontal: 12, vertical: 16),
                    ),
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        'assets/images/box.png',
                        fit: BoxFit.fill,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
              boxA3(),
              boxA1(),
              Obx(() {
                return signUpContr.isLoading.value
                    ? Container()
                    : CustomRoundedElevatedButton(
                        text: 'Continue',
                        onPressed: () {
                          //signUpContr.openCheckout("90000");
                          signUpContr.uploadDocumnetApi();
                          // signUpContr.signUpFunction();
                        },
                      );
              })
            ],
          ).paddingSymmetric(horizontal: 12),
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
    );
  }
}
