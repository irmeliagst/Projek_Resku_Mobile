import 'dart:html';

import 'package:Reskuu/api/beranda.dart';
// import 'package:Reskuu/users/beranda.dart';

import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = "http://localhost/resku/";
  Client client = Client();

  Future<List<Beranda>> getProfiles() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/user/beranda.php"));
    if (response.statusCode == 200) {
      return berandaFromJson(response.body);
    } else {
      return [];
    }
  }
}
