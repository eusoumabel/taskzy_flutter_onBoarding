import 'package:shared_preferences/shared_preferences.dart';

const String kUserOnBoarding = "onBoarding";

class CustomSharedPreferences {
  static saveUserOnBoarding(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(kUserOnBoarding, value);
  }

  static checkUserOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    var result = (prefs.getBool(kUserOnBoarding) ?? false);
    return result;
  }
}
