import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_nevigation.dart';
import '../constants/color_constant.dart';
import '../constants/image_constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(milliseconds: 2000), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> BottomNavigationScreen()), (route) => false);
    });
    return Scaffold(
      backgroundColor: colorAppBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Container(
                height: 400,
                child: Image.asset(imageAppLogo, height: 100,width: 200, color: colorApplogo,),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Image.asset(imageWaitingCircle, height: 100,width: 100,)),
        ],
      ),
    );
  }
}
