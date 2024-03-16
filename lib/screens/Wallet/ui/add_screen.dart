import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/sizedBox.dart';
import 'components/order_card.dart';
import 'components/withdraw_widget.dart';

class AddAmountScreen extends StatefulWidget {
  const AddAmountScreen({super.key});

  @override
  State<AddAmountScreen> createState() => _AddAmountScreenState();
}

class _AddAmountScreenState extends State<AddAmountScreen> {
  bool isAdd = true;
  bool isWith = true;
  bool showField = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
      body: ListView(
        children: [
          WithdrawWidget(
            isAddModey: isAdd,
            isWithdraw: isWith,
            onWithPress: () {
              setState(() {
                isAdd = true;
                isWith = false;
                showField = true;
              });
            },
            onAddPress: () {
              setState(() {
                showField = true;
                isAdd = false;
                isWith = true;
              });
            },
            showField: showField,
          ),
          boxA3(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.grey,
                ),
              ),
              Text(
                'Transaction',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 12),
          boxA2(),
          OrderCard(
              type: 'Order Income',
              price: '₹ 50.5',
              gain: true,
              date: '03 Feb 2023 at 11:07PM'),
          OrderCard(
              type: 'Order Income',
              price: '₹ 100',
              gain: true,
              date: '03 Feb 2023 at 11:07PM'),
          OrderCard(
              type: 'Buy TShirt',
              price: '- ₹ 100',
              gain: false,
              date: '03 Feb 2023 at 11:07PM'),
        ],
      ),
    );
  }
}
