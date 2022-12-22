// ignore: depend_on_referenced_packages
import 'package:http/http.dart' show Client;
import 'package:resku/api/beranda.dart';
import 'package:resku/api/cekout.dart';
import 'package:resku/api/login.dart';
import 'package:resku/api/transaksi.dart';
import 'package:resku/api/validasi.dart';

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

  Future<List<cekout>> getCekout() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/user/cekout.php"));
    if (response.statusCode == 200) {
      return cekoutFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<List<login>> getLogin() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/petugas/login.php"));
    if (response.statusCode == 200) {
      return loginFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<List<validasi>> getValidasi() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/petugas/validasi.php"));
    if (response.statusCode == 200) {
      return validasiFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<List<transaksi>> gettransaksi() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/petugas/transaksi.php"));
    if (response.statusCode == 200) {
      return transaksiFromJson(response.body);
    } else {
      return [];
    }
  }
}

class Cekout {}
