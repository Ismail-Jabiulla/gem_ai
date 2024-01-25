import 'package:flutter/material.dart';
import 'package:gem_ai/authnetication/signin_screen.dart';
import 'package:gem_ai/authnetication/validator.dart';
import 'package:gem_ai/authnetication/widgets/emailform_widgets.dart';
import 'package:gem_ai/authnetication/widgets/name_widgets.dart';
import 'package:gem_ai/authnetication/widgets/passwordform_widgets.dart';
import 'package:gem_ai/authnetication/widgets/sociallogin_button.dart';
import 'package:gem_ai/authnetication/widgets/submit_button_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/color_constant.dart';
import '../constants/image_constants.dart';
import '../constants/text_constants.dart';
import '../utils/dialog_utiles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAppBackground,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 100),
                Center(
                    child: Text(
                  TextSignupToApp,
                  style: GoogleFonts.chivoMono(
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: colorAppBlack)),
                )),
                Center(
                    child: Text(
                  TextSignupToApp_sub,
                  style: GoogleFonts.chivoMono(
                      textStyle: TextStyle(fontSize: 16, color: colorAppBlack)),
                )),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: NameForm(),
                ),

                ///-------Email--------
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16),
                  child: EmailForm(
                    emailController: _emailController,
                    validator: isValidEmail,
                  ),
                ),

                ///-------Password--------
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16),
                  child: PasswordForm(
                    passwordController: _passwordController,
                    validator: isValidpassword,
                    LabelText: TextEnterPassword,
                  ),
                ),

                ///-------Confirm Password--------
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16),
                  child: PasswordForm(
                    passwordController: _confirmPasswordController,
                    validator: isValidpassword,
                    LabelText: TextEnterConfirmPassword,
                  ),
                ),

                ///--------Sign In Button--------------------
                Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: GestureDetector(
                    onTap: () {
                      _showDialog(context);
                    },
                    child: const SubmitButtonWidget(
                      height: 52,
                      width: 302,
                      TextColor: colorAppTextWhite,
                      ButtonText: TextSignUp,
                    ),
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
                            text: TextHaveAnyAccount,
                            style: GoogleFonts.chivoMono(
                                fontSize: 16, color: colorAppBlack)),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => SignInScreen()));
                            },
                            child: Text(
                              TextSignIn,
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
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showCustomDialog(context);
  }
}
