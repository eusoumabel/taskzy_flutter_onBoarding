import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taskzy/components/on_boarding_component.dart';
import 'package:taskzy/helper/config/custom_shared_preferences.dart';
import 'package:taskzy/helper/style/custom_colors.dart';
import 'package:taskzy/pages/login_menu_page.dart.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _pageController = PageController(initialPage: 0);
  late int page;

  @override
  void initState() {
    super.initState();
    page = _pageController.initialPage;
  }

  _navigateToLogin() async {
    await CustomSharedPreferences.saveUserOnBoarding(true);
    Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(
        builder: (context) => LoginMenuPage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            page < 2
                ? Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      //For some reason this onPressed isn't working.
                      //If someone has some advice, please let me know :)
                      onPressed: _navigateToLogin,
                      child: Text(
                        'Skip',
                        style: GoogleFonts.poppins(
                          color: kPrimaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                : Container(),
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() => page = value);
              },
              children: [
                OnBoardingItem(
                  imagePath: 'images/pin.png',
                  text: _pageOneText(),
                ),
                OnBoardingItem(
                  imagePath: 'images/clock.png',
                  text: _pageTwoText(),
                ),
                OnBoardingItem(
                  imagePath: 'images/tick.png',
                  text: _pageThreeText(),
                  hasButton: true,
                ),
              ],
            ),
            Visibility(
              visible: page < 2 ? true : false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    effect: ExpandingDotsEffect(
                      activeDotColor: kPageIndicatorColor,
                      dotColor: kPageIndicatorColor,
                      dotHeight: 12,
                      dotWidth: 12,
                    ),
                    count: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  RichText _pageOneText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Um jeito ",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
            ),
          ),
          TextSpan(
            text: "novo ",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\npara organizar\nsuas ",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
            ),
          ),
          TextSpan(
            text: "tasks.",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  RichText _pageTwoText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Organize ",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "seu\ntempo de forma\n",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
            ),
          ),
          TextSpan(
            text: "otimizada.",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  RichText _pageThreeText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Tudo dentro do\n",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
            ),
          ),
          TextSpan(
            text: "prazo, ",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "sem\n perder mais nada. ",
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
