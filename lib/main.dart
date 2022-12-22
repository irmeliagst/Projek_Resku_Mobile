import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resku/module/home_screens.dart';
import 'package:resku/splashscreen2.dart';
import 'package:resku/ui/pemesanan_pelanggan.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

// Widget mainview = const WelcomeView();
// Widget mainview = const RegisterView();
// Widget mainview = const HomeScreenView();
// ignore: prefer_const_constructors
Widget mainview = SplashScreenPage(
  nama: '',
);
// Widget mainview = const DetailProductView();
// Widget mainview = const CheckoutScreenView();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Resku',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PemesananPelanggan());
  }
}
