import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurante_app/models/reserve_model.dart'  as reservemodel;
import 'package:restaurante_app/models/restaurant_model.dart';
import 'package:restaurante_app/services/service_locator.dart';

import 'package:restaurante_app/shared_widget/drawer_widget.dart';
import 'package:restaurante_app/stores/reserve_store/reserve_store.dart';
import 'package:restaurante_app/utils/global_const.dart';

import 'menu_card_widget.dart';

class MenuPage extends StatelessWidget {
  final Objecto model;

  MenuPage({Key key, this.model}) : super(key: key);

  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _controller = TextEditingController();

  var _reserveStore = locator<ReserveStore>();

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
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: AssetImage("assets/background.png"))),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF032A7B),
                    // gradient: LinearGradient(
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter,
                    //     colors: [
                    //       Colors.black,
                    //       Colors.blue
                    //     ]),
                  ),
                  child: Container(
                      // margin: EdgeInsets.all(60),
                      child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          // RaisedButton(
                          //   elevation: 100,

                          //       color: Color(0xFFF032A7B),
                          //       child: Text(
                          //         "Opções",
                          //         style: TextStyle(color: Colors.white),
                          //       ),
                          //       onPressed: () => _key.currentState.openDrawer()),
                          GestureDetector(
                            onTap: () => _key.currentState.openDrawer(),
                            child: Container(
                              width: 75,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  // gradient: LinearGradient(colors: [
                                  //   Colors.black.withOpacity(0.5),
                                  //   Color(0xFFF032A7B)
                                  // ],
                                  // begin: Alignment.topCenter,
                                  // end: Alignment.bottomCenter
                                  // )
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Opções",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          Image.asset(
                            "assets/logo.png",
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Text(
                          model.nome ?? "",
                          style: TextStyle(
                              color: Colors.white, fontSize: 25, height: 2),
                        )),
                      ],
                    ),
                    Positioned(
                      top: 220,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, right: 20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Aberto",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              model.website ?? "Desconhecido",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 20),
                            Text(
                              model.telemovel.toString() ?? "",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ])),
                ),
              ),
              // HomeCityWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFFFED145B),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Menu",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )))
                  ],
                ),
              ),
              Expanded(
                  child: MenuCardWidget(
                idRestaurant: model.id,
              ))
            ],
          )
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Color(0xFFF032A7B),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: CircleAvatar(
              backgroundColor: Color(
                (0xFFFED145B),
              ),
              maxRadius: 28,
              child: Icon(
                Icons.restaurant,
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      
                        child: Container(
                      height: 250,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Scaffold(
                        key: globalDialogWidget,
                        body: ListView(
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                                child: Text(
                              "Reservar",
                              style: TextStyle(),
                            )),
                            DateTimePicker(
                              type: DateTimePickerType.dateTimeSeparate,
                              initialValue: '',
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              dateLabelText: 'Data',
                              timeLabelText: 'Hora',
                              onChanged: (val) {
                                _controller.text = val;
                              },
                              validator: (val) {
                                print(val);
                                return null;
                              },
                              onSaved: (val) => print(val),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Center(child: Observer(builder: (_) {
                                  if(_reserveStore.loading){
                                    return CircularProgressIndicator();
                                  }else{
                                    return RaisedButton(
                                    color: Color(0xFFFED145B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text("Reservar",
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () {

                                      

                                      if(_controller.text.isNotEmpty){
                                        _reserveStore.reserve(
                                        modelToJson: reservemodel.Objecto(
                                          estado: "0",
                                          idRestaurante: model.id,
                                            dataReserva: _controller.text?.substring(0,10),
                                            horaReserva: _controller.text?.substring(11,16)
                                        )
                                      );
                                      }

                                    },
                                  );
                                  }
                                })),
                                Center(
                                  child: RaisedButton(
                                    color: Color(0xFFF032A7B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text("Cancelar",
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
                  });
            },
          ),
        ],
      ),
    )));
  }
}
