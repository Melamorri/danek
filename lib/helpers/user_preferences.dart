import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  final _keyUsername = 'username';
  final _keyUserAge = 'userage';
  final _keyEmail = 'email';
  final _keyCoins = 'coins';
  final _keyMyPurchases = 'mypurchases';
  final _newLaunch = 'launch';

  Future init() async => _preferences = await SharedPreferences.getInstance();

  Future setUsername(String username) async =>
      await _preferences?.setString(_keyUsername, username);
  Future setUserAge(int userAge) async =>
      await _preferences?.setInt(_keyUserAge, userAge);
  Future setEmail(String email) async =>
      await _preferences?.setString(_keyEmail, email);
  Future setCoins(int coins) async =>
      await _preferences?.setInt(_keyCoins, coins);
  Future setMyPurchases(List<String> mypurchases) async =>
      await _preferences?.setStringList(_keyMyPurchases, mypurchases);
  Future setLaunch(bool launch) async =>
      await _preferences?.setBool(_newLaunch, launch);

  String? getUsername() => _preferences?.getString(_keyUsername);
  int? getUserAge() => _preferences?.getInt(_keyUserAge);
  String? getEmail() => _preferences?.getString(_keyEmail);
  int? getCoins() => _preferences?.getInt(_keyCoins);
  List? getMyPurchases() => _preferences?.getStringList(_keyMyPurchases);
  bool? getLaunch() => _preferences?.getBool(_newLaunch);

  Future<bool>? deleteUsername() => _preferences?.remove(_keyUsername);
  Future<bool>? deleteUserAge() => _preferences?.remove(_keyUserAge);
  Future<bool>? deleteEmail() => _preferences?.remove(_keyEmail);
  Future<bool>? deleteCoins() => _preferences?.remove(_keyCoins);
}
