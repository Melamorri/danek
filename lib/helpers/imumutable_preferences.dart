import 'package:shared_preferences/shared_preferences.dart';

class ImmutablePreference {
  static SharedPreferences? _preferences;

  final _keyTimeNow = 'timeNow';
  final _keyNumberDays = 'numberDays';
  final _keyFoneticMusic = 'foneticMusic';

  Future init() async => _preferences = await SharedPreferences.getInstance();

  int? getTimeNow() => _preferences?.getInt(_keyTimeNow);
  int? getNumberDays() => _preferences?.getInt(_keyNumberDays);
  bool? getFoneticMusic() => _preferences?.getBool(_keyFoneticMusic);

  Future setTimeNow(int timeNow) async =>
      await _preferences?.setInt(_keyTimeNow, timeNow);
  Future setNumberDays(int numberDays) async =>
      await _preferences?.setInt(_keyNumberDays, numberDays);
  Future setFoneticMusic(bool foneticMusic) async =>
      await _preferences?.setBool(_keyFoneticMusic, foneticMusic);
}
