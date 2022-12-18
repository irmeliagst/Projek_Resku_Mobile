import 'package:resku/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:resku/presentation/proses_screen/proses_screen.dart';

import '../validasi_screen/validasi_item_widget.dart';
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

class ValidasiduaScreen extends StatelessWidget {
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
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
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
                  "Pesanan Meja 01",
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
              Container(
                  height: 500,
                  color: Colors.white,
                  child: Scrollbar(
                    child: _buildListView(),
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
                        margin: getMargin(
                          left: 50,
                          top: 1,
                          bottom: 1,
                        ),
                        padding: getPadding(
                          left: 5,
                          top: 12,
                          right: 5,
                          bottom: 12,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.redA700A5,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProsesScreen()),
                            );
                          },
                          child: Text(
                            "BAYAR SEKARANG",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.whiteA700,
                              fontSize: getFontSize(
                                13,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
