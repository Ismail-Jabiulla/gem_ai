import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gem_ai/constants/image_constants.dart';
import 'package:gem_ai/constants/text_constants.dart';
import 'package:gem_ai/test.dart';
import 'package:google_fonts/google_fonts.dart';

import '../authnetication/widgets/submit_button_widgets.dart';
import '../constants/color_constant.dart';
import 'chat_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAppBackground,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            Image.asset(imageAppLogo, color: colorApplogo,),
            const SizedBox(height: 50),
            Text(TextGreeting, style: GoogleFonts.chivoMono(fontSize: 30, fontWeight: FontWeight.w600),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(TextAppName, style: GoogleFonts.chivoMono(fontSize: 30, fontWeight: FontWeight.w600, color: colorApplogo)),
                const Text(' 👋', style: TextStyle(fontSize: 25),),
              ],
            ),
            const SizedBox(height: 50),
            Text(TextHomepagetxt, textAlign: TextAlign.center, style: GoogleFonts.chivoMono(fontSize: 16)),
            const SizedBox(height: 100),
             Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPageScreen()));
                  },
                  child: const SubmitButtonWidget(height: 60, width: double.infinity, TextColor: colorAppTextWhite, ButtonText: 'Chat Start',)),
            ),
          ],
        ),
      ),
    );
  }
}
