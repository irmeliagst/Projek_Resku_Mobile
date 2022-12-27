import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:resku/module/cart_screens.dart';
import 'package:resku/module/detail_product_screen.dart';
import 'package:resku/presentation/login_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreenView extends StatefulWidget {
  late String nama;
  HomeScreenView({Key? key, required this.nama}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late Future<List<dynamic>> data;
  late String? jumlahPesanan = "";

  @override
  void initState() {
    super.initState();
    data = fetchData();
    _fetchPesanan();
  }

  _fetchPesanan() async {
    var result = await http.get(Uri.parse(
        "http://localhost/resku/api/user/jumlah_pesanan.php?nama=${widget.nama}"));
    var json = jsonDecode(result.body)['data'];
    print(json['jumlah']);
    jumlahPesanan = json['jumlah'];
    setState(() {
      jumlahPesanan = json['jumlah'];
    });
    return json['jumlah'];
  }

  // Future<List<dynamic>> _fecthDataUsers() async {
  //   var result =
  //       await http.get(Uri.parse("https://reqres.in/api/users?per_page=15"));
  //   return json.decode(result.body)['data'];
  // }

  Future<List<dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse("http://localhost/resku/api/user/beranda.php"));
    // print(response.statusCode);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      // return jsonResponse.map((data) => {}).toList();
      print(jsonResponse);
      // print(jsonResponse.map((data) => Menu.fromJson(data)).toList());
      // return jsonResponse.map((data) => Menu.fromJson(data)).toList();
      return jsonResponse;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardScreenView(
                            nama: widget.nama,
                          )),
                );
              }),
              child: Container(
                child: Badge(
                  badgeContent: Text(
                    '$jumlahPesanan',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          icon: const Icon(
            Icons.add_home,
            size: 24.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 171, 6, 6),
        title: Text(
          "Atas nama : ${widget.nama}",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 129.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 171, 6, 6),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey[400]!,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 21.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              initialValue: null,
                              decoration: InputDecoration.collapsed(
                                filled: true,
                                fillColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                hintText: "Search",
                                hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: const Color(0xff5F6E7C),
                                ),
                              ),
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.search),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 13.87,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: FutureBuilder<List<dynamic>>(
                  future: fetchData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 2,
                                childAspectRatio: 160.06 / 190.42),
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var item = snapshot.data[index];
                          return InkWell(
                              onTap: () {
                                print("dilik");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailProductView(
                                            namaPelanggan: widget.nama,
                                            id: item['id'],
                                            gambar: item['gambar'],
                                            nama: item['nama'],
                                            harga: int.parse(item['harga']),
                                          )),
                                );
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: const BoxDecoration(
                                  color: Color(0xffFFFDFD),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 180.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "http://localhost/resku/images/${item['gambar']}",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(
                                            16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 11.35,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 11.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            "Rp. ${item['harga']}",
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
                              ));
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                // FutureBuilder<List<dynamic>>(
                //     future: fetchData(),
                //     builder: (BuildContext context, AsyncSnapshot snapshot) {
                //       if (snapshot.hasData) {
                // return GridView.builder(
                //   gridDelegate:
                //       const SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 2,
                //           mainAxisSpacing: 5,
                //           crossAxisSpacing: 2,
                //           childAspectRatio: 160.06 / 190.42),
                //   itemCount: GroceryServices.products.length,
                //   shrinkWrap: true,
                //   physics: const ScrollPhysics(),
                //   itemBuilder: (BuildContext context, int index) {
                //     var item = GroceryServices.products[index];
                //     return InkWell(
                //       onTap: () {
                //         print("dilik");
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => DetailProductView(
                //                     item: item,
                //                   )),
                //         );
                //       },
                //       child: Container(
                //         margin: const EdgeInsets.symmetric(
                //             horizontal: 5.0),
                //         decoration: const BoxDecoration(
                //           color: Color(0xffFFFDFD),
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(12.0),
                //           ),
                //         ),
                //         child: Column(
                //           crossAxisAlignment:
                //               CrossAxisAlignment.start,
                //           children: [
                //             Container(
                //               height: 97.0,
                //               decoration: BoxDecoration(
                //                 image: DecorationImage(
                //                   image: NetworkImage(
                //                     "http://localhost/resku/images/${item['gambar']}",
                //                   ),
                //                   fit: BoxFit.cover,
                //                 ),
                //                 borderRadius:
                //                     const BorderRadius.vertical(
                //                   top: Radius.circular(
                //                     16.0,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(
                //               height: 11.35,
                //             ),
                //             Container(
                //               margin: const EdgeInsets.symmetric(
                //                   horizontal: 11.0),
                //               child: Column(
                //                 crossAxisAlignment:
                //                     CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     "${item['nama']}",
                //                     style: GoogleFonts.poppins(
                //                       fontSize: 14,
                //                       fontWeight: FontWeight.w600,
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   Text(
                //                     "Rp. ${item['harga']}",
                //                     style: GoogleFonts.poppins(
                //                       fontSize: 14,
                //                       fontWeight: FontWeight.w600,
                //                       color: const Color.fromARGB(
                //                           255, 168, 2, 2),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //             );
                //           },
                //         );
                //       }
                //     })
              ),
            ],
          ),
        ],
      ),
      // floatingActionButton: IconButton(
      //   color: const Color.fromARGB(255, 171, 6, 6),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => LoginScreen()),
      //     );
      //   },
      //   icon: const Icon(
      //     Icons.shopping_cart,
      //     size: 24.0,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
