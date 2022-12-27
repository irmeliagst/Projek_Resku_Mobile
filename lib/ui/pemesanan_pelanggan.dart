import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:resku/core.dart';
import 'package:resku/module/home_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: use_build_context_synchronously
class PemesananPelanggan extends StatefulWidget {
  const PemesananPelanggan({super.key});

  @override
  State<PemesananPelanggan> createState() => _PemesananPelangganState();
}

class _PemesananPelangganState extends State<PemesananPelanggan> {
  final _namaController = TextEditingController();
  List<String> listMeja = ["A1", "A2", "A3", "A4", "A5", "A6"];

  String nMeja = "A1";
  int? nilaiMeja;

  void pilihmeja(String value) {
    setState(() {
      nMeja = value;
    });
  }

  void pesan(String nama, String kodeMeja) async {
    try {
      Response response = await post(
          Uri.parse("http://localhost/resku/api/user/pemesanan.php"),
          body: {
            'nama': nama,
            'kode_meja': kodeMeja,
          });
      if (response.statusCode == 200) {
        // Obtain shared preferences.

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('nama_pemesan', nama);
        prefs.setString('kodeMeja', kodeMeja);
        print('true');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreenView(nama: nama)),
        );
      } else {
        print('failed');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: getPadding(
                        bottom: 10,
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgMaskgroup,
                        height: getVerticalSize(
                          173.00,
                        ),
                        width: getHorizontalSize(
                          320.00,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: getMargin(
                        left: 36,
                        top: 20,
                        right: 36,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteA700,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstant.bluegray90066,
                            spreadRadius: getHorizontalSize(
                              2.00,
                            ),
                            blurRadius: getHorizontalSize(
                              2.00,
                            ),
                            offset: const Offset(
                              0,
                              4,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: getHorizontalSize(
                              174.00,
                            ),
                            margin: getMargin(
                              left: 60,
                              top: 40,
                              right: 26,
                            ),
                            child: Text(
                              "Menu Pemesanan ",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.red800,
                                fontSize: getFontSize(
                                  20,
                                ),
                                fontFamily: 'Happy Monkey',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 28,
                              top: 42,
                              right: 28,
                            ),
                            child: Padding(
                              padding: getPadding(),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 10),
                                child: TextFormField(
                                  controller: _namaController,
                                  decoration: const InputDecoration(
                                      hintText: "Masukkan nama anda",
                                      fillColor: Colors.white),
                                  style: TextStyle(
                                    color: ColorConstant.gray700,
                                    fontSize: getFontSize(
                                      10,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: getHorizontalSize(
                              174.00,
                            ),
                            margin: getMargin(
                              left: 44,
                              top: 45,
                              right: 26,
                            ),
                            child: Text(
                              "Pilih meja dengan sesuai ",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.red800,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Happy Monkey',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 28,
                              top: 5,
                              right: 28,
                            ),
                            child: Padding(
                              padding: getPadding(),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 10),
                                child: DropdownButton(
                                  value: nMeja,
                                  onChanged: (String? value) {
                                    pilihmeja(value ?? "");
                                    nilaiMeja = listMeja.indexOf(value ?? "");
                                  },
                                  items: listMeja.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: MaterialButton(
                              height: 50.0,
                              minWidth: 200,
                              color: ColorConstant.redA700A5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              textColor: Colors.white,
                              onPressed: () {
                                if (_namaController.text.isEmpty) {
                                  print("Mohon Isikan Nama");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Mohon Isikan Nama")));
                                } else {
                                  pesan(_namaController.text, nMeja);
                                  print("Silahkan Pilih Menu");
                                  ScaffoldMessenger.of(context);
                                  (const Text("Silahkan Pilih Menu.."));
                                }
                              },
                              child: const Text("Pilih Menu"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding(
                                left: 26,
                                top: 100,
                                right: 26,
                                bottom: 4,
                              ),
                              child: Text(
                                "www.myresku.com",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.gray700,
                                  fontSize: getFontSize(
                                    10,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
