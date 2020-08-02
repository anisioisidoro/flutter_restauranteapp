import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurante_app/animations/card_animation.dart';
import 'package:restaurante_app/models/home_card_model.dart';
import 'package:restaurante_app/models/menu_model.dart';
import 'package:restaurante_app/services/service_locator.dart';
import 'package:restaurante_app/stores/menu_store/menu_store.dart';


class MenuCardWidget extends StatefulWidget{

final String idRestaurant;

  const MenuCardWidget({Key key, this.idRestaurant}) : super(key: key);

  @override
  _MenuCardWidgetState createState() => _MenuCardWidgetState();
}

class _MenuCardWidgetState extends State<MenuCardWidget> {

  var _menuStore = locator<MenuStore>();

  @override
  void initState() {
    
    _menuStore.getMenu(idRestaurant: widget.idRestaurant);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        child: Observer(builder: (_) {
          
          if(_menuStore.loading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(_menuStore.model !=null || temporaryDataMenu!=null){

            if(_menuStore.model.objecto.length>0 || temporaryDataMenu.objecto.length>0){

              List<Objecto> model  = _menuStore.model!=null? _menuStore.model.objecto: temporaryDataMenu.objecto;
                return ListView.builder(
            shrinkWrap: true,
            itemCount:model.length,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return CardAnimation(
                index: index,
                child:  Container(
                  height: 115,
                  width: 100,
                  child: Card(
                      child: Row(
                    children: <Widget>[
                      Image.network(model[index].imagem, width: 100,height: 100,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         Expanded(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  width: 150,
                                  child: Text(
                                    model[index].nome,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFED145B),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "${model[index].preco} Kz",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            width: 150,
                            child: Text(
                              "Disponível",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                
              ),
              );
            });

            } else{
               return Container(child: Center(child: Text("Não há restaurantes disponível"),),);
            }

          }else{

             return Container(child: Center(child: Text("Não há menu"),),); 
          }
        })));
  }
}
          
  
