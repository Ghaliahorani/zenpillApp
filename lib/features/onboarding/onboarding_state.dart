import 'package:shared_preferences/shared_preferences.dart';

class OnboardingState {
  final SharedPreferences _prefs;

  OnboardingState(this._prefs);

  bool get isFirstOpen => _prefs.getBool('isFirstOpen') ?? true;

  Future<void> setFirstOpen(bool value) async {
    await _prefs.setBool('isFirstOpen', value);
  }
}
