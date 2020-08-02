import 'package:restaurante_app/interfaces/client_http_interface.dart';
import 'package:restaurante_app/models/menu_model.dart';
import 'package:restaurante_app/repository/menu_repository/menu_interface.dart';
import 'package:restaurante_app/services/headers_service.dart';

class MenuRepository implements IMenu {
  final IClientHttp client;

  MenuRepository({this.client});
  @override
  Future<MenuModel> getMenu({String idRestaurant}) async {
    HeaderToken _header = HeaderToken();

    var header = await _header.readerToken();
    var response = await client.get(
        header: header, router: "menu/getByRestaurant/$idRestaurant");

    MenuModel model = MenuModel.fromJson(response);

    return model;
  }
}
