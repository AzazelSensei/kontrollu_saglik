import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kontrollu_saglik/bloc/login_cubit/login_cubit.dart';
import 'package:kontrollu_saglik/utils/toast.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rive/rive.dart';

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IntroState();
  }
}

class _IntroState extends State<Intro> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool _visible = true;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SlidingUpPanel(
          body: Stack(
            children: [
              RiveAnimation.asset(
                'assets/imgs/3d_raster_test.riv',
                fit: BoxFit.cover,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 310),
                  child: AnimatedText(),
                ),
              )
            ],
          ),
          maxHeight: 700.0,
          minHeight: 70.0,
          panel: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Pull up tab
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(200),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 170.0,
                      height: 12.0,
                    ),
                  ),
                ),
              ),

              //Panel code
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoaded) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (_) => false,
                    );

                    toastMessage(
                      mess:
                          'Sayın ${state.user.name} ${state.user.surName} Hoş Geldiniz :)',
                      toastType: ToastType.success,
                    );
                  } else if (state is LoginError) {
                    toastMessage(
                      mess: 'Error: ${state.errorMessage}',
                      toastType: ToastType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return Container(
                      height: 675,
                      //panel Background
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(235),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0)),
                      ),

                      //Main Layout Column
                      child: (state is LoginLoading)
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                      ),

                                      Text(
                                        "Giriş Yap",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Text(
                                        "Kullanıcı Adı veya Mail Adresiniz ile Giriş yapabilirsiniz. - admin/123456",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 40,
                                      ),

                                      //field
                                      Text(
                                        "Kullanıcı Adı",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _controller,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor:
                                                Color.fromARGB(255, 30, 26, 26),
                                            hintText: " "),
                                      ),

                                      SizedBox(
                                        height: 50,
                                      ),

                                      //Password
                                      Text(
                                        "Şifre",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _controller2,
                                        obscureText: true,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor:
                                                Color.fromARGB(255, 30, 26, 26),
                                            hintText: ""),
                                      ),
                                      Divider(
                                        height: 15,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Şifremi Unuttum?",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: loginButton(context),
                                ),
                              ],
                            ));
                },
              ),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(70),
              blurRadius: 40,
            ),
          ],
          color: Colors.green.withAlpha(0),
          onPanelClosed: () {
            setState(() {
              _visible = false;
            });
          },
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return GFButton(
        onPressed: () {
          context
              .read<LoginCubit>()
              .login(username: _controller.text, password: _controller2.text);
        },
        text: "Giriş Yap",
        textStyle: TextStyle(
            color: Color.fromRGBO(240, 255, 255, 100),
            fontSize: 22,
            letterSpacing: 2,
            fontWeight: FontWeight.bold),
        size: 65,
        fullWidthButton: true,
        color: Color.fromRGBO(255, 124, 23, 1));
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'Sağlığınız İçin Aradığınız',
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            // shadows: <Shadow> [
            //   Shadow(
            //     offset: Offset(3.0, 1.0),
            //     blurRadius: 5.0,
            //     color: Color.fromARGB(127, 0, 0, 0),
            //   ),
            // ],
          ),
          speed: const Duration(milliseconds: 75),
        ),
        TypewriterAnimatedText(
          'Her Şey Bu Uygulamada',
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Kontrollü Sağlık',
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      totalRepeatCount: 1,
    );
  }
}
