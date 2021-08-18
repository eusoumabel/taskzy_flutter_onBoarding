import 'package:flutter/material.dart';
import 'package:taskzy/pages/splash_page.dart';

import 'helper/style/custom_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taskzy',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kAccentColor,
      ),
      home: SplashPage(),
    );
  }
}
