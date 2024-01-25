import 'package:flutter/cupertino.dart';

import '../../constants/color_constant.dart';

class SocialLoginButton extends StatefulWidget {
  final ButtonImage;
  const SocialLoginButton({super.key, required this.ButtonImage});

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: colorAppTextWhite,
          borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorApplogo, width: 1.5)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Image.asset(widget.ButtonImage, height: 24, width: 24,),
        ],
      ),
    );
  }
}
