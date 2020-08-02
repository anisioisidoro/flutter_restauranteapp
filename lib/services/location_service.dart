import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:restaurante_app/stores/restaurant_store/restaurant_store.dart';
class LocationService {

  
 Set<Marker> markers = {};
  Future<bool> _listenLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
    }
    if (_permissionGranted == PermissionStatus.GRANTED) {
        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
        }
      }
    
  }

  Future<LocationData> cgetLocation() async {
    Location location = new Location();
    LocationData _locationData;
    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();

    if(_serviceEnabled){
      _locationData = await location.getLocation();
    }
    print(_locationData);
    return _locationData;
  }

  // void setMarks({LatLng latLng}){
  //   markers.add(Marker(
  //         markerId: MarkerId('sourcePin'),
  //         position: LatLng(latLng.latitude, latLng.longitude),
          
  //         infoWindow: InfoWindow(title: "Minha Localização"),
  //       ));
  // }

}
