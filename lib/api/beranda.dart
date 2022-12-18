import 'dart:convert';

class Beranda {
  int id;
  String gambar;
  String nama;
  String jenis;
  int harga;

  Beranda(
      {this.id = 0,
      required this.gambar,
      required this.nama,
      required this.jenis,
      required this.harga});

  factory Beranda.fromJson(Map<String, dynamic> map) {
    return Beranda(
        id: map["id"],
        gambar: map["gambar"],
        nama: map["nama"],
        jenis: map["jenis"],
        harga: map["harga"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "gambar": gambar,
      "nama": nama,
      "jenis": jenis,
      "harga": harga
    };
  }

  @override
  String toString() {
    return 'Beranda{id: $id,gambar: $gambar nama: $nama, jenis: $jenis, harga: $harga}';
  }
}

List<Beranda> berandaFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Beranda>.from(data.map((item) => Beranda.fromJson(item)));
}

String berandaToJson(Beranda data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
