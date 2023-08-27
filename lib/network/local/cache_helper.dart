import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async{
    sharedPreferences =await SharedPreferences.getInstance();
  }
  static Future<bool> putData ({
  required String key,
  required bool value,
})async
  {
    return await sharedPreferences!.setBool(key, value);

  }


  static bool? getData ({
    required String key,
  })
  {
    return sharedPreferences!.getBool(key);

  }

}
