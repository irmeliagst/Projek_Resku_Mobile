import 'dart:convert';

// ignore: camel_case_types
class transaksi {
  int id;
  String tanggal;
  String nama;
  int total;
  int bayar;
  int kembali;
  // ignore: non_constant_identifier_names
  int no_meja;

  transaksi(
      {this.id = 0,
      required this.tanggal,
      required this.nama,
      required this.total,
      required this.bayar,
      required this.kembali,
      // ignore: non_constant_identifier_names
      required this.no_meja});

  factory transaksi.fromJson(Map<String, dynamic> map) {
    return transaksi(
        id: map["id"],
        tanggal: map["tanggal"],
        nama: map["nama"],
        total: map["total"],
        bayar: map["bayar"],
        kembali: map["kembali"],
        no_meja: map["no_meja"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tanggal": tanggal,
      "nama": nama,
      "total": total,
      "bayar": bayar,
      "kembali": kembali,
      "no_meja": no_meja
    };
  }

  @override
  String toString() {
    return 'transaksi{id: $id, tanggal: $tanggal nama: $nama, total: $total, bayar: $bayar, kembali: $kembali, no_meja: $no_meja}';
  }
}

List<transaksi> transaksiFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<transaksi>.from(data.map((item) => transaksi.fromJson(item)));
}

String transaksiToJson(transaksi data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
