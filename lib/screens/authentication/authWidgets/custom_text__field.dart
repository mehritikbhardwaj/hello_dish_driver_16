import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';

class DCustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction textInputAction;
  final Function()? onIconTap;
  final Function()? onTap;
  final String? Function(String?)? validator;

  const DCustomTextField({
    super.key,
    required this.controller,
    this.labelText = '',
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onTap,
    this.onIconTap,
    this.validator,
    this.textCapitalization,
  });

  @override
  State<DCustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<DCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      TextFormField(
        cursorHeight: 22,
        style: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black),
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        obscureText: widget.obscureText,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.words,
        onTap: widget.onTap,
        validator: widget.validator,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          counterText: '',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          labelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              fontSize: 12),
          hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              // color: AppColors.black,
              fontSize: 12),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Icon(
                    widget.prefixIcon,
                    color: AppColors.grey,
                    size: 18,
                  ),
                )
              : null,
          suffixIcon: widget.suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                      onTap: widget.onIconTap,
                      child: Icon(
                        widget.suffixIcon,
                        color: AppColors.grey,
                        size: 18,
                      )),
                )
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: AppColors.redGradient, width: 0.5)),
        ),
      ),
    ]);
  }
}
