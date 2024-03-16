import 'package:flutter/material.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'mediaQuery.dart';

Container customDevider() {
  return Container(
    width: double.infinity,
    height: SizeConfig.Height * 0.001,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Colors.transparent,
        AppColors.grey.withOpacity(0.5),
        Colors.transparent
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
    ),
  );
}

customContainer(
    {margin, onTap, borderRadius, padding, bgColor, child, shadow}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: margin,
      padding: padding ?? EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.backgroundblueColour,
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(shadow == false ? 0.0 : 0.2),
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
          // BoxShadow(
          //   color: Colors.black.withOpacity(0.2),
          //   blurRadius: 10.0,
          //   offset: Offset(0, 4),
          // ),
        ],
      ),
      child: child,
    ),
  );
}
