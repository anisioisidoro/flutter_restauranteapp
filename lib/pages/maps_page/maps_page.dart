import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:restaurante_app/services/location_service.dart';
import 'package:restaurante_app/stores/restaurant_store/restaurant_store.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
LocationService _locationService;

LocationData myLocalizetion;
 GoogleMapController _controller;

Completer<GoogleMapController> map_controller = Completer();
Set<Polyline> _polyline = {};
  @override
  void initState() {
    _locationService = LocationService();

    
    _locationService.cgetLocation().then((value) {
      if(value?.latitude.toString().isNotEmpty && value?.longitude.toString().isNotEmpty){
        setState(() {
          myLocalizetion = value;
          
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Stack(
                children: <Widget>[

                  
                  GoogleMap(
                            markers: markers,
                            polylines: _polyline,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(myLocalizetion?.latitude ?? -8.910128,
                                    myLocalizetion?.longitude ?? 13.206195),
                                zoom: 5),
                            onMapCreated: (GoogleMapController controller) async{
                              map_controller.complete(controller);
                               _controller =
                            await map_controller.future;

                            
                            },
                            // setMapPins();
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: IconButton(icon: Icon(Icons.my_location, size: 50, color: Color(0xFFF121E85),), onPressed: () {
                    
                     _locationService.cgetLocation().then((value) {
                      
                    //       setState(() {
                    //       myLocalizetion  = value;

                    //       _controller.animateCamera(
                    //         CameraUpdate.newLatLng(LatLng(myLocalizetion?.latitude, myLocalizetion?.longitude)));
                    //     _locationService.setMarks(latLng: LatLng(myLocalizetion?.latitude, myLocalizetion?.longitude));
                    // });
                    });
                  }),
                            ),
                          )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}