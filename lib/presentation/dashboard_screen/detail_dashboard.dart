import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashboardduaScreen extends StatefulWidget {
  const DashboardduaScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardduaScreenState createState() => _DashboardduaScreenState();
}

class _DashboardduaScreenState extends State<DashboardduaScreen> {
  final String url = "http://localhost/resku/api/petugas/validasi.php";
  List? data;
  @override
  void initState() {
    _getRefreshDaata();
    super.initState();
  }

  Future<void> _getRefreshDaata() async {
    getJsonData(context);
  }

  Future<void> getJsonData(BuildContext context) async {
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
    });
    // ignore: avoid_print
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
    });
  }

  // List _listayam = [];

  // Future _getayam() async {
  //   try {
  //     final respone = await http
  //         .get(Uri.parse("http://127.0.0.1/resku/api/petugas/validasi.php"));
  //     if (respone.statusCode == 200) {
  //       //  print(respone.body);
  //       final ayam = jsonDecode(respone.body);
  //       setState(() {
  //         _listayam = ayam;
  //       });
  //     }
  //   } catch (e) {
  //     //  print(e);
  //   }
  // }

  // @override
  // void initState() {
  //   _getayam();
  //   // print(_listayam);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pesanan"),
        ),
        body: RefreshIndicator(
          onRefresh: _getRefreshDaata,
          child: data == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: data == null ? 0 : data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(data![index]['nomor']),
                        // subtitle: Text(data![index]['nomor']),
                      ),
                    );
                  },
                ),
        ));
  }
}

//    List _listmeja = [];

//   Future _getmeja() async {
//     try {
//       final respone =
//           await http.get(Uri.parse("http://localhost/resku/api/petugas/validasi.php"));
//       if (respone.statusCode == 200) {
//         //  print(respone.body);
//         final meja = jsonDecode(respone.body);
//         setState(() {
//           _listmeja = meja;
//         });
//       }
//     } catch (e) {
//       //  print(e);
//     }
//   }

//   @override
//   void initState() {
//     _getmeja();
//     // print(_listayam);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Pesanan"),
//           backgroundColor: ColorConstant.redA700A5,
//           centerTitle: true,
//           actions: const <Widget>[
//             Padding(
//               padding: EdgeInsets.all(8.0),
//             )
//           ],
//         ),
//         drawer: const DrawerScreen(),
//         body: RefreshIndicator(
//           onRefresh: _getmeja,
//           child: data == null
//               ? Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   itemCount: data == null ? 0 : !.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                       padding: EdgeInsets.all(5.0),
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             child: Padding(
//                               padding: EdgeInsets.all(10.0),
//                               child: ListTile(
//                                 title: Text(data![index]["nomor"]),
//                                 trailing: Column(
//                                   children: <Widget>[
//                                     Expanded(
//                                         child: MaterialButton(
//                                             child: Text(
//                                               "CEK",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontWeight:
//                                                       FontWeight.normal),
//                                             ),
//                                             color: ColorConstant.red800Bc,
//                                             shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20)),
//                                             minWidth: 55,
//                                             onPressed: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (_) =>
//                                                           ValidasiScreen(
//                                                               value:
//                                                                   data![index]
//                                                                       ["id"])));
//                                             }))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Divider()
//                         ],
//                       ),
//                     );
//                   }),
//         ));
//   }
// }
