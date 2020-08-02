import 'package:flutter/material.dart';
import 'package:restaurante_app/Shared_Widget/shared_widget.dart';
import 'package:restaurante_app/pages/login_page/login_widget/login_widget.dart';
import 'package:restaurante_app/pages/login_page/login_widget/register_widget.dart';
import 'package:restaurante_app/utils/global_const.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool selectd = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: globalKey,
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/background.png",
                      ))),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black.withOpacity(0.5),
                        Color(0xFFF032A7B).withOpacity(0.80)
                      ])),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        "assets/logo.png",
                        height: 120,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          width: size.width / 2,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: selectd
                                            ? Colors.transparent
                                            : Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    height: 50,
                                    width: 120,
                                    child: InkWell(
                                        onTap: () {
                                          if (selectd) {
                                            setState(() {
                                              selectd = !selectd;
                                            });
                                          }
                                        },
                                        child: Center(
                                            child: Text(
                                          "SIGNUP",
                                          style: TextStyle(
                                              color: selectd
                                                  ? Colors.white
                                                  : Colors.black),
                                        ))),
                                  ),
                                  SizedBox(
                                    width: 103.5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: selectd
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    height: 50,
                                    width: 120,
                                    child: InkWell(
                                        onTap: () {
                                          if (!selectd) {
                                            setState(() {
                                              selectd = !selectd;
                                            });
                                          }
                                        },
                                        child: Center(
                                            child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: selectd
                                                  ? Colors.black
                                                  : Colors.white),
                                        ))),
                                  )
                                ],
                              ),
                              Container(
                                  height: 400,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFFF),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: selectd
                                      ? LoginWidget()
                                      : RegisterWidget()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}
