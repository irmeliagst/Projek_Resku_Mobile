import 'dart:convert';

class cekout {
  int id;
  String tanggal;
  String nama;
  String total;
  int no_meja;

  cekout(
      {this.id = 0,
      required this.tanggal,
      required this.nama,
      required this.total,
      required this.no_meja});

  factory cekout.fromJson(Map<String, dynamic> map) {
    return cekout(
        id: map["id"],
        tanggal: map["tanggal"],
        nama: map["nama"],
        total: map["total"],
        no_meja: map["no_meja"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tanggal": tanggal,
      "nama": nama,
      "total": total,
      "no_meja": no_meja
    };
  }

  @override
  String toString() {
    return 'cekout{id: $id, tanggal: $tanggal nama: $nama, total: $total, no_meja: $no_meja}';
  }
}

List<cekout> cekoutFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<cekout>.from(data.map((item) => cekout.fromJson(item)));
}

String cekoutToJson(cekout data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
