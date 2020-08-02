import 'dart:async';

import 'package:restaurante_app/interfaces/client_http_interface.dart';
import 'package:restaurante_app/models/response_post_model.dart';
import 'package:restaurante_app/models/login_model.dart';
import 'package:restaurante_app/repository/user_repository/user_interfaces.dart';
import 'package:restaurante_app/services/headers_service.dart';

class UserRepositroy implements IUserApi {
  final IClientHttp client;

  UserRepositroy({this.client});
  @override
  Future<LoginModel> getUserInfo() async {
    HeaderToken _header = HeaderToken();

    var header = await _header.readerToken();

    var response = await client.get(header: header, router: "user/info");

    LoginModel model = LoginModel.fromJson(response);

    return model;
  }

  @override
  Future<ResponsePostModel> register({Map<String, dynamic> body}) async {
    HeaderToken _header = HeaderToken();

    var header = await _header.reader();

    var response =
        await client.post(header: header, router: "user/addUser", body: body);

    ResponsePostModel model = ResponsePostModel.fromJson(response);

    return model;
  }

  @override
  Future<LoginModel> login ({LoginModel modelToJson}) async {
    HeaderToken _header = HeaderToken();

    var header = await _header.reader();

    var response = await client.post(
        header: header, router: "user/Login", body: modelToJson.toJson());

    LoginModel model = LoginModel.fromJson(response);

    return model;
  }
}
