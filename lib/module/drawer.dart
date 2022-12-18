// ignore: file_names
import 'package:flutter/material.dart';
import 'package:resku/core.dart';
import 'package:resku/splashscreen2.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            color: ColorConstant.redA700A5,
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DrawerListTile(
                    iconData: Icons.logout_sharp,
                    title: "Login Petugas",
                    onTilePressed: () {
                      MaterialButton(
                        color: ColorConstant.red800Bc,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SplashScreenPage()));
                        },
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
