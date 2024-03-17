import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/const.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';

class ItemDetailCard extends StatelessWidget {
  final String totalPrice;
  final String deliveryCharge;
  final String gstCharge;
  final String packingCharge;
  final String discountCharge;
  final String paidTotal;
  const ItemDetailCard(
      {super.key,
      required this.totalPrice,
      required this.deliveryCharge,
      required this.gstCharge,
      required this.packingCharge,
      required this.discountCharge,
      required this.paidTotal});

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
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.grey),
              ),
              Text(
                '₹ $totalPrice',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.textBlack),
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
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.grey),
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: '₹ $deliveryCharge',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.textBlack),
                ),
                TextSpan(
                  text: double.parse(deliveryCharge) > 0 ? "" : ' FREE',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.green),
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
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.grey),
              ),
              Text(
                '₹ ${gstCharge}',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.textBlack),
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
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.grey),
              ),
              Text(
                '₹ $packingCharge',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.textBlack),
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
                'Discount',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.grey),
              ),
              Text(
                '-₹ $discountCharge',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.textBlack),
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
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.textBlack),
              ),
              Text(
                '₹ $paidTotal',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.textBlack),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }
}
