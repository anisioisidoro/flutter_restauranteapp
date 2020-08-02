import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurante_app/pages/maps_page/maps_page.dart';
import 'package:restaurante_app/pages/reserva_page/reserva_page.dart';
import 'package:restaurante_app/services/service_locator.dart';
import 'package:restaurante_app/stores/user_store/user_store.dart';


class drawerMenu extends StatelessWidget {

  
  var _userStore = locator<UserStore>();
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width / 1.5,
       // height: height/1.3,
        color: Color(0xFFF121E85),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Observer(builder: (_) {
                           return Text(
                         _userStore.model!=null? _userStore?.model?.objecto?.nome??"":temporaryDataLogin?.objecto?.nome??"",
                          style: TextStyle(color: Colors.white),
                        );
                        
                        },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Terminar Sessão", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: (size.width / 1.5) / 7,
                ),
                GestureDetector(
                  onTap:() => Navigator.pop(context),
                  child: Image.asset("assets/close.png"))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/search.png",
                    height: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Procurado Recentemente",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/place.png",
                    height: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Teu Lugar Favorito",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: InkWell(
                onTap: (){

                  Navigator.pop(context);
                   Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => MapsPage()
                ));
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/map.png",
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Ver Mapa",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: InkWell(
                onTap: (){

                  Navigator.pop(context);
                   Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => ReservaPage()
                ));
                },
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/contract.png", height: 30,),
                    SizedBox(width: 10,),
                    Text("Reservas", style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                  width: 100,
                  height: 2,
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: Text(
                  "Definições",
                  style: TextStyle(color: Colors.white),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: Text(
                  "FeedBack",
                  style: TextStyle(color: Colors.white),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: Text(
                  "Ajuda",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      );
  }
}