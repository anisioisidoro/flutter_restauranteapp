import 'dart:ffi';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurante_app/models/restaurant_model.dart';
import 'package:restaurante_app/repository/restaurant_repository/restaurant_interface.dart';
part 'restaurant_store.g.dart';

class RestaurantStore = _RestaurantStoreBase with _$RestaurantStore;
RestaurantModel temporaryDataRestaurant;
Set<Marker> markers = {};
RestaurantModel temporaryDataMap;
abstract class _RestaurantStoreBase with Store {
  final IRestaurant repository;

  _RestaurantStoreBase({this.repository});

  @observable
  RestaurantModel _model;
  RestaurantModel get model => _model;


@observable
RestaurantModel _modelMap;
  @observable
  bool loading = false;

  @action
  Future<RestaurantModel> getRestaurant({String municipio}) async {
    try {
      loading = true;
      _model = await repository.getRestaurant(municipio: municipio);

      if(_model.exito){
        temporaryDataRestaurant = _model;
      }
      loading = false;
    } catch (e) {
      loading = false;
    } finally {
      loading = false;
    }
  }

  @action
  Future<RestaurantModel> getAll() async {
    try {
      loading = true;
      _modelMap = await repository.getAll();

      temporaryDataMap = _modelMap;

      if(temporaryDataMap.exito){
        temporaryDataMap.objecto.forEach((e){
            if(e.latitude!=null && e.longitude!=null){
              markers.add(
            Marker(markerId: MarkerId(e.id),
          infoWindow: InfoWindow(title: e.nome??"" ),
             position: LatLng(double.tryParse(e.latitude), double.tryParse(e.longitude)))
          );
            }
        });

        print(markers.length);
      }
      loading = false;
    } catch (e) {
      loading = false;
    } finally {
      loading = false;
    }
  }
}
