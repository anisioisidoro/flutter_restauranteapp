import 'package:mobx/mobx.dart';
import 'package:restaurante_app/models/menu_model.dart';
import 'package:restaurante_app/repository/menu_repository/menu_interface.dart';
part 'menu_store.g.dart';

class MenuStore = _MenuStoreBase with _$MenuStore;

MenuModel temporaryDataMenu;

abstract class _MenuStoreBase with Store {

 final  IMenu repository;
 _MenuStoreBase({this.repository});
  
  @observable
  MenuModel _model;

  @observable
  bool loading =false;

 

  MenuModel get model => _model;

  Future<MenuModel> getMenu({String idRestaurant}) async{
    
    try {
      loading = true;
    _model = await repository.getMenu(idRestaurant: idRestaurant);
     
     temporaryDataMenu = _model;

     loading =false;
    } catch (e) {
      loading =false;
    } finally{
      loading =false;
    }

  }
}