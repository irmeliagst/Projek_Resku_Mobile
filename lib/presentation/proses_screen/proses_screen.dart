import 'package:resku/presentation/dashboard_screen/dashboard_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../proses_screen/proses_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:resku/core.dart';
import 'package:resku/widgets/custom_button.dart';

Widget _buildListView() {
  return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, index) {
        return ListTile(title: Text('Item $index'));
      });
}

class ProsesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.redA700A5,
          title: const Text('Pesanan'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
            }),
          ),
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 25,
                    top: 7,
                    right: 25,
                  ),
                  child: Text(
                    "Transaksi",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.red800,
                      fontSize: getFontSize(
                        15,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: size.width,
                    margin: getMargin(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray800,
                    ),
                  ),
                ),
                SizedBox(
                    height: 320,
                    child: ScrollableTableView(
                      columns: [
                        "id_transaksi",
                        "nama_barang",
                        "jumlah",
                        "harga",
                      ].map((column) {
                        return TableViewColumn(
                          label: column,
                        );
                      }).toList(),
                      rows: [
                        ["PR1000", "jus pisang", "1", "10.000"],
                        ["PR1000", "nasi goreng", "1", "20.000"],
                        ["PR1000", "piscok", "1", "8.000"],
                        ["PR1000", "bakso", "1", "12.000"],
                        ["PR1000", "karedok", "1", "9.000"],
                        ["PR1000", "mi goreng", "1", "9.000"],
                        ["PR1000", "fuyunghai", "1", "19.000"],
                        ["PR1000", "udang saus mentega", "1", "30.000"],
                      ].map((record) {
                        return TableViewRow(
                          height: 60,
                          cells: record.map((value) {
                            return TableViewCell(
                              child: Text(value),
                            );
                          }).toList(),
                        );
                      }).toList(),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: size.width,
                    margin: getMargin(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray800,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      left: 185,
                      top: 0,
                      right: 0,
                    ),
                    child: Container(
                      height: 120,
                      color: Colors.white,
                      alignment: Alignment.bottomLeft,
                      child: Column(children: [
                        const Text(''),
                        Container(
                          width: 150,
                          height: 100,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: 'Jumlah Bayar',
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      left: 35,
                      top: 17,
                      right: 35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "KEMBALI",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              15,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 40,
                          ),
                          child: Text(
                            " Rp. 9.000",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                15,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      44.00,
                    ),
                    width: size.width,
                    margin: getMargin(
                      top: 12,
                    ),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: getMargin(
                              right: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.bluegray100,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 110,
                                      top: 13,
                                      right: 99,
                                      bottom: 13,
                                    ),
                                    child: Text(
                                      " Rp. 21.000",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          15,
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
                        Container(
                          width: 150,
                          height: 100,
                          margin: getMargin(
                            left: 0,
                            top: 0,
                            bottom: 3,
                          ),
                          padding: const EdgeInsets.only(top: 4),
                          child: MaterialButton(
                              minWidth: double.infinity,
                              height: 45.0,
                              color: const Color.fromARGB(255, 194, 45, 45),
                              textColor: Colors.white70,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(""),
                                      content:
                                          const Text("transaksi berhasil!"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DashboardScreen()),
                                            );
                                          },
                                          child: const Text("Okay"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text("Bayar")),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      left: 101,
                      top: 26,
                      right: 101,
                      bottom: 7,
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
      ),
    );
  }
}
