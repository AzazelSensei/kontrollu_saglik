// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kontrollu_saglik/constants/Theme.dart';
import 'package:kontrollu_saglik/widgets/drawer.dart';
import 'package:kontrollu_saglik/widgets/input.dart';
import 'package:kontrollu_saglik/widgets/navbar.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkboxValue = false;

  final double height = window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          transparent: true,
          title: "Hesap Oluştur",
          reverseTextcolor: true,
        ),
        extendBodyBehindAppBar: true,
        drawer: NowDrawer(currentPage: "Account"),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/imgs/Fbg.png"),
                      fit: BoxFit.cover)),
            ),
            SafeArea(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16.0, right: 16.0, bottom: 32),
                  child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.78,
                          color: UIColors.bgColorScreen,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24.0, bottom: 8),
                                    child: Center(
                                        child: Text("Kayıt Oluştur",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RawMaterialButton(
                                        onPressed: () {},
                                        elevation: 4.0,
                                        fillColor: UIColors.socialFacebook,
                                        child: Icon(FontAwesomeIcons.facebook,
                                            size: 20.0, color: Colors.white),
                                        padding: EdgeInsets.all(15.0),
                                        shape: CircleBorder(),
                                      ),
                                      RawMaterialButton(
                                        onPressed: () {},
                                        elevation: 4.0,
                                        fillColor: UIColors.socialTwitter,
                                        child: Icon(FontAwesomeIcons.twitter,
                                            size: 20.0, color: Colors.white),
                                        padding: EdgeInsets.all(15.0),
                                        shape: CircleBorder(),
                                      ),
                                      RawMaterialButton(
                                        onPressed: () {},
                                        elevation: 4.0,
                                        fillColor: UIColors.socialDribbble,
                                        child: Icon(FontAwesomeIcons.dribbble,
                                            size: 20.0, color: Colors.white),
                                        padding: EdgeInsets.all(15.0),
                                        shape: CircleBorder(),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24.0, bottom: 24.0),
                                    child: Center(
                                      child: Text("YA DA",
                                          style: TextStyle(
                                              color: UIColors.time,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16)),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Input(
                                          placeholder: "Ad",
                                          prefixIcon:
                                              Icon(Icons.school, size: 25),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Input(
                                            placeholder: "Soyad",
                                            prefixIcon:
                                                Icon(Icons.email, size: 25)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            left: 8.0,
                                            right: 8.0,
                                            bottom: 0),
                                        child: Input(
                                            placeholder: "Mail",
                                            prefixIcon:
                                                Icon(Icons.lock, size: 25)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 0, bottom: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Checkbox(
                                                activeColor: UIColors.primary,
                                                onChanged: (bool newValue) =>
                                                    setState(() =>
                                                        _checkboxValue =
                                                            newValue),
                                                value: _checkboxValue),
                                            Text(
                                                "Şartları Okudum Kabul Ediyorum",
                                                style: TextStyle(
                                                    color: UIColors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w200)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: RaisedButton(
                                      textColor: UIColors.white,
                                      color: UIColors.primary,
                                      onPressed: () {
                                        // Respond to button press
                                        Navigator.pushReplacementNamed(
                                            context, '/home');
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 32.0,
                                              right: 32.0,
                                              top: 12,
                                              bottom: 12),
                                          child: Text("Abone Ol",
                                              style:
                                                  TextStyle(fontSize: 14.0))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                ),
              ]),
            )
          ],
        ));
  }
}
