import 'package:bex_app_flutter/src/models/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataNetWork {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(List<UserData> data) async {
    String newData;
    newData = userDataToJson(data);
    await _prefs.setString('userData', newData);
  }

  static Future<List<UserData>> readData() async {
    String? jsonData = _prefs.getString('userData');
    if (jsonData != null) {
      List<UserData> userData = userDataFromJson(jsonData);
      return userData;
    } else {
      return [];
    }
  }
}
