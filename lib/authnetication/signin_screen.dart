import 'package:flutter/material.dart';
import 'package:gem_ai/authnetication/signup_screen.dart';
import 'package:gem_ai/authnetication/validator.dart';
import 'package:gem_ai/authnetication/widgets/emailform_widgets.dart';
import 'package:gem_ai/authnetication/widgets/passwordform_widgets.dart';
import 'package:gem_ai/authnetication/widgets/sociallogin_button.dart';
import 'package:gem_ai/authnetication/widgets/submit_button_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/color_constant.dart';
import '../constants/image_constants.dart';
import '../constants/text_constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAppBackground,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: Form(
              key: _globalKey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                          child: Text(
                        TextGreeting,
                        style: GoogleFonts.chivoMono(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: colorAppBlack)),
                      )),
                      Center(
                          child: Text(
                        TextSignInsubTitle,
                        style: GoogleFonts.chivoMono(
                            textStyle: TextStyle(fontSize: 16, color: colorAppBlack)),
                      )),
                      const SizedBox(
                        height: 32,
                      ),

                      ///-------Email--------
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: EmailForm(
                          emailController: _emailController,
                          validator: isValidEmail,
                        ),
                      ),

                      ///-------Password--------
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: PasswordForm(
                          passwordController: _passwordController,
                          validator: isValidpassword,
                          LabelText: TextEnterPassword,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              TextForgotPassword,
                              style: GoogleFonts.chivoMono(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: colorAppBlack),
                            )),
                      ),

                      ///--------Sign In Button--------------------
                      const Padding(
                        padding: EdgeInsets.only(top: 32.0),
                        child: SubmitButtonWidget(
                          height: 52,
                          width: 302,
                          TextColor: colorAppTextWhite,
                          ButtonText: TextSignIn,
                        ),
                      ),

                      ///---------Divider-------------
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              indent: 40,
                              endIndent: 20,
                              color: Colors.grey,
                              thickness: 2,
                            )),
                            Text(
                              TextDivider,
                              style: GoogleFonts.chivoMono(
                                  fontSize: 16, color: Colors.grey),
                            ),
                            const Expanded(
                                child: Divider(
                              indent: 20,
                              endIndent: 40,
                              color: Colors.grey,
                              thickness: 2,
                            )),
                          ],
                        ),
                      ),

                      ///------Social Login Button--------------
                      const Padding(
                        padding: EdgeInsets.only(top: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocialLoginButton(
                              ButtonImage: imageLogoGoogle,
                            ),
                            SocialLoginButton(
                              ButtonImage: imageLogoApple,
                            ),
                            SocialLoginButton(
                              ButtonImage: imageLogoFacebook,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: TextDidHaveAccount,
                                  style: GoogleFonts.chivoMono(
                                      fontSize: 16, color: colorAppBlack)),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUpScreen()));
                                  },
                                  child: Text(
                                    TextRegistration,
                                    style: GoogleFonts.chivoMono(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: colorApplogo),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
