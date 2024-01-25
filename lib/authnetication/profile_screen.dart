import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gem_ai/constants/color_constant.dart';
import 'package:gem_ai/constants/image_constants.dart';
import 'package:gem_ai/constants/text_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List _itemList = [
    'Personal Information',
    'Security',
    'Privacy Policy',
    'About GemAI',
  ];
  final List _itemIcon = [
    Icons.person_2_rounded,
    Icons.security,
    Icons.privacy_tip_outlined,
    Icons.info,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAppBackground,
      body: ListView(
        primary: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40,),
              Container(
                  height: 120,
                  width: 120,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 105,
                        width: 105,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            imageLogoProfile,
                            color: Colors.green,
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.grey,
                            ),
                            child: const Icon(Icons.edit, size: 30,)),
                      )
                    ],
                  )),
              Text(
                'Ismail Jabiulla',
                style: GoogleFonts.chivoMono(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Text('example@gmail.com',
                  style: GoogleFonts.chivoMono(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 70,),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: _itemList.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8),
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorApplogo, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border:
                                Border.all(color: Colors.green, width: 1.5)),
                        child: Icon(
                          _itemIcon[index],
                          color: Colors.black,
                        )),
                    title: Text(_itemList[index],
                        style: GoogleFonts.chivoMono(
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600))),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                ),
              );
            },
          ),

          ///------------Logout Button-------------
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 16, right: 16),
            child: GestureDetector(
              onTap: (){
                _showBottomSheet(context);
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all( color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(TextLogOut, style: GoogleFonts.chivoMono(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red)),),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.logout, color: Colors.red,),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              SizedBox(height: 30,),
              Text(TextLogOut, style: GoogleFonts.chivoMono(textStyle: TextStyle(fontSize: 20, color: Colors.red)),),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(TextDialog_sub),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorAppBackground,)), child: Text(TextDialogCancel, style: GoogleFonts.chivoMono(color: colorApplogo),),),
                  TextButton(onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red.shade50 )), child: Text(TextDialogYes, style: GoogleFonts.chivoMono(color: Colors.red.shade700),),),
                ],
              ),
              SizedBox(height: 40,)
            ],
          ),
        );
      },
    );
  }

}
