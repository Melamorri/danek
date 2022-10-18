import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  final _keyUserName = 'userName';
  final _keyUserAge = 'userAge';
  final _keyHero = 'hero';
  final _keyCoins = 'coins';
  final _keyMyPurchases = 'myPurchases';
  final _keyLanguage = 'language';
  final _keyFormLaunch = 'formLaunch';
  final _keyHeroLaunch = 'heroLaunch';
  final _keyFoneticMusic = 'foneticMusic';

  Future init() async => _preferences = await SharedPreferences.getInstance();

  Future setUserName(String userName) async =>
      await _preferences?.setString(_keyUserName, userName);
  Future setUserAge(int userAge) async =>
      await _preferences?.setInt(_keyUserAge, userAge);
  Future setHero(String hero) async =>
      await _preferences?.setString(_keyHero, hero);
  Future setCoins(int coins) async =>
      await _preferences?.setInt(_keyCoins, coins);
  Future setMyPurchases(List<String> mypurchases) async =>
      await _preferences?.setStringList(_keyMyPurchases, mypurchases);
  // Future setMyPurchases(String mypurchases) async =>
  //     await _preferences?.setString(_keyMyPurchases, mypurchases);
  Future setLanguage(String language) async =>
      await _preferences?.setString(_keyLanguage, language);
  Future setFormLaunch(bool formLaunch) async =>
      await _preferences?.setBool(_keyFormLaunch, formLaunch);
  Future setHeroLaunch(bool heroLaunch) async =>
      await _preferences?.setBool(_keyHeroLaunch, heroLaunch);
  Future setFoneticMusic(bool foneticMusic) async =>
      await _preferences?.setBool(_keyFoneticMusic, foneticMusic);

  String? getUserName() => _preferences?.getString(_keyUserName);
  int? getUserAge() => _preferences?.getInt(_keyUserAge);
  String? getHero() => _preferences?.getString(_keyHero);
  int? getCoins() => _preferences?.getInt(_keyCoins);
  List<String>? getMyPurchases() =>
      _preferences?.getStringList(_keyMyPurchases);
  // String? getMyPurchases() => _preferences?.getString(_keyMyPurchases);
  String? getLanguage() => _preferences?.getString(_keyLanguage);
  bool? getFormLaunch() => _preferences?.getBool(_keyFormLaunch);
  bool? getHeroLaunch() => _preferences?.getBool(_keyHeroLaunch);
  bool? getFoneticMusic() => _preferences?.getBool(_keyFoneticMusic);

  // Future<bool>? deleteUserName() => _preferences?.remove(_keyUserName);
  // Future<bool>? deleteUserAge() => _preferences?.remove(_keyUserAge);
  Future<bool>? deleteHero() => _preferences?.remove(_keyHero);
  // Future<bool>? deleteCoins() => _preferences?.remove(_keyCoins);
  // Future<bool>? deleteMyPurcahses() => _preferences?.remove(_keyMyPurchases);
  // Future<bool>? deleteFormLaunch() => _preferences?.remove(_keyFormLaunch);
  // Future<bool>? deleteHeroLaunch() => _preferences?.remove(_keyHeroLaunch);
  Future<bool>? clearData() => _preferences?.clear();
}
