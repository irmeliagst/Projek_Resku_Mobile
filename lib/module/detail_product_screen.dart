// ignore_for_file: unnecessary_const

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:resku/module/home_screens.dart';

class DetailProductView extends StatefulWidget {
  late String nama;
  late String namaPelanggan;
  late String id;
  late int harga;
  late String gambar;
  DetailProductView(
      {required this.nama,
      required this.namaPelanggan,
      required this.id,
      required this.harga,
      required this.gambar,
      Key? key})
      : super(key: key);

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  late Future<List<dynamic>> data;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _tambah(qty) async {
    print(qty.toString());
    try {
      Response response = await post(
          Uri.parse(
              "http://localhost/resku/api/user/tambah_pesanan.php?nama=${widget.namaPelanggan}"),
          body: {
            'id_menu': widget.id,
            'qty': qty.toString(),
          });
      if (response.statusCode == 200) {
        // Obtain shared preferences.

        print(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreenView(nama: widget.namaPelanggan)),
        );
      } else {
        print('failed');
      }
    } catch (e) {
      print(e);
    }
  }

  var selected = 0;
  Map item = {
    "photo":
        "https://i.ibb.co/dG68KJM/photo-1513104890138-7c749659a591-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
    "nama": "Frenzy Pizza",
    "harga": 25,
  };
  @override
  Widget build(BuildContext context) {
    var menu = ["Details"];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Dashboard"),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 265.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "http://localhost/resku/images/${widget.gambar}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 27.12,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 25.0,
              ),
              child: Text(
                widget.nama,
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "${widget.harga}",
                  style: GoogleFonts.poppins(
                    fontSize: 25.0,
                    color: const Color.fromARGB(255, 168, 2, 2),
                    fontWeight: FontWeight.normal,
                    // decoration: TextDecoration.lineThrough),
                  ),
                ),

                // const SizedBox(
                //   width: 28.0,
                // ),
              ],
            ),
            const SizedBox(
              height: 33.0,
            ),
            Container(
              height: 40,
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(menu.length, (index) {
                  var item = menu[index];
                  return InkWell(
                    onTap: () {
                      selected = index;

                      setState(() {});
                    },
                    child: Container(
                      height: 100.0,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(item,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 12)),
                          const Spacer(),
                          (selected == index)
                              ? Container(
                                  height: 2.0,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 168, 2, 2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        16.0,
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            Container(
              height: 250.0,
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              decoration: const BoxDecoration(),
              child: IndexedStack(index: selected, children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 22.0,
                      ),
                      SizedBox(
                        height: 128,
                        child: Text("deskripsi eek"),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 93.85,
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 25.92,
              width: 25.92,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xffC0C8C7),
                ),
              ),
              child: GestureDetector(
                onTap: (() => _decrementCounter()),
                child: const Icon(
                  Icons.remove,
                  size: 18.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 13.5),
              child: Text(
                "$_counter",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 25.92,
              width: 25.92,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 171, 6, 6),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () => _incrementCounter(),
                child: const Icon(
                  Icons.add,
                  size: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 185.29,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 168, 2, 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(62),
                  ),
                ),
                onPressed: () {
                  // Navigator.pop(context);
                  _tambah(_counter);
                },
                child: const Text("pilih"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
