import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurante_app/animations/card_animation.dart';
import 'package:restaurante_app/models/reserve_model.dart';
import 'package:restaurante_app/services/service_locator.dart';
import 'package:restaurante_app/stores/reserve_store/reserve_store.dart';

class ReservaCardWidget extends StatefulWidget {
  @override
  _ReservaCardWidgetState createState() => _ReservaCardWidgetState();
}

class _ReservaCardWidgetState extends State<ReservaCardWidget> {
  var _reserveStore = locator<ReserveStore>();
  @override
  void initState() {
    _reserveStore.getReserve();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Container(child: Observer(builder: (_) {
          if (_reserveStore.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_reserveStore.model != null || temporaryDataReserve != null) {
            if (_reserveStore.model.objecto.length > 0 ||
                temporaryDataReserve.objecto.length > 0) {
              List<Objecto> model = _reserveStore.model != null
                  ? _reserveStore.model.objecto
                  : temporaryDataReserve.objecto;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.length,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return CardAnimation(
                      index: index,
                      child: Container(
                        height: 115,
                        width: 100,
                        child: Card(
                            child: Row(
                          children: <Widget>[
                            Image.network(model[index].restaurante.imagem,height: 100,width: 100,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 200,
                                          child: Text(
                                            model[index].restaurante.nome,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        // Container(
                                        //   width: 100,
                                        //   height: 50,
                                        //   decoration: BoxDecoration(
                                        //       color: Color(0xFFFED145B),
                                        //       borderRadius: BorderRadius.circular(10)),
                                        //   child: Center(
                                        //       child: Text(
                                        //     "${model[index].preco}",
                                        //     style: TextStyle(color: Colors.white),
                                        //   )),
                                        // )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "Estado:",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        width: 150,
                                        child: Text(
                                          model[index].estado == 0
                                              ? "Pendente"
                                              : model[index].estado == 1
                                                  ? "Confirmado"
                                                  : "Cancelado",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: model[index].estado == 0
                                                  ? Colors.yellow
                                                  : model[index].estado == 1
                                                      ? Colors.green
                                                      : Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    width: 150,
                                    child: Text(
                                      "${model[index].dataReserva} ${model[index].horaReserva} ",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                      ),
                    );
                  });
            } else {
              return Container(
                child: Center(
                  child: Text("Não há reservas disponível"),
                ),
              );
            }
          } else {
            return Container(
              child: Center(
                child: Text("Não há reservas"),
              ),
            );
          }
        })));
  }
}
