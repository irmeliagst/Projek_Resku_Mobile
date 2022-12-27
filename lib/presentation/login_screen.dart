// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:http/http.dart';
import 'package:resku/core.dart';
import 'package:flutter/material.dart';
import 'package:resku/presentation/beranda_petugas.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Future<List<login>> getLogin() async {
  void login(String username, String password) async {
    try {
      Response response = await post(
          Uri.parse("http://localhost/resku/api/petugas/login_petugas.php"),
          body: {
            'username': username,
            'password': password,
          });
      // if (response.statusCode == 200) {
      //   // ignore: use_build_context_synchronously
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const DashboardScreen()),
      //   );
      //   // ignore: avoid_print
      //   print('berhasil');
      // } else {
      //   // ignore: avoid_print
      //   print('failed');
      // }
    } catch (e) {
      // ignore: avoid_print

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: getPadding(
                        bottom: 10,
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgMaskgroup,
                        height: getVerticalSize(
                          173.00,
                        ),
                        width: getHorizontalSize(
                          320.00,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: getMargin(
                        left: 36,
                        top: 20,
                        right: 36,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteA700,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            20.00,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstant.bluegray90066,
                            spreadRadius: getHorizontalSize(
                              2.00,
                            ),
                            blurRadius: getHorizontalSize(
                              2.00,
                            ),
                            offset: const Offset(
                              0,
                              4,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: getHorizontalSize(
                              174.00,
                            ),
                            margin: getMargin(
                              left: 26,
                              top: 40,
                              right: 26,
                            ),
                            child: Text(
                              "Login Petugas ",
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.red800,
                                fontSize: getFontSize(
                                  20,
                                ),
                                fontFamily: 'Happy Monkey',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 28,
                              top: 42,
                              right: 28,
                            ),
                            child: Padding(
                              padding: getPadding(),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 10),
                                child: TextFormField(
                                  controller: usernameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Masukan Username Anda";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Masukkan username",
                                      fillColor: Colors.white),
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
                          ),
                          Padding(
                            padding: getPadding(
                              left: 28,
                              top: 30,
                              right: 28,
                            ),
                            child: Padding(
                              padding: getPadding(),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 10),
                                child: TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Masukan Password Anda";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: "Masukkan password",
                                      fillColor: Colors.white),
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: MaterialButton(
                              height: 50.0,
                              minWidth: 200,
                              color: ColorConstant.redA700A5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              textColor: Colors.white,
                              // ignore: duplicate_ignore
                              // onPressed: () {
                              //   // login(usernameController.text.toString(),
                              //   //     passwordController.text.toString()
                              //   //     password: '', username: "");
                              //   // ignore: unused_local_variable
                              //   String username = usernameController.text;
                              //   String password = passwordController.text;
                              //   if (usernameController.text.isEmpty &&
                              //       passwordController.text.isEmpty) {
                              //     // ignore: avoid_print
                              //     print("username dan password benar");
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //             content: Text(
                              //                 "username dan password benar")));
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               const DashboardScreen()),
                              //     );
                              //   } else {
                              //     // ignore: avoid_print
                              //     print("username dan password salah");
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //             content: Text(
                              //                 "username dan password salah")));
                              //   }
                              // },
                              onPressed: () {
                                if (usernameController.text.isEmpty &&
                                    passwordController.text.isEmpty) {
                                  // ignore: avoid_print
                                  print("username dan password salah");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "username dan password salah")));
                                } else {
                                  // ignore: avoid_print
                                  login(usernameController.text,
                                      passwordController.text);
                                  print("username dan password benar");
                                  ScaffoldMessenger.of(context);
                                  (const Text("username dan password benar"));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BerandaPetugasView()),
                                  );
                                }
                              },
                              child: const Text("Log In"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding(
                                left: 26,
                                top: 100,
                                right: 26,
                                bottom: 4,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
