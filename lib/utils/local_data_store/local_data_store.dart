import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStore {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  final String _kCharacters = 'CHARACTERS';
  final String _kStarships = 'STARSHIPS';
  final String _kPlanets = 'PLANETS';

  void setCharacters(List<Map<String, dynamic>> value) {
    List<String> stringList = value.map((map) => json.encode(map)).toList();
    _prefsInstance?.setStringList(_kCharacters, stringList);
  }

  List<Map<String, dynamic>> getCharacters() {
    List<String>? stringList = _prefsInstance?.getStringList(_kCharacters);
    if (stringList == null) return [];
    return stringList
        .map((string) => json.decode(string))
        .toList()
        .cast<Map<String, dynamic>>();
  }

  void setStarships(List<Map<String, dynamic>> value) {
    List<String> stringList = value.map((map) => json.encode(map)).toList();
    _prefsInstance?.setStringList(_kStarships, stringList);
  }

  List<Map<String, dynamic>> getStarships() {
    List<String>? stringList = _prefsInstance?.getStringList(_kStarships);
    if (stringList == null) return [];
    return stringList
        .map((string) => json.decode(string))
        .toList()
        .cast<Map<String, dynamic>>();
  }

  void setPlanets(List<Map<String, dynamic>> value) {
    List<String> stringList = value.map((map) => json.encode(map)).toList();
    _prefsInstance?.setStringList(_kPlanets, stringList);
  }

  List<Map<String, dynamic>> getPlanets() {
    List<String>? stringList = _prefsInstance?.getStringList(_kPlanets);
    if (stringList == null) return [];
    return stringList
        .map((string) => json.decode(string))
        .toList()
        .cast<Map<String, dynamic>>();
  }
}
