import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskzy/components/main_button_component.dart';
import 'package:taskzy/helper/style/custom_colors.dart';

class LoginMenuPage extends StatefulWidget {
  const LoginMenuPage({Key? key}) : super(key: key);

  @override
  _LoginMenuPageState createState() => _LoginMenuPageState();
}

class _LoginMenuPageState extends State<LoginMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Vamos começar a sua jornada no ",
                      style: GoogleFonts.poppins(
                        color: kAccentColor,
                        fontSize: 35,
                      ),
                    ),
                    TextSpan(
                      text: "Taskzy.",
                      style: GoogleFonts.poppins(
                        color: kAccentColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "Administre, organize e realize suas tasks como nunca antes.",
                  style: GoogleFonts.poppins(
                    color: kAccentColor,
                    fontSize: 20,
                  ),
                ),
              ),
              Spacer(),
              MainButton(
                text: "Login",
                textColor: kTextBlueColor,
                backgroundColor: kAccentColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: MainButton(
                  text: "Cadastro",
                  textColor: kAccentColor,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
