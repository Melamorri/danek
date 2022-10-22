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
  final _keyShopList = 'shopList';
  final _keyTimeNow = 'timeNow';
  final _keyNumberDays = 'numberDays';

  Future init() async => _preferences = await SharedPreferences.getInstance();

  Future setTimeNow(int timeNow) async =>
      await _preferences?.setInt(_keyTimeNow, timeNow);
  Future setNumberDays(int numberDays) async =>
      await _preferences?.setInt(_keyNumberDays, numberDays);
  Future setFoneticMusic(bool foneticMusic) async =>
      await _preferences?.setBool(_keyFoneticMusic, foneticMusic);

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
  Future setShopList(List<String> shopList) async =>
      await _preferences?.setStringList(_keyShopList, shopList);
  // Future setMyPurchases(String mypurchases) async =>
  //     await _preferences?.setString(_keyMyPurchases, mypurchases);
  Future setLanguage(String language) async =>
      await _preferences?.setString(_keyLanguage, language);
  Future setFormLaunch(bool formLaunch) async =>
      await _preferences?.setBool(_keyFormLaunch, formLaunch);
  Future setHeroLaunch(bool heroLaunch) async =>
      await _preferences?.setBool(_keyHeroLaunch, heroLaunch);

  int? getTimeNow() => _preferences?.getInt(_keyTimeNow);
  int? getNumberDays() => _preferences?.getInt(_keyNumberDays);
  bool? getFoneticMusic() => _preferences?.getBool(_keyFoneticMusic);

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
  List<String>? getShopList() => _preferences?.getStringList(_keyShopList);

  Future<bool>? deleteUserName() => _preferences?.remove(_keyUserName);
  Future<bool>? deleteUserAge() => _preferences?.remove(_keyUserAge);
  Future<bool>? deleteHero() => _preferences?.remove(_keyHero);
  Future<bool>? deleteCoins() => _preferences?.remove(_keyCoins);
  Future<bool>? deleteMyPurcahses() => _preferences?.remove(_keyMyPurchases);
  Future<bool>? deleteFormLaunch() => _preferences?.remove(_keyFormLaunch);
  Future<bool>? deleteHeroLaunch() => _preferences?.remove(_keyHeroLaunch);
  Future<bool>? deleteShopList() => _preferences?.remove(_keyShopList);
  Future<bool>? clearData() => _preferences?.clear();
}
