import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';

class YourRating extends StatelessWidget {
  final double rating;
  final String ratingText;
  const YourRating({super.key, required this.rating, required this.ratingText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your order Rating',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, color: AppColors.textBlack),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Color(0xffefe5db),
                  border: Border.all(color: Colors.white)),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Color(0xfff3b053),
                  ),
                  boxB1(),
                  Text(
                    rating.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBlack),
                  )
                ],
              ),
            )
          ],
        ),
        boxA3(),
        ratingText == ""
            ? Text("")
            : Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textBlack, width: 0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  ratingText,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, color: Colors.grey),
                ),
              )
      ],
    );
  }
}
