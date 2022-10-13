import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  final _keyUsername = 'userName';
  final _keyUserAge = 'userAge';
  final _keyHero = 'hero';
  final _keyCoins = 'coins';
  final _keyMyPurchases = 'myPurchases';
  final _keyLanguage = 'language';
  final _keyFormLaunch = 'formLaunch';
  final _keyHeroLaunch = 'heroLaunch';

  Future init() async => _preferences = await SharedPreferences.getInstance();

  Future setUsername(String userName) async =>
      await _preferences?.setString(_keyUsername, userName);
  Future setUserAge(int userAge) async =>
      await _preferences?.setInt(_keyUserAge, userAge);
  Future setHero(String hero) async =>
      await _preferences?.setString(_keyHero, hero);
  Future setCoins(int coins) async =>
      await _preferences?.setInt(_keyCoins, coins);
  Future setMyPurchases(List<String> mypurchases) async =>
      await _preferences?.setStringList(_keyMyPurchases, mypurchases);
  Future setLanguage(String language) async =>
      await _preferences?.setString(_keyLanguage, language);
  Future setFormLaunch(bool formLaunch) async =>
      await _preferences?.setBool(_keyFormLaunch, formLaunch);
  Future setHeroLaunch(bool heroLaunch) async =>
      await _preferences?.setBool(_keyFormLaunch, heroLaunch);

  String? getUsername() => _preferences?.getString(_keyUsername);
  int? getUserAge() => _preferences?.getInt(_keyUserAge);
  String? getHero() => _preferences?.getString(_keyHero);
  int? getCoins() => _preferences?.getInt(_keyCoins);
  List? getMyPurchases() => _preferences?.getStringList(_keyMyPurchases);
  String? getLanguage() => _preferences?.getString(_keyLanguage);
  bool? getFormLaunch() => _preferences?.getBool(_keyFormLaunch);
  bool? getHeroLaunch() => _preferences?.getBool(_keyHeroLaunch);

  Future<bool>? deleteUsername() => _preferences?.remove(_keyUsername);
  Future<bool>? deleteUserAge() => _preferences?.remove(_keyUserAge);
  Future<bool>? deleteHero() => _preferences?.remove(_keyHero);
  Future<bool>? deleteCoins() => _preferences?.remove(_keyCoins);
}
