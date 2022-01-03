import 'package:shared_preferences/shared_preferences.dart';

abstract class SharePreferenceKey {
  static const String kisLoggedIn = 'isLoggedIn';
}

class SharePreferenceData {
  static final SharePreferenceData _userData = SharePreferenceData._internal();

  factory SharePreferenceData() {
    return _userData;
  }

  Future<void> setLoggedInStatus({required bool value}) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setBool(SharePreferenceKey.kisLoggedIn, value);
  }

  Future<bool> getLoggedInStatus() async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.getBool(SharePreferenceKey.kisLoggedIn) ?? false;
  }

  SharePreferenceData._internal();
}
