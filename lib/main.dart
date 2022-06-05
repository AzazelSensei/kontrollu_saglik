import 'package:flutter/material.dart';
import 'package:kontrollu_saglik/screens/rowPageThree.dart';
import 'package:kontrollu_saglik/screens/articles.dart';
import 'package:kontrollu_saglik/screens/introScreen.dart';
import 'package:kontrollu_saglik/screens/mainScreenVideo.dart';
import 'package:kontrollu_saglik/screens/rowPageOne.dart';
import 'package:kontrollu_saglik/screens/pro.dart';
import 'package:kontrollu_saglik/screens/profile.dart';
import 'package:kontrollu_saglik/screens/register.dart';
import 'package:kontrollu_saglik/screens/services.dart';
import 'package:kontrollu_saglik/screens/settings.dart';
import 'package:kontrollu_saglik/screens/rowPageTwo.dart';
import 'package:sizer/sizer.dart';

import 'screens/components.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Kontrollü Sağlık',
        debugShowCheckedModeBanner: false,
// theme: ThemeData(fontFamily: 'Montserrat'),
        initialRoute: "/intro",
        routes: <String, WidgetBuilder>{
          '/settings': (BuildContext context) => new Settings(),
          "/intro": (BuildContext context) => new Intro(),
          //"/apitest": (BuildContext context) => new ApiTest(),
          //"/hometest": (BuildContext context) => new MainScreen(),
          "/pro": (BuildContext context) => new Pro(),
          "/profile": (BuildContext context) => new Profile(),
          "/articles": (BuildContext context) => new Articles(),
          "/components": (BuildContext context) => new Components(),
          "/account": (BuildContext context) => new Register(),
          "/services": (BuildContext context) => new Services(),
          "/home": (BuildContext context) => new MainVideoScreen(),
          "/photos": (BuildContext context) => new PhotographyScreen(),
          "/videos": (BuildContext context) => new VideoraphyScreen(),
          "/web": (BuildContext context) => new ServiceWidget(
                serviceName: "Ruhsal Travma",
                serviceBody:
                    'Kişiyi aşırı korkutan, dehşet içinde bırakan, çaresizlik yaratan, çoğu kez olağandışı ve beklenmedik olayların yol açtığı etkilere ruhsal travma denir. Savaşlar, patlamalar, doğal afetler (deprem, sel, yangın gibi), işkence, tecavüz, kazalar, şiddet olayları ruhsal travmaya neden olabilir.',
                imageReference: "assets/imgs/travma.png",
              ),
          "/market": (BuildContext context) => new ServiceWidget(
                serviceName: "Diyabet Nedir?",
                serviceBody:
                    'Diyabet, kandaki şeker düzeyini dengeleyen insülin hormonunun; eksikliği ve/veya yeterince salgılanmasına rağmen, vücutta kullanılamaması sonucu oluşan kronik metabolizma bozukluğudur. ',
                imageReference: "assets/imgs/diyabet.png",
              ),
          "/software": (BuildContext context) => new ServiceWidget(
                serviceName: "Astım Nedir?",
                serviceBody:
                    'Astım hava yolunun şişerek daraldığı ve aşırı mukus oluşumunun görüldüğü kronik bir rahatsızlıktır. Bu durum da astım hastalarında solunum güçlüğü, öksürük, hırıltılı solunum gibi semptomlara yol açar. ',
                imageReference: "assets/imgs/astim.png",
              ),
        },
      );
    });
  }
}
