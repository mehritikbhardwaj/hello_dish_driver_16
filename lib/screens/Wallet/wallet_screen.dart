import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/Wallet/ui/components/order_card.dart';
import 'package:hello_dish_driver/screens/Wallet/ui/components/withdraw_widget.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';
import 'package:hello_dish_driver/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

import 'controller/wallet_controller.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isAdd = true;

  final WalletController walletController = Get.put(
    WalletController(),
  );
  bool isWith = true;

  bool showField = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    walletController.getTransList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      builder: (walletController) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Wallet',
            ),
          ),
          body: walletController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance',
                        style: GoogleFonts.poppins(color: AppColors.grey),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹ ",
                            style: GoogleFonts.nunito(fontSize: 36.0),
                          ),
                          Text(
                            walletController.response!.value.driverWallet.total
                                .toStringAsFixed(2),
                            style: GoogleFonts.poppins(fontSize: 36.0),
                          ),
                        ],
                      ),
                      walletController.amountTextFieldAddVisible ||
                              walletController.amountTextFieldWithdrawVisible
                          ? Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: TextFormField(
                                    controller: walletController
                                        .addAmountTextController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: "Add 💸".tr,
                                      prefixIcon: const Icon(
                                        Iconsax.wallet,
                                        size: 20.0,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Number can`t be empty'.tr;
                                      }
                                      // else if (value.length < 10) {
                                      //   return 'Number should be 10 digit'.tr;
                                      // }
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () {
                                        walletController
                                            .amountTextFieldAddVisible = false;
                                        walletController
                                                .amountTextFieldWithdrawVisible =
                                            false;
                                        walletController.addAmountTextController
                                            .clear();

                                        walletController.update();
                                      },
                                      child:
                                          const Icon(Icons.close)), //wallet_add
                                )
                              ],
                            ).paddingOnly(top: 18.0)
                          : Container(),
                      boxA1(),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: ElevatedButton(
                                style: walletController
                                        .amountTextFieldAddVisible
                                    ? ButtonStyle(
                                        foregroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.white),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.theme),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            side: const BorderSide(
                                                color: AppColors.white),
                                          ),
                                        ))
                                    : ButtonStyle(
                                        foregroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.grey),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.backgroundBlueColour),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            side: const BorderSide(
                                                color: AppColors.grey),
                                          ),
                                        )),
                                onPressed: () async {
                                  if (walletController
                                      .amountTextFieldAddVisible) {
                                    walletController.openCheckout();
                                  }
                                  walletController.amountTextFieldAddVisible =
                                      true;
                                  walletController
                                      .amountTextFieldWithdrawVisible = false;
                                  walletController.update();
                                },
                                child: const Text("Add")),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 6,
                            child: ElevatedButton(
                                style: walletController
                                        .amountTextFieldWithdrawVisible
                                    ? ButtonStyle(
                                        foregroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.white),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.theme),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            side: const BorderSide(
                                                color: AppColors.white),
                                          ),
                                        ))
                                    : ButtonStyle(
                                        foregroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.grey),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.backgroundBlueColour),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            side: const BorderSide(
                                                color: AppColors.grey),
                                          ),
                                        )),
                                onPressed: () async {
                                  if (walletController
                                      .amountTextFieldWithdrawVisible) {
                                    if (walletController.response!.value
                                            .driverWallet.total >
                                        int.parse(walletController
                                            .addAmountTextController.text)) {
                                      if (int.parse(walletController
                                              .addAmountTextController.text) <
                                          100) {
                                        Utils.showFlushBarWithMessage(
                                            "Please enter amout greater than 100",
                                            context,
                                            true);
                                      } else {
                                        walletController
                                            .addWithdrawWallet(true);
                                      }
                                    }
                                  }
                                  walletController
                                      .amountTextFieldWithdrawVisible = true;
                                  walletController.amountTextFieldAddVisible =
                                      false;

                                  walletController.update();
                                },
                                child: const Text("Withdraw ")),
                          ),
                        ],
                      ),
                      boxA2(),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Latest',
                                style:
                                    GoogleFonts.poppins(color: AppColors.grey),
                              ),
                              Text(
                                'Transaction',
                                style: GoogleFonts.poppins(fontSize: 24.0),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // Text(
                          //   'More',
                          //   style: GoogleFonts.poppins(color: AppColors.grey),
                          // ),
                        ],
                      ),
                      boxA2(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.43,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i < walletController.transList.length;
                                  i++)
                                OrderCard(
                                    type: walletController
                                                .transList[i].orderId !=
                                            ""
                                        ? 'Order Income'
                                        : walletController.transList[i].type ==
                                                "1"
                                            ? "Wallet loaded"
                                            : "Wallet withdrawl",
                                    price: '₹ ' +
                                        walletController.transList[i].amount
                                            .toStringAsFixed(2),
                                    gain: walletController.transList[i].type ==
                                            "1"
                                        ? true
                                        : false,
                                    date: Utils.convertTimestamp(
                                        walletController.transList[i].createdAt
                                            .toString())),
                            ],
                          ),
                        ),
                      )
                    ],
                  ).paddingAll(18.0),
                ),
        );
      },
    );
  }
}
