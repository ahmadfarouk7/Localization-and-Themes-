import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSharedPref {
  static late SharedPreferences _pref;
  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  // دالة حفظ البيانات - بتستقبل المفتاح والقيمة وأي نوع بيانات (dynamic)
  static Future<void> setData({
    required String key,
    required dynamic data,
  }) async {
    if (data is String) {
      await _pref.setString(key, data);
    } else if (data is bool) {
      await _pref.setBool(key, data);
    } else if (data is int) {
      await _pref.setInt(key, data);
    }
  }

  // دالة جلب البيانات - بترجع القيمة بناءً على المفتاح
  static Future<dynamic> getData(String key) async {
    return _pref.get(key);
  }
}
