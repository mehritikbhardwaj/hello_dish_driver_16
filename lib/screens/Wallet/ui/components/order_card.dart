import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';

import '../../../../utils/sizedBox.dart';

class OrderCard extends StatelessWidget {
  final String type;
  final String price;
  final bool gain;
  final String date;
  const OrderCard(
      {super.key, required this.type, required this.price, required this.gain, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              Text(
                price,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: gain ? Colors.green : Colors.red),
              ),
            ],
          ),
          boxA1(),
          Text(
            date,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12),
          )
        ],
      ).paddingAll(12.0),
    );
  }
}
