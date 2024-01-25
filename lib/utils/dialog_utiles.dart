import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../authnetication/widgets/submit_button_widgets.dart';
import '../constants/color_constant.dart';
import '../constants/image_constants.dart';
import '../constants/text_constants.dart';
import '../app_screen/bottom_nevigation.dart';

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Container(
          height: 400,
          width: 328,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageVerification,
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  TextCongratulation,
                  style: GoogleFonts.chivoMono(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Text(
                TextDialogText,
                style: GoogleFonts.chivoMono(
                  textStyle: TextStyle(fontSize: 16, color: Colors.black),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationScreen(),
                    ),
                        (route) => false,
                  );
                },
                child: const SubmitButtonWidget(
                  height: 56,
                  width: 140,
                  TextColor: colorAppTextWhite,
                  ButtonText: TextContinue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 19.0),
                  child: Text(
                    TextClose,
                    style: GoogleFonts.barlow(
                      fontSize: 14,
                      color: Colors.grey, // Adjust the color as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
