import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  static final AppSharedPreference _singleton = AppSharedPreference._internal();

  factory AppSharedPreference() {
    return _singleton;
  }

  AppSharedPreference._internal();

  static Future<bool> setFirstTimeLaunch(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool('first_time', value);
  }

  static Future<bool?> isFirstTimeLaunch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('first_time');
  }

  static Future<bool> setLoggedIn(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool('LoggedIn', value);
  }

  static Future<bool?> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('LoggedIn');
  }

  static Future<bool> setDateTracker(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString('dateTracker', value);
  }

  static Future<String?> getDateTracker() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('dateTracker');
  }

  static Future<bool> setQuotationCounter(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt('quotationCounter', value);
  }

  static Future<int?> getQuotationCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('quotationCounter');
  }

  static Future<bool> setBillCounter(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt('billCounter', value);
  }

  static Future<int?> getBillCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('billCounter');
  }

  static Future<bool> setLrCounter(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt('LrCounter', value);
  }

  static Future<int?> getLrCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('LrCounter');
  }

  static Future<bool> setMrCounter(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt('MrCounter', value);
  }

  static Future<int?> getMrCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('MrCounter');
  }

  static Future<bool> setUid(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString('Uid', value);
  }

  static Future<String?> getUid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('Uid');
  }

  static Future<bool> setUserCity(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString('UserCity', value);
  }

  static Future<String?> getUserCity() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('UserCity');
  }

  static Future<bool> setTheme(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt('theme', value);
  }

  static Future<int?> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('theme');
  }

  static Future<bool> setUsername(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString('username', value);
  }

  static Future<String?> getUsername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('username');
  }

  static Future<bool> setPassword(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString('passw', value);
  }

  static Future<String?> getPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('passw');
  }

  static Future<bool> setUserPassword(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString('pass', value);
  }

  static Future<String?> getUserPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('pass');
  }

  static Future<bool> setPin(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt('pin', value);
  }

  static Future<int?> getPin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('pin');
  }

  static Future<bool> setVerifiedEmail(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString('verified_email_id', value);
  }

  static Future<String?> getVerifiedEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('verified_email_id');
  }

  static Future<bool> setContactNo(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString('contact_no', value);
  }

  static Future<String?> getContactNo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('contact_no');
  }

  static Future<bool> clearPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }
}
