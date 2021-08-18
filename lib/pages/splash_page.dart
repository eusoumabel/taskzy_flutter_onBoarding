import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskzy/helper/config/custom_shared_preferences.dart';
import 'package:taskzy/helper/style/custom_colors.dart';

import 'login_menu_page.dart.dart';
import 'on_boarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadNavigationData();
  }

  _loadNavigationData() async {
    await Future.delayed(Duration(seconds: 4));
    await CustomSharedPreferences.checkUserOnBoarding().then((value) async {
      if (value) _navigateToLogin();
      if (!value) _navigateToOnBoarding();
    });
  }

  _navigateToLogin() {
    return Navigator.of(context).pushReplacement(
      CupertinoPageRoute(
        builder: (context) => LoginMenuPage(),
      ),
    );
  }

  _navigateToOnBoarding() {
    return Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(
        builder: (context) => OnBoardingPage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/logo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Taskzy',
                        style: GoogleFonts.poppins(
                          color: kAccentColor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "by Ester Mabel",
                  style: GoogleFonts.poppins(
                    color: kAccentColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
