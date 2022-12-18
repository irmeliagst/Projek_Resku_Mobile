import 'dart:convert';

// ignore: camel_case_types
class login {
  String username;
  String password;

  login({required this.username, required this.password});

  factory login.fromJson(Map<String, dynamic> map) {
    return login(username: map["username"], password: map["password"]);
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }

  @override
  String toString() {
    return 'login{username: $username, password: $password}';
  }
}

List<login> loginFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<login>.from(data.map((item) => login.fromJson(item)));
}

String loginToJson(login data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
