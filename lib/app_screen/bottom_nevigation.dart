import 'package:flutter/material.dart';
import 'package:gem_ai/constants/image_constants.dart';
import '../authnetication/profile_screen.dart';
import '../authnetication/signin_screen.dart';
import '../constants/color_constant.dart';
import 'home_page_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<Widget> _screens = [
    HomePageScreen(),
    CategoriesTab(),
    PhotoSearch(),
    token != null ? ProfileScreen() : SignInScreen()
  ];

  static get token => null;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAppBackground,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
              color: colorAppNavigation,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///----Home-----
              InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Image.asset(
                    imageLogoMessege,
                    height: _selectedIndex == 0 ? 40 : 30,
                    color:
                        _selectedIndex == 0 ? colorAppIconButton : colorApplogo,
                  )),

              ///---Search-----
              InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Image.asset(
                    imageLogoCategories,
                    height: _selectedIndex == 1 ? 30 : 20,
                    color:
                        _selectedIndex == 1 ? colorAppIconButton : colorApplogo,
                  )),

              InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Image.asset(
                    imageLogoHistory,
                    height: _selectedIndex == 2 ? 30 : 20,
                    color:
                        _selectedIndex == 2 ? colorAppIconButton : colorApplogo,
                  )),

              ///-----Profile----
              InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  child: Image.asset(
                    imageLogoProfile,
                    height: _selectedIndex == 3 ? 30 : 20,
                    color:
                        _selectedIndex == 3 ? colorAppIconButton : colorApplogo,
                  )),
            ],
          )),
    );
  }
}


class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PhotoSearch extends StatelessWidget {
  const PhotoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
