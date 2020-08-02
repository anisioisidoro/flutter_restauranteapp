import 'package:restaurante_app/models/restaurant_model.dart';

abstract class IRestaurant{

  Future<RestaurantModel> getRestaurant({String municipio});

Future<RestaurantModel> getAll();
  
}