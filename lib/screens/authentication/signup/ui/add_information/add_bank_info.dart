import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/authentication/signup/controller/signUpController.dart';
import 'package:hello_dish_driver/screens/authentication/signup/ui/add_information/upload_doc_screen.dart';
import 'package:hello_dish_driver/screens/home/dashboard_screen.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';
import 'package:hello_dish_driver/utils/utils.dart';

import '../../../authWidgets/custom_button.dart';
import '../../../authWidgets/custom_text__field.dart';
import 'add_vechile.dart';

class AddBankInfoScreen extends StatefulWidget {
  const AddBankInfoScreen({super.key});

  @override
  State<AddBankInfoScreen> createState() => _AddBankInfoScreenState();
}

class _AddBankInfoScreenState extends State<AddBankInfoScreen> {
  final SignupController signUpContr = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Row(
          children: [
            Text(
              'Bank details',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          boxA3(),
          Text(
            'Name as per bank account ',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 12),
          ),
          boxA1(),
          SizedBox(
            height: 60,
            child: Center(
              child: DCustomTextField(
                controller: signUpContr.bankHolderNameController,
                textInputAction: TextInputAction.done,
                hintText: 'Joshi kamlesh',
              ),
            ),
          ),
          boxA1(),
          Text(
            'Account number',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 12),
          ),
          boxA1(),
          SizedBox(
            height: 60,
            child: Center(
              child: DCustomTextField(
                controller: signUpContr.bankNumberController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                hintText: '45554554',
              ),
            ),
          ),
          Text(
            'IFSC code',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 12),
          ),
          boxA1(),
          SizedBox(
            height: 60,
            child: Center(
              child: DCustomTextField(
                controller: signUpContr.bankIFSCController,
                textInputAction: TextInputAction.done,
                maxLength: 15,
                textCapitalization: TextCapitalization.characters,
                hintText: 'IFSC code',
              ),
            ),
          ),
          Text(
            'Bank name',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 12),
          ),
          boxA1(),
          SizedBox(
            height: 60,
            child: Center(
              child: DCustomTextField(
                controller: signUpContr.bankNameController,
                //  suffixIcon: CupertinoIcons.chevron_down,
                textInputAction: TextInputAction.done,
                hintText: 'Bank of Baroda',
                onTap: () {
                  signUpContr.getBankName();
                },
                readOnly: true,
              ),
            ),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Bank Address: ${signUpContr.bankAddress.value}",
                style: GoogleFonts.poppins(fontSize: 10, color: AppColors.grey),
              ),
            );
          }),
          boxA3(),
          boxA3(),
          CustomRoundedElevatedButton(
            text: 'Verify bank',
            onPressed: () async {
              if (signUpContr.bankNameController.text == "") {
                await signUpContr.getBankName();
              }

              if (validateBank(
                  signUpContr.bankHolderNameController,
                  signUpContr.bankNumberController,
                  signUpContr.bankNameController,
                  signUpContr.bankIFSCController,
                  context)) {
                signUpContr.printPara();
                Get.to(const AddVechileScreen());
              }
            },
          ),
        ],
      ).paddingSymmetric(horizontal: 12),
    );
  }

  bool validateBank(
    TextEditingController nameController,
    TextEditingController phoneController,
    TextEditingController bankHolderNameController,
    TextEditingController bankIFSCController,
    BuildContext context,
  ) {
    if (nameController.text.isEmpty) {
      showCustomToast(context, "Name can't be empty");
      return false;
    } else if (phoneController.text.isEmpty) {
      showCustomToast(context, "Account number can't be empty");
      return false;
    } else if (bankHolderNameController.text.isEmpty) {
      showCustomToast(context, "Bank name can't be empty");
      return false;
    } else if (bankIFSCController.text.isEmpty) {
      showCustomToast(context, "IFSC code can't be empty");
      return false;
    }
    return true;
  }

  void showCustomToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        backgroundColor: Colors.black.withOpacity(0.9),
      ),
    );
  }
}
