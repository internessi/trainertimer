import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainertimer/MySubs/prefTimer.dart';

class StoreTimerPreferences {
  static late SharedPreferences _preferences;

  static const _keyTimer = 'storeTimer';
  static const myTimer = StoreTimer(
    lab1: 'Tabata',
    pre1: '10',
    act1: '20',
    reg1: '10',
    rnd1: '8',
    ico1: '1',
    lab2: 'Fight 3/1',
    pre2: '20',
    act2: '180',
    reg2: '60',
    rnd2: '12',
    ico2: '2',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setTimer(StoreTimer storeTimer) async {
    final json = jsonEncode(storeTimer.toJson());

    await _preferences.setString(_keyTimer, json);
  }

  static StoreTimer getTimer() {
    final json = _preferences.getString(_keyTimer);
    return json == null ? myTimer : StoreTimer.fromJson(jsonDecode(json));
  }
}

