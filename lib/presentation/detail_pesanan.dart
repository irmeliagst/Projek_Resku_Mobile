import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:resku/ui/pemesanan_pelanggan.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPesanan extends StatefulWidget {
  late String nama;
  DetailPesanan({Key? key, required this.nama}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _DetailPesananState createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {
  late Future<List<dynamic>> data;
  late String? jumlah = "";
  // int _counter = 0;
  @override
  void initState() {
    super.initState();
    data = fetchData();
    fetchHarga();
  }

  _checkout() async {
    final response = await http.get(Uri.parse(
        "http://localhost/resku/api/petugas/cekout_petugas.php?nama=${widget.nama}"));
    // print(response.statusCode);

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PemesananPelanggan()),
      );
      return json.decode(response.body)['message'];
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> fetchHarga() async {
    final response = await http.get(Uri.parse(
        "http://localhost/resku/api/petugas/daftar_pesan_petugas.php?nama=${widget.nama}"));
    // print(response.statusCode);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      // return jsonResponse.map((data) => {}).toList();
      print(json.decode(response.body)['message']['jumlah']);
      // print(jsonResponse.map((data) => Menu.fromJson(data)).toList());
      // return jsonResponse.map((data) => Menu.fromJson(data)).toList();
      setState(() {
        jumlah = json.decode(response.body)['message']['jumlah'];
      });
      return json.decode(response.body)['message']['jumlah'];
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        "http://localhost/resku/api/petugas/daftar_pesan_petugas.php?nama=${widget.nama}"));
    // print(response.statusCode);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      // return jsonResponse.map((data) => {}).toList();
      print(json.decode(response.body)['message']['jumlah']);
      // print(jsonResponse.map((data) => Menu.fromJson(data)).toList());
      // return jsonResponse.map((data) => Menu.fromJson(data)).toList();
      // setState(() {
      //   jumlah = json.decode(response.body)['message']['jumlah'];
      // });
      return jsonResponse;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 123, 184),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Detail Pesanan : ${widget.nama}",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24.0,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 1800.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FutureBuilder<List<dynamic>>(
                        future: fetchData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                // ignore: unused_local_variable
                                var item = snapshot.data[index];
                                return SizedBox(
                                  height: 125.0,
                                  width: 335,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 90.0,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "http://localhost/resku/images/${item['gambar']}",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(
                                                  16.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${item['nama']}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "${item['qty']} x Rp. ${item['harga']}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromARGB(
                                                        255, 168, 2, 2),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        " Rp. ${item['total']}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                              255, 168, 2, 2),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total ",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "$jumlah",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 168, 2, 2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 23.0,
              ),
              SizedBox(
                width: 185.29,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 168, 2, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(62), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    _checkout();
                  },
                  child: const Text("Oke"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Menu {
  final int id;
  final String gambar;
  final String nama;
  final int harga;

  Menu({
    required this.id,
    required this.gambar,
    required this.nama,
    required this.harga,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      gambar: json['gambar'],
      nama: json['nama'],
      harga: json['harga'],
    );
  }
}
