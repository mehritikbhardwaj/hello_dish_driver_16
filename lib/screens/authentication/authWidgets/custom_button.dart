import 'package:flutter/material.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';

class CustomRoundedElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
   final String? Function(String?)? validator;

  const CustomRoundedElevatedButton(
      {super.key, required this.text, required this.onPressed, this.validator});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.redGradient, // Set your desired button color
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        ),
      ),
    );
  }
}
