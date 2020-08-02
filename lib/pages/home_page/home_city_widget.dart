import 'package:flutter/material.dart';
import 'package:restaurante_app/services/service_locator.dart';
import 'package:restaurante_app/stores/restaurant_store/restaurant_store.dart';


class HomeCityWidget extends StatefulWidget {


  @override
  _HomeCityWidgetState createState() => _HomeCityWidgetState();
}

class _HomeCityWidgetState extends State<HomeCityWidget> {
  String index = citys[0];

  
   var _restaurantStore = locator<RestaurantStore>();
  static List<String> citys = [
    "BELAS",
    "KILAMBA",
    "ALVALADE",
    "VIANA",
  ];

  @override
  void initState() {
    
    _restaurantStore.getRestaurant(municipio: citys[0]);
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: citys
              .map((e) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: RaisedButton(
                        elevation: 5,
                        color:
                            index.contains(e) ? Color(0xFFFED145B) : Colors.white,
                        onPressed: () {
                          if (!index.contains(e)) {
                            setState(() {
                              
                              index = e;
                              _restaurantStore.getRestaurant(municipio: e);
                            });
                          }
                        },
                        child: Text(e.toUpperCase())),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
