import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurante_app/services/service_locator.dart';
import 'package:restaurante_app/shared_widget/drawer_widget.dart';
import 'package:restaurante_app/stores/restaurant_store/restaurant_store.dart';

import 'home_card_widget.dart';
import 'home_city_widget.dart';

class HomePage extends StatefulWidget {
  static ScrollController controller = ScrollController();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();
  double heightImg = 250;

 var _restaurantStore = locator<RestaurantStore>();

 @override
  void initState() {
    _restaurantStore.getAll();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: SafeArea(
            child: Scaffold(
      key: _key,
      drawer: drawerMenu(),
      body: Stack(
          //physics: NeverScrollableScrollPhysics(),
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
                                onPressed: () =>
                                    _key.currentState.openDrawer()),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 50),
                                child: Image.asset(
                                  "assets/logo.png",
                                  height: heightImg,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                HomeCityWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: <Widget>[
                      Observer(builder: (_) {return Text("${_restaurantStore?.model?.objecto?.length??""} Restaurantes");})
                    ],
                  ),
                ),
                Expanded(
                  child: HomeCardWidget(),
                )
              ],
            ),
          ],
        ),
      
    )));
  }
}
