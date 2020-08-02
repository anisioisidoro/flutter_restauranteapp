import 'package:flutter/material.dart';
import 'package:restaurante_app/shared_widget/drawer_widget.dart';
import 'reserva_card_widget.dart';

class ReservaPage extends StatefulWidget {
  @override
  _ReservaPageState createState() => _ReservaPageState();
}

class _ReservaPageState extends State<ReservaPage> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: SafeArea(
            child: Scaffold(
      key: _key,
      drawer: drawerMenu(),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 270,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/background.png"))),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Color(0xFFF032A7B).withOpacity(0.80)
                        ]),
                  ),
                  child: Container(
                      margin: EdgeInsets.all(60),
                      child: Stack(
                        children: <Widget>[
                          RaisedButton(
                              color: Colors.blue.withOpacity(0.5),
                              child: Text(
                                "Opções",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () => _key.currentState.openDrawer()),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 50),
                              child: Image.asset(
                                "assets/logo.png",
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Reservas",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              //HomeCardWidget(),
              Expanded(child: ReservaCardWidget())
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFF032A7B),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    )));
  }
}
