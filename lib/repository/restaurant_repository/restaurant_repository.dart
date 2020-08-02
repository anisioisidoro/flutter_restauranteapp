import 'package:restaurante_app/interfaces/client_http_interface.dart';
import 'package:restaurante_app/models/restaurant_model.dart';
import 'package:restaurante_app/services/headers_service.dart';

import 'restaurant_interface.dart';

class RestaurantRepository implements IRestaurant {
  final IClientHttp client;

  RestaurantRepository({this.client});
  @override
  Future<RestaurantModel> getRestaurant({String municipio}) async {
    HeaderToken _header = HeaderToken();

    var header = await _header.readerToken();
    var response = await client.get(
      header: header,
      router: "restaurant/getByMunicipio/$municipio",
    );

    RestaurantModel model = RestaurantModel.fromJson(response);

    return model;
  }

  Future<RestaurantModel> getAll() async {
    HeaderToken _header = HeaderToken();

    var header = await _header.readerToken();
    var response = await client.get(
      header: header,
      router: "restaurant/getAll",
    );

    RestaurantModel model = RestaurantModel.fromJson(response);

    return model;
  }
}
