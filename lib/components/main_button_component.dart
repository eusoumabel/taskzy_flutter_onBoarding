import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskzy/helper/style/custom_colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  const MainButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: kAccentColor,
          width: 2,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
