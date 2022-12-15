import 'package:flutter/material.dart';
import '../constans.dart';
import 'package:sqflite/sqflite.dart';
import '../models/keranjang.dart';

// ignore: use_key_in_widget_constructors
class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  List<Keranjang> keranjanglist = [];
  int jmlnotif = 0;

  get api => null;

  @override
  void initState() {
    super.initState();
    // getkeranjang();
    // cekLogin();
    _tabController = TabController(vsync: this, length: 1);
    _tabController!.addListener(_setActiveTabIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Future<List<Keranjang>> getkeranjang() async {
  //   // final Future<Database> dbFuture = api.initDb(null);
  //   dbFuture.then((database) {
  //     Future<List<Keranjang>> listFuture = api.getkeranjang();
  //     listFuture.then((_keranjanglist) {
  //       if (mounted) {
  //         setState(() {
  //           keranjanglist = _keranjanglist;
  //         });
  //       }
  //     });
  //   });
  //   return keranjanglist;
  // }

  void _setActiveTabIndex() {
    //_activeTabIndex = _tabController.index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
              title: TextField(
                onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                  //   return new SearchPage();
                  // }));
                  Navigator.of(context).pushNamed('/cari');

                  // Navigator.of(context).push(
                  //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                  //   return new SearchPage();
                  // }));
                },
                readOnly: true,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Palette.orange),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    fillColor: const Color(0xfff3f3f4),
                    filled: true),
              ),
              backgroundColor: Palette.abang,
              // ignore: prefer_const_literals_to_create_immutables
              actions: <Widget>[],
              actionsIconTheme: const IconThemeData(
                  size: 26.0, color: Colors.white, opacity: 10.0),
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Palette.orange,
                labelColor: Palette.orange,
                unselectedLabelColor: Colors.grey,
                labelPadding: const EdgeInsets.all(0),
                tabs: const [
                  Tab(text: 'Beranda'),
                  // Tab(text: 'Kategori'),
                ],
              )),
        ));
  }
}
