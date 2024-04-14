import 'package:shared_preferences/shared_preferences.dart';

class Pref{

  static SharedPreferences? _sharedPreferences;

  static initialize() async {

    _sharedPreferences ??= await SharedPreferences.getInstance();

    print("Preferences initialized...");
  }

  static SharedPreferences get pref => _sharedPreferences ?? initialize();
  static bool getBool(String key) {
    return pref.getBool(key) ?? false;
  }

  static String getStr(String key) {
    return pref.getString(key) ?? "";
  }
  static int getInt(String key) {
    return pref.getInt(key) ?? -1;
  }

  static double getDouble(String key){
    return pref.getDouble(key) ?? -1.0;
  }

  static setValue(String k, dynamic v) {
    switch (v.runtimeType) {
      case String:
        pref.setString(k, v);
        break;
      case bool:
        pref.setBool(k, v);
        break;
      case double:
        pref.setDouble(k, v);
        break;
      case int:
        pref.setInt(k, v);
        break;
      case List:
        pref.setStringList(k, v);
        break;
    }
  }

  static List<String>? getStringList(String key){
    return pref.getStringList(key) ?? [];
  }

  static setValueList(String key, List<String> idList){
    pref.setStringList(key, idList);
  }

  static dynamic value(String k){
    return pref.get(k);
  }

  static Future<String?> getLanguage() async {
    return pref.getString('language');
  }

  static Future<void> setLanguage(String languageCode) async {
    await pref.setString('language', languageCode);
  }

  static const user_id              = 'user_id';
  static const idArray              = 'id_array';
  static const is_vip               = 'is_vip';
  static const hide_rating          = 'hide_rating';
  static const has_new_notification = 'has_new_notification';
}