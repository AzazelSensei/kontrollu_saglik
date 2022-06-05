import 'package:flutter/material.dart';
import 'package:kontrollu_saglik/screens/rowPageThree.dart';
import 'package:kontrollu_saglik/screens/articles.dart';
import 'package:kontrollu_saglik/screens/getStarted.dart';
import 'package:kontrollu_saglik/screens/inquriry.dart';
import 'package:kontrollu_saglik/screens/introScreen.dart';
import 'package:kontrollu_saglik/screens/mainScreen.dart';
import 'package:kontrollu_saglik/screens/mainScreenVideo.dart';
import 'package:kontrollu_saglik/screens/newscreen.dart';
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
          "/apitest": (BuildContext context) => new ApiTest(),
          "/OldHome": (BuildContext context) => new MainScreen(),
          "/pro": (BuildContext context) => new Pro(),
          "/profile": (BuildContext context) => new Profile(),
          "/articles": (BuildContext context) => new Articles(),
          "/components": (BuildContext context) => new Components(),
          "/account": (BuildContext context) => new Register(),
          "/ask": (BuildContext context) => new Inquiry(),
          "/start": (BuildContext context) => new Started(),
          "/services": (BuildContext context) => new Services(),
          "/home": (BuildContext context) => new MainVideoScreen(),
          "/photos": (BuildContext context) => new PhotographyScreen(),
          "/videos": (BuildContext context) => new VideoraphyScreen(),
          "/web": (BuildContext context) => new ServiceWidget(
                serviceName: "Diyabet ile Yaşam",
                serviceBody:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Eget nunc, eu quis nunc non potenti nulla ultricies. '
                    'At sed tincidunt nullam sed massa consectetur arcu libero.',
                imageReference: "assets/imgs/diyabet.png",
              ),
          "/market": (BuildContext context) => new ServiceWidget(
                serviceName: "Diyabet Nedir?",
                serviceBody:
                    'Diyabet, kandaki şeker düzeyini dengeleyen insülin hormonunun; eksikliği ve/veya yeterince salgılanmasına rağmen, vücutta kullanılamaması sonucu oluşan kronik metabolizma bozukluğudur. ',
                imageReference: "assets/imgs/diyabet.png",
              ),
          "/software": (BuildContext context) => new ServiceWidget(
                serviceName: "Software Development",
                serviceBody:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Eget nunc, eu quis nunc non potenti nulla ultricies. '
                    'At sed tincidunt nullam sed massa consectetur arcu libero.',
                imageReference: "assets/imgs/diyabet.png",
              ),
        },
      );
    });
  }
}
