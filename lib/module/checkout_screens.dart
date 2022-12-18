import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:resku/module/home_screens.dart';

class CheckoutScreenView extends StatefulWidget {
  const CheckoutScreenView({Key? key}) : super(key: key);

  @override
  State<CheckoutScreenView> createState() => _CheckoutScreenViewState();
}

class _CheckoutScreenViewState extends State<CheckoutScreenView> {
  List dataCheckout = [
    {
      "photo":
          "https://i.ibb.co/dG68KJM/photo-1513104890138-7c749659a591-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "nama_menu": "Frenzy Pizza",
      "harga": 50000,
    },
    {
      "photo":
          "https://i.ibb.co/mHtmhmP/photo-1521305916504-4a1121188589-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "nama_menu": "Beef Burger",
      "harga": 24000,
    },
  ];

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9F1F5),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Pesan Sekarang",
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              Center(
                child: Container(
                  height: 115.99,
                  width: 335,
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Masukan nama",
                          style: GoogleFonts.poppins(
                              fontSize: 13, fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 90.0,
                        width: 335,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 204.75,
                width: 335,
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Daftar Pesanan",
                        style: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      height: 180.0,
                      width: 335,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            dataCheckout.length,
                            (index) {
                              var item = dataCheckout[index];
                              return ListTile(
                                leading: Container(
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${item['photo']}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text("${item['nama_menu']}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                subtitle: Text("\$${item['harga']}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                            255, 242, 16, 16),
                                        fontWeight: FontWeight.normal)),
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 116.44,
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              32.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff516971),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                Text("74.000",
                    style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 227, 27, 27),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 185.29,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 57, 57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(62), // <-- Radius
                    ),
                  ),
                  onPressed: () async {
                    isLoading = true;
                    print(isLoading);
                    setState(() {});
                    Future.delayed(
                      const Duration(seconds: 3),
                      () async {
                        isLoading = false;
                        setState(() {});
                        print(isLoading);
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actions: <Widget>[
                                Container(
                                  height: 430.0,
                                  width: 335,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        16.0,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 108.0,
                                        width: 108,
                                        margin: const EdgeInsets.only(
                                            top: 61.0,
                                            left: 90,
                                            right: 90,
                                            bottom: 45),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              16.0,
                                            ),
                                          ),
                                          // image: DecorationImage(
                                          //   image: AssetImage(
                                          //     "assets/images/icon-succes-transaction.png",
                                          //   ),
                                          //   fit: BoxFit.cover,
                                          // ),
                                        ),
                                      ),
                                      Text("Berhasil melakukan pemesanan",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(
                                        height: 25.0,
                                      ),
                                      Text("Mohon ditunggu",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: const Color(0xff516971),
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(
                                        height: 35.0,
                                      ),
                                      SizedBox(
                                        width: 280,
                                        height: 50,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 255, 57, 57),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50), // <-- Radius
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeScreenView()),
                                              );
                                            },
                                            child: const Text("oke")),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: (isLoading != false)
                      ? const CircularProgressIndicator()
                      : const Text("Pesan Sekarang")),
            ),
          ],
        ),
      ),
    );
  }
}
