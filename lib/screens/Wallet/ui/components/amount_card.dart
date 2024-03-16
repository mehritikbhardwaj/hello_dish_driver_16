import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';

import '../add_screen.dart';

class AmountCard extends StatelessWidget {
  const AmountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        boxA2(),
        RichText(
            text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: '₹ 4700.',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: AppColors.textBlack)),
          TextSpan(
              text: '00',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.textBlack)),
        ])).paddingSymmetric(horizontal: 16),
        boxA2(),
        Row(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.redGradient)),
                onPressed: () {
                  Get.to(AddAmountScreen());
                },
                child: Text(
                  'Add',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                )),
            boxB2(),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.redGradient)),
                onPressed: () {},
                child: Text(
                  'Withdraw',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                )),
          ],
        ).paddingSymmetric(horizontal: 16),
      ],
    );
  }
}
