// ignore_for_file: library_private_types_in_public_api

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'localeString.dart';
import 'mediaQuery.dart';
import 'shared_pref..dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String selectedLanguage = 'en_IN'; // Default selected language

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
      isExpanded: true,
      value: selectedLanguage,
      items: LocaleString().keys.keys.map((localeCode) {
        final languageName = LocaleString().keys[localeCode]!['languageName'];
        return DropdownMenuItem<String>(
          value: localeCode,
          child: Text(languageName ?? 'Unknown'),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedLanguage = newValue!;
          // Set the language here using Get.locale
          Get.updateLocale(Locale(newValue));
        });
      },
      buttonStyleData: ButtonStyleData(
        height: 40,
        width: SizeConfig.Width * 0.3,
        padding: const EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        elevation: 0,
      ),
      iconStyleData: const IconStyleData(
          icon: Icon(
        Iconsax.arrow_down_1,
        size: 16.0,
      )),
      dropdownStyleData: DropdownStyleData(
        maxHeight: SizeConfig.Height * 0.4,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        elevation: 8,
        scrollbarTheme: const ScrollbarThemeData(
          radius: Radius.circular(40),
        ),
      ),
    ));

    // return DropdownButton<String>(
    //   // return DropdownButtonFormField<String>(
    //   value: selectedLanguage,
    //   icon: Icon(
    //     Iconsax.arrow_down_1,
    //     size: 16.0,
    //   ),
    // onChanged: (newValue) {
    //   setState(() {
    //     selectedLanguage = newValue!;
    //     // Set the language here using Get.locale
    //     Get.updateLocale(Locale(newValue));
    //   });
    // },
    // items: LocaleString().keys.keys.map((localeCode) {
    //   final languageName = LocaleString().keys[localeCode]!['languageName'];
    //   return DropdownMenuItem<String>(
    //     value: localeCode,
    //     child: Text(languageName ?? 'Unknown'),
    //   );
    // }).toList(),
    // );
  }
}

languageBottomSheet(context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: SizeConfig.Height * 0.46,
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.Height * 0.0042,
              width: SizeConfig.Width * 0.24,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(100.0)),
            ),
            Row(
              children: [
                Icon(Iconsax.arrow_left_2).paddingOnly(right: 18.0),
                Text(
                  "Select Language",
                  style: GoogleFonts.poppins(fontSize: 21.0),
                )
              ],
            ).paddingOnly(top: 18.0, bottom: 18.0),
            SizedBox(
              height: SizeConfig.Height * 0.33,
              child: ListView.builder(
                itemCount: LocaleString().keys.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final languageCode = LocaleString().keys.keys.toList()[index];
                  final languageName = LocaleString().keys[languageCode]!['languageName'];
                  return ListTile(
                    title: Text(languageName!),
                    onTap: () {
                      // You can handle the language selection here
                      // For example, set the app's locale to the selected language
                      // and close the bottom sheet
                      print("Selected Language: $languageName");
                      Get.updateLocale(Locale(languageCode));
                      SharedPref.shared.pref?.setString(PrefKeys.appLanguage, languageCode);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ).paddingAll(18.0),
      );
    },
  );
}

 
// class LanguageBottomSheet extends StatefulWidget {
//   const LanguageBottomSheet({super.key});

//   @override
//   _LanguageBottomSheetState createState() => _LanguageBottomSheetState();
// }

// class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
//   String selectedLanguage = 'en_IN'; // Default selected language

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
