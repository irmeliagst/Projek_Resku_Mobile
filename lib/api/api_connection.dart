// ignore: depend_on_referenced_packages
import 'package:http/http.dart' show Client;
import 'package:resku/api/beranda.dart';

class ApiService {
  final String baseUrl = "http://localhost/resku/";
  Client client = Client();

  Future<List<Beranda>> getBeranda() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/user/beranda.php"));
    if (response.statusCode == 200) {
      return berandaFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<List<Object>> getCekout() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/user/cekout.php"));
    if (response.statusCode == 200) {
      return berandaFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<List<Object>> getLogin() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/petugas/login.php"));
    if (response.statusCode == 200) {
      return berandaFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<List<Object>> getValidasi() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/petugas/validasi.php"));
    if (response.statusCode == 200) {
      return berandaFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<List<Object>> gettransaksi() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/petugas/transaksi.php"));
    if (response.statusCode == 200) {
      return berandaFromJson(response.body);
    } else {
      return [];
    }
  }
}

class Cekout {}
