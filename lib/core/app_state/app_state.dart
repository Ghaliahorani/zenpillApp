import 'package:shared_preferences/shared_preferences.dart';

class AppState {
  static late SharedPreferences prefs;

  static Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static bool get isFirstOpen => prefs.getBool('isFirstOpen') ?? true;

  static set isFirstOpen(bool value) {
    prefs.setBool('isFirstOpen', value);
  }
}
