import 'dart:convert';
import 'package:restaurante_app/interfaces/client_http_interface.dart';
import 'package:http/http.dart' as http;
import 'package:restaurante_app/utils/global_const.dart';

class ClientHttpService implements IClientHttp{
  @override
  Future<Map<String, dynamic>> get({String router, Map<String, dynamic> header }) async {
      
      var response = await http.get(API_URL + router, headers: header);

      return json.decode(response.body);
    }
  
    @override
    Future<Map<String, dynamic >> post({String router, Map<String, dynamic> header, Map<String, dynamic> body}) async{
      
      print(API_URL + router);
      var response = await http.post(API_URL + router, body: body, headers: header);

      return json.decode(response.body);
  }

}