import 'dart:convert';

StringToObject(value) {
  List<String> str = value.replaceAll("{", "").replaceAll("}", "").split(",");
  Map<String, dynamic> result = {};
  for (int i = 0; i < str.length; i++) {
    List<String> s = str[i].split(":");
    result.putIfAbsent(s[0].trim(), () => s[1].trim());
  }
  return (result);
}

StringToObject1(List value) {
  value.map((element) => StringToObject(element));

  // List<String> str = value.replaceAll("{", "").replaceAll("}", "").split(",");
  // Map<String, dynamic> result = {};
  // for (int i = 0; i < str.length; i++) {
  //   List<String> s = str[i].split(":");
  //   result.putIfAbsent(s[0].trim(), () => s[1].trim());
  // }
  // return (result);
}
