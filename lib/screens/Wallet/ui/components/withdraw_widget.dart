import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/custom_text__field.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/AppColors.dart';
import '../../../../utils/sizedBox.dart';

class WithdrawWidget extends StatelessWidget {
  final bool isAddModey;
  final bool isWithdraw;
  final bool showField;
  final VoidCallback onWithPress;
  final VoidCallback onAddPress;
  const WithdrawWidget(
      {super.key,
      required this.isAddModey,
      required this.isWithdraw,
      required this.onWithPress,
      required this.onAddPress,
      required this.showField});

  @override
  Widget build(BuildContext context) {
    final amountController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        boxA2(),
        Text('₹ 4700.00',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: AppColors.textBlack)),
        boxA2(),
        Text(
          'Enter Amount',
          style: GoogleFonts.poppins(
              color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w400),
        ),
        boxA2(),
        if (showField)
          DCustomTextField(
            keyboardType: TextInputType.number,
            controller: amountController,
            hintText: '500',
            prefixIcon: Iconsax.wallet_3,
            suffixIcon: Icons.cancel_outlined,
          ),
        boxA2(),
        Row(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(AppColors.grey),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(
                              color:
                                  isAddModey ? Colors.red : AppColors.white)),
                    ),
                    backgroundColor: MaterialStateProperty.all(isAddModey
                        ? AppColors.redGradient
                        : Color(0xfff5e9d5))),
                onPressed: onAddPress,
                child: Text(
                  'Add',
                  style: GoogleFonts.poppins(
                    color: isAddModey ? Colors.white : AppColors.black,
                  ),
                )),
            boxB2(),
            ElevatedButton(
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(AppColors.grey),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(
                              color:
                                  isWithdraw ? Colors.red : AppColors.white)),
                    ),
                    backgroundColor: MaterialStateProperty.all(isWithdraw
                        ? AppColors.redGradient
                        : Color(0xfff5e9d5))),
                onPressed: onWithPress,
                child: Text(
                  'Withdraw',
                  style: GoogleFonts.poppins(
                    color: isWithdraw ? Colors.white : Colors.black,
                  ),
                )),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}
