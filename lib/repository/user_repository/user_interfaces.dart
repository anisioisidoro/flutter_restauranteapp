import 'package:restaurante_app/models/login_model.dart';
import 'package:restaurante_app/models/response_post_model.dart';

abstract class IUserApi{
  Future<LoginModel> getUserInfo();

  Future<ResponsePostModel> register({Map<String, dynamic> body});

  Future<LoginModel> login({LoginModel modelToJson});
  
}