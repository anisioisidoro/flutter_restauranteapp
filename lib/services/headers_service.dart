import 'dart:io';
import 'package:restaurante_app/interfaces/local_storage_interface.dart';

import 'shared_local_storage_service.dart';

class HeaderToken {
  Future<Map<String, String>> reader() async {
    Map<String, String> requesteHeader = {
      "content-type": "application/x-www-form-urlencoded",
    };

    return requesteHeader;
  }

  Future<Map<String, String>> readerToken() async {
    final ILocalStorage storage = SharedLocalStorageService();

    var token = await storage.get(key: "token");
    Map<String, String> requesteHeader;

    return requesteHeader = {
      "content-type": "application/x-www-form-urlencoded",
      HttpHeaders.authorizationHeader: "Bearer " + token
    };
  }
}
