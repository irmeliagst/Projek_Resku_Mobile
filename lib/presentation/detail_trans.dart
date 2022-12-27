// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:resku/presentation/beranda_petugas.dart';
import 'package:resku/ui/pemesanan_pelanggan.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:flutter/material.dart';
import 'package:resku/core.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DetailTransaksi extends StatefulWidget {
  late String nama;
  DetailTransaksi({Key? key, required this.nama}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _DetailTransaksiState createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.redA700A5,
          title: Text(
            "Detail Transaksi",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BerandaPetugasView()),
              );
            }),
          ),
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 25,
                    top: 7,
                    right: 25,
                  ),
                  child: Text(
                    "Atas nama : ${widget.nama}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.red800,
                      fontSize: getFontSize(
                        15,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: size.width,
                    margin: getMargin(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray800,
                    ),
                  ),
                ),
                Container(
                  child: data == null
                      ? Center(
                          child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CircularProgressIndicator(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Loading. . . .",
                                    style: TextStyle(
                                      color: ColorConstant.red800,
                                    ),
                                  )
                                ],
                              )))
                      : SizedBox(
                          height: 400,
                          width: 300,
                          child: ScrollableTableView(
                            columns: [
                              "Nama Menu",
                              "Jumlah",
                              "Harga",
                            ].map((column) {
                              return TableViewColumn(
                                label: column,
                              );
                            }).toList(),
                            rows: [
                              [
                                // data["first_name"],
                                // data["first_name"],
                                // data["first_name"]
                              ],
                            ].map((record) {
                              return TableViewRow(
                                height: 60,
                                cells: record.map((value) {
                                  return TableViewCell(
                                    child: Text(value),
                                  );
                                }).toList(),
                              );
                            }).toList(),
                          )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: size.width,
                    margin: getMargin(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray800,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      left: 185,
                      top: 0,
                      right: 0,
                    ),
                    child: Container(
                      height: 120,
                      color: Colors.white,
                      alignment: Alignment.bottomLeft,
                      child: Column(children: [
                        const Text(''),
                        Container(
                          width: 150,
                          height: 100,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: 'Jumlah Bayar',
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      left: 35,
                      top: 17,
                      right: 35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "KEMBALI",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              15,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 40,
                          ),
                          child: Text(
                            " Rp. 9.000",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                15,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      44.00,
                    ),
                    width: size.width,
                    margin: getMargin(
                      top: 12,
                    ),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: getMargin(
                              right: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.bluegray100,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 110,
                                      top: 13,
                                      right: 99,
                                      bottom: 13,
                                    ),
                                    child: Text(
                                      " Rp. 21.000",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          15,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          margin: getMargin(
                            left: 0,
                            top: 0,
                            bottom: 3,
                          ),
                          padding: const EdgeInsets.only(top: 4),
                          child: MaterialButton(
                              minWidth: double.infinity,
                              height: 45.0,
                              color: ColorConstant.redA700A5,
                              textColor: Colors.white70,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(""),
                                      content:
                                          const Text("Transaksi berhasil !"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BerandaPetugasView()),
                                            );
                                          },
                                          child: const Text("Okay"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text("Bayar")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
