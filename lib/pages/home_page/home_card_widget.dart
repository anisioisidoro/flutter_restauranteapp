import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurante_app/animations/card_animation.dart';
import 'package:restaurante_app/models/restaurant_model.dart';
import 'package:restaurante_app/pages/menu_page/menu_page.dart';
import 'package:restaurante_app/services/service_locator.dart';
import 'package:restaurante_app/stores/restaurant_store/restaurant_store.dart';


import 'home_page.dart';

class HomeCardWidget extends StatelessWidget {

  var _restaurantStore = locator<RestaurantStore>();

  @override
  Widget build(BuildContext context) {
    

    
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        child: Observer(
          builder: (_) {

            if(_restaurantStore.loading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (_restaurantStore.model != null ||
                temporaryDataRestaurant != null) {
              if (_restaurantStore.model.objecto.length > 0 ||
                  temporaryDataRestaurant.objecto.length > 0) {
                List<Objecto> model = _restaurantStore.model != null
                    ? _restaurantStore.model.objecto
                    : temporaryDataRestaurant.objecto;

                return ListView.builder(
                    controller: HomePage.controller,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: model.length,
                    itemBuilder: (BuildContext context, index) {
                      return CardAnimation(
                        index: index,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MenuPage(
                                          model: model[index]
                                        )));
                          },
                          child: Container(
                            height: 115,
                            width: 100,
                            child: Card(
                                child: Row(
                              children: <Widget>[
                                Image.network(model[index].imagem,height: 100, width: 100,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          width: size.width/1.60,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Expanded(child: Text(model[index].nome ?? ""),),
                                               Container(
                                                 margin: EdgeInsets.symmetric(horizontal: 3),
                                                    width: 70,
                                                    child: RaisedButton(
                                                      color: Color(0xFFFED145B),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10)),
                                                      onPressed: () {},
                                                      child: Row(
                                                        children: <Widget>[
                                                          Text("${3} "),
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.orange,
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Image.asset("assets/fechado.png"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Aberto")
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Mesas disponível",
                                            style: TextStyle(color: Colors.green),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                          ),
                        ),
                      );
                    });
              } else{
                return Container(child: Center(child: Text("Não há restaurantes disponível"),),);
              }
            } else{

              return Container(child: Center(child: Text("Não há restaurantes"),),);
              
            }
          },
        ),
      ),
    );
  }
}
