import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resku/DrawerScreen.dart';
import 'package:http/http.dart' as http;
import 'package:resku/presentation/detail_pesanan.dart';
import 'package:resku/presentation/detail_trans.dart';

import '../core/utils/color_constant.dart';

// ignore: must_be_immutable
class BerandaPetugasView extends StatefulWidget {
  const BerandaPetugasView({super.key});

  @override
  State<BerandaPetugasView> createState() => _BerandaPetugasViewState();
}

class _BerandaPetugasViewState extends State<BerandaPetugasView> {
  late Future<List<dynamic>> data;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(
        Uri.parse("http://localhost/resku/api/petugas/beranda_petugas.php"));
    // print(response.statusCode);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      // return jsonResponse.map((data) => {}).toList();
      return jsonResponse;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Beranda Petugas ",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: ColorConstant.redA700A5,
        centerTitle: true,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
          )
        ],
      ),
      drawer: const DrawerScreen(),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FutureBuilder<List<dynamic>>(
                future: fetchData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data[index];
                          return Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ListTile(
                                      title: Text(
                                        "Nama ${item['nama']}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      trailing: Column(
                                        children: <Widget>[
                                          Expanded(
                                            child: MaterialButton(
                                              padding: const EdgeInsets.all(10),
                                              // ignore: sort_child_properties_last
                                              child: const Text(
                                                "Bayar",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              color: ColorConstant.red800Bc,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              minWidth: 55,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            DetailTransaksi(
                                                              nama: '',
                                                            )));
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: MaterialButton(
                                              padding: const EdgeInsets.all(10),
                                              // ignore: sort_child_properties_last
                                              child: const Text(
                                                "CEK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              color: ColorConstant.red800Bc,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              minWidth: 55,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            DetailPesanan(
                                                                nama: item[
                                                                    "nama"])));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
