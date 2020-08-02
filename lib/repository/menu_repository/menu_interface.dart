import 'package:restaurante_app/models/menu_model.dart';

abstract class IMenu{

  Future<MenuModel> getMenu({String idRestaurant});
}