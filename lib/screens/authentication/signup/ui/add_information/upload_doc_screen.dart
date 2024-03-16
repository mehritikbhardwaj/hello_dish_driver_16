import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/authentication/authWidgets/add_file_card.dart';
import 'package:hello_dish_driver/screens/authentication/signup/controller/signUpController.dart';
import 'package:hello_dish_driver/screens/authentication/signup/ui/add_information/add_bank_info.dart';
import 'package:hello_dish_driver/screens/authentication/signup/ui/signUpscreen.dart';
import 'package:hello_dish_driver/utils/mediaQuery.dart';
import 'package:hello_dish_driver/utils/sizedBox.dart';

import '../../../authWidgets/custom_button.dart';

class UploadDocScreen extends StatefulWidget {
  const UploadDocScreen({Key? key}) : super(key: key);

  @override
  _UploadDocScreenState createState() => _UploadDocScreenState();
}

class _UploadDocScreenState extends State<UploadDocScreen> {
  bool _isFrontAdharValid = false;
  bool _isBackAdharValid = false;
  bool _isFrontPanValid = false;
  bool _isFrontDrivingLicenseValid = false;
  bool _isBackDrivingLicenseValid = false;
  bool _isSelfieValid = false;
  final SignupController signUpContr = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.grey)),
        title: GestureDetector(
          onTap: () {
            //   Get.back();
          },
          child: Row(
            children: [
              Text(
                'Upload your document',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          boxA3(),
          _buildFileSection(
              title: 'ADHAR CARD',
              frontTitle: 'FRONT',
              backTitle: 'BACK',
              frontValid: _isFrontAdharValid,
              backValid: _isBackAdharValid,
              signUpContr: signUpContr),
          boxA3(),
          _buildFileSection(
              title: 'PAN CARD',
              frontTitle: 'FRONT',
              frontValid: _isFrontPanValid,
              signUpContr: signUpContr),
          boxA3(),
          _buildFileSection(
              title: 'DRIVING LICENSE',
              frontTitle: 'FRONT',
              backTitle: 'BACK',
              frontValid: _isFrontDrivingLicenseValid,
              backValid: _isBackDrivingLicenseValid,
              signUpContr: signUpContr),
          boxA3(),
          _buildFileSection(
              title: 'IDENTITY PROOF (SELFIE)',
              frontTitle: 'SELFIE',
              frontValid: _isSelfieValid,
              signUpContr: signUpContr),
          boxA3(),
          CustomRoundedElevatedButton(
            text: 'Continue',
            onPressed: () {
              if (_validateAndShowSnackBar(signUpContr)) {
                signUpContr.printPara();
                Get.to(const AddBankInfoScreen());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFileSection({
    required String title,
    required String frontTitle,
    bool frontValid = false,
    String? backTitle,
    bool backValid = false,
    required SignupController signUpContr,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        boxA1(),
        Row(
          children: [
            Expanded(
              child: AddFileCard(
                title: frontTitle,
                onChanged: (isValid) {
                  setState(() {
                    if (frontTitle == 'FRONT') {
                      if (title == 'ADHAR CARD') {
                        _isFrontAdharValid = isValid;
                      } else if (title == 'PAN CARD') {
                        _isFrontPanValid = isValid;
                      } else if (title == 'DRIVING LICENSE') {
                        _isFrontDrivingLicenseValid = isValid;
                      }
                    } else if (frontTitle == 'SELFIE') {
                      _isSelfieValid = isValid;
                    }
                  });
                },
                forCamera: frontTitle == 'SELFIE' ? true : false,
                file: (value) {
                  if (title == 'ADHAR CARD') {
                    signUpContr.adharFront = value;
                  } else if (title == 'PAN CARD') {
                    signUpContr.panCard = value;
                  } else if (title == 'DRIVING LICENSE') {
                    signUpContr.drivingFront = value;
                  } else {
                    signUpContr.selfie = value;
                  }
                },
              ),
            ),
            if (backTitle != null) boxB3(),
            if (backTitle != null)
              Expanded(
                child: AddFileCard(
                  title: backTitle,
                  onChanged: (isValid) {
                    setState(() {
                      if (backTitle == 'BACK') {
                        if (title == 'ADHAR CARD') {
                          _isBackAdharValid = isValid;
                        } else if (title == 'DRIVING LICENSE') {
                          _isBackDrivingLicenseValid = isValid;
                        }
                      }
                    });
                  },
                  forCamera: false,
                  file: (value) {
                    if (title == 'ADHAR CARD') {
                      signUpContr.adharBack = value;
                    } else {
                      signUpContr.drivingBack = value;
                    }
                  },
                ),
              ),
          ],
        ),
      ],
    );
  }

  bool _validateAndShowSnackBar(SignupController signUpContr) {
    List<String> errorMessages = [];

    if (signUpContr.adharFront == null) {
      errorMessages.add('Please upload front image of Adhar card.');
    }
    if (signUpContr.adharBack == null) {
      errorMessages.add('Please upload back image of Adhar card.');
    }
    if (signUpContr.panCard == null) {
      errorMessages.add('Please upload front image of PAN card.');
    }
    if (signUpContr.drivingFront == null) {
      errorMessages.add('Please upload front image of driving license.');
    }
    if (signUpContr.drivingBack == null) {
      errorMessages.add('Please upload back image of driving license.');
    }
    if (signUpContr.selfie == null) {
      errorMessages.add('Please upload selfie for identity proof.');
    }

    if (errorMessages.isNotEmpty) {
      String errorMessage = errorMessages.join('\n');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
