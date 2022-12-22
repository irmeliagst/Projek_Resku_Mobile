import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resku/ui/pemesanan_pelanggan.dart';

class CardScreenView extends StatefulWidget {
  late String nama;
  CardScreenView({Key? key, required this.nama}) : super(key: key);

  @override
  State<CardScreenView> createState() => _CardScreenViewState();
}

class _CardScreenViewState extends State<CardScreenView> {
  late Future<List<dynamic>> data;
  late String? jumlah = "";
  // int _counter = 0;
  @override
  void initState() {
    super.initState();
    data = fetchData();
    fetchHarga();
  }

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // Future<List<dynamic>> _fecthDataUsers() async {
  //   var result =
  //       await http.get(Uri.parse("https://reqres.in/api/users?per_page=15"));
  //   return json.decode(result.body)['data'];
  // }

  _checkout() async {
    final response = await http.get(Uri.parse(
        "http://localhost/resku/api/user/checkout.php?nama=${widget.nama}"));
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
        "http://localhost/resku/api/user/daftar_pesanan.php?nama=${widget.nama}"));
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
        "http://localhost/resku/api/user/daftar_pesanan.php?nama=${widget.nama}"));
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
          "Keranjang belanjamu",
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
                      // ListView.builder(
                      //   itemCount: GroceryServices.products.length,
                      //   itemBuilder: (context, index) {
                      //     var item = GroceryServices.products[index];
                      // return SizedBox(
                      //   height: 125.0,
                      //   width: 335,
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 90.0,
                      //         width: 90,
                      //         decoration: BoxDecoration(
                      //           image: DecorationImage(
                      //             image: NetworkImage(
                      //               "${item['photo']}",
                      //             ),
                      //             fit: BoxFit.cover,
                      //           ),
                      //           borderRadius: const BorderRadius.all(
                      //             Radius.circular(
                      //               16.0,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         width: 15.0,
                      //       ),
                      //       SizedBox(
                      //         width: 120,
                      //         child: Column(
                      //           crossAxisAlignment:
                      //               CrossAxisAlignment.start,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               "${item['nama_menu']}",
                      //               style: GoogleFonts.poppins(
                      //                 fontSize: 14,
                      //                 fontWeight: FontWeight.w600,
                      //                 color: Colors.black,
                      //               ),
                      //             ),
                      //             Text(
                      //               "${item['harga']}",
                      //               style: GoogleFonts.poppins(
                      //                 fontSize: 14,
                      //                 fontWeight: FontWeight.w600,
                      //                 color: const Color.fromARGB(
                      //                     255, 168, 2, 2),
                      //               ),
                      //             ),
                      //             Row(
                      //               children: [
                      //                 Container(
                      //                   height: 25.92,
                      //                   width: 25.92,
                      //                   decoration: BoxDecoration(
                      //                     color: Colors.white,
                      //                     borderRadius:
                      //                         const BorderRadius.all(
                      //                       Radius.circular(
                      //                         10.0,
                      //                       ),
                      //                     ),
                      //                     border: Border.all(
                      //                       width: 1.0,
                      //                       color: const Color(0xffC0C8C7),
                      //                     ),
                      //                   ),
                      //                   child: const Icon(
                      //                     Icons.remove,
                      //                     size: 18.0,
                      //                   ),
                      //                 ),
                      //                 Container(
                      //                   margin: const EdgeInsets.symmetric(
                      //                       horizontal: 13.5),
                      //                   child: Text(
                      //                     "1",
                      //                     style: GoogleFonts.poppins(
                      //                       fontSize: 12,
                      //                       fontWeight: FontWeight.w600,
                      //                       color: Colors.black,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Container(
                      //                   height: 25.92,
                      //                   width: 25.92,
                      //                   decoration: const BoxDecoration(
                      //                     color: Color.fromARGB(
                      //                         255, 171, 6, 6),
                      //                     borderRadius: BorderRadius.all(
                      //                       Radius.circular(
                      //                         10.0,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   child: const Icon(
                      //                     Icons.add,
                      //                     size: 18.0,
                      //                     color: Colors.white,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // );
                      //   },
                      // ),
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
                  child: const Text("Pesan"),
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
