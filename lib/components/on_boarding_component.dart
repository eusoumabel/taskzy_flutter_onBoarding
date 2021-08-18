import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskzy/helper/config/custom_shared_preferences.dart';
import 'package:taskzy/helper/style/custom_colors.dart';
import 'package:taskzy/pages/login_menu_page.dart.dart';

class OnBoardingItem extends StatelessWidget {
  final String imagePath;
  final RichText text;
  final bool? hasButton;

  const OnBoardingItem({
    Key? key,
    required this.imagePath,
    required this.text,
    this.hasButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToLogin() async {
      await CustomSharedPreferences.saveUserOnBoarding(true);
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => LoginMenuPage(),
        ),
        (route) => false,
      );
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Image(
              image: AssetImage(imagePath),
            ),
          ),
          text,
          SizedBox(height: 60),
          hasButton!
              ? GestureDetector(
                  onTap: _navigateToLogin,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 64, right: 64),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ir para o Login',
                          style: GoogleFonts.poppins(
                            color: kPrimaryColor,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: kPrimaryColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
