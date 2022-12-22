import 'dart:convert';
import 'package:resku/DrawerScreen.dart';
import 'package:resku/core.dart';
import 'package:resku/presentation/validasi_screen/validasi_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final String url = "https://reqres.in/api/users?page=1";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pesanan"),
          backgroundColor: ColorConstant.redA700A5,
          centerTitle: true,
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
            )
          ],
        ),
        drawer: const DrawerScreen(),
        body: RefreshIndicator(
          onRefresh: _getRefreshDaata,
          child: data == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: data == null ? 0 : data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text(data![index]["first_name"]),
                                trailing: Column(
                                  children: <Widget>[
                                    Expanded(
                                        child: MaterialButton(
                                            color: ColorConstant.red800Bc,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            minWidth: 55,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ValidasiScreen(
                                                              value:
                                                                  data![index]
                                                                      ["id"])));
                                            },
                                            child: const Text(
                                              "CEK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                    );
                  }),
        ));
  }
}
