import 'package:resku/DrawerScreen.dart';
import 'package:resku/core.dart';
import 'package:resku/presentation/validasi_screen/validasi_screen.dart';
import 'package:flutter/material.dart';
import 'package:resku/presentation/dashboard_screen/detail_dashboard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
      body: ListView.separated(
          itemBuilder: (ctx, i) {
            return ListTile(
              title: Text(
                items[i].nomeja,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
              trailing: Column(
                children: <Widget>[
                  Expanded(
                      child: MaterialButton(
                          color: ColorConstant.red800Bc,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          minWidth: 55,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ValidasiduaScreen()));
                          },
                          child: const Text(
                            "CEK",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          )))
                ],
              ),
            );
          },
          separatorBuilder: (ctx, i) {
            return const Divider();
          },
          itemCount: items.length),
    );
  }
}
