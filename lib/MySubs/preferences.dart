import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainertimer/MySubs/prefTimer.dart';

class StoreTimerPreferences {
  static late SharedPreferences _preferences;

  static const _keyTimer = 'storeTimer';
  static const myTimer = StoreTimer(
    lab1: 'Tabata',
    pre1: '0:10',
    act1: '0:20',
    reg1: '0:10',
    rnd1: '8',
    ico1: '1',
    lab2: 'Fight 3/1',
    pre2: '0:20',
    act2: '3:00',
    reg2: '1:00',
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

