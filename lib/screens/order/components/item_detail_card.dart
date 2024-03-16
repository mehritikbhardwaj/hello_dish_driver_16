import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/const.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';

class ItemDetailCard extends StatelessWidget {
  const ItemDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 0),
            blurRadius: 12,
          ),
        ],
        color: AppColors.backgroundblueColour,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Item Total',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.grey),
              ),
              Text(
                '₹ 200',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.textBlack),
              ),
            ],
          ),
          boxA2(),
          customDevider(),
          boxA2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charge',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.grey),
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: '₹ 200',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.textBlack),
                ),
                TextSpan(
                  text: ' FREE',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 12, color: Colors.green),
                ),
              ])),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Restaurant GST',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.grey),
              ),
              Text(
                '₹ 11.00',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.textBlack),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Restaurant Packing',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.grey),
              ),
              Text(
                '₹ 00.40',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.textBlack),
              ),
            ],
          ),
          boxA2(),
          customDevider(),
          boxA2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PAID',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.textBlack),
              ),
              Text(
                '₹ 211.40',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.textBlack),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }
}
