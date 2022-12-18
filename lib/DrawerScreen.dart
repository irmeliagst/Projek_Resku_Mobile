// ignore: file_names
import 'package:flutter/material.dart';
import 'package:resku/core.dart';
import 'package:resku/presentation/login_screen/login_screen.dart';

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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profil.png'),
                  ),
                ),
              ),
              const Text(
                "Duwi Wirda Septania",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Petugas 1",
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 14,
                ),
              )
            ])),
        const SizedBox(
          height: 10,
        ),
        DrawerListTile(
            iconData: Icons.logout_sharp,
            title: "Logout",
            onTilePressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: const Text("Informasi"),
                        content: const Text("Apakah anda yakin ingin keluar ?"),
                        actions: [
                          MaterialButton(
                            color: ColorConstant.red800Bc,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            },
                            textColor: ColorConstant.whiteA700,
                            child: const Text("YA"),
                          ),
                          MaterialButton(
                            color: ColorConstant.red800Bc,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            textColor: ColorConstant.whiteA700,
                            child: const Text("TIDAK"),
                          ),
                        ]);
                  });
            })
      ],
    ));
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
