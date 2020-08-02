import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurante_app/interfaces/local_storage_interface.dart';
import 'package:restaurante_app/models/login_model.dart';
import 'package:restaurante_app/pages/home_page/home_page.dart';
import 'package:restaurante_app/pages/login_page/login_page.dart';
import 'package:restaurante_app/repository/restaurant_repository/restaurant_interface.dart';
import 'package:restaurante_app/repository/user_repository/user_interfaces.dart';
import 'package:restaurante_app/services/service_locator.dart';
import 'package:restaurante_app/stores/restaurant_store/restaurant_store.dart';
import 'package:restaurante_app/utils/global_const.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;
LoginModel temporaryDataLogin;

abstract class _UserStoreBase with Store {
  final IUserApi repository;
  final ILocalStorage storage;


  @observable
  LoginModel _model;

  LoginModel get model => _model;

  @observable
  String token;

  @observable
  bool loading = false;

  _UserStoreBase({this.repository, this.storage}) {
    storage.get(key: "token").then((value) {
      token = value;
    });
  }

  @action
  Future<LoginModel> login({LoginModel modelToJson}) async {
    _model = await repository.login(modelToJson: modelToJson);

    if (_model.exito) {
      await storage.put(key: "token", value: _model.token);
      temporaryDataLogin = _model;

      Navigator.pushAndRemoveUntil(
          globalKey.currentContext,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          (Route<dynamic> route) => false);
    } else {
      globalKey.currentState.showSnackBar(SnackBar(
        content: Text(_model.mensagem),
        backgroundColor: Colors.red,
      ));
    }
  }

  @action
  Future<LoginModel> getUserInfo() async {
  try {
    loading = true;
    _model = await repository.getUserInfo();

    if (_model.exito) {
      temporaryDataLogin = _model;
    }

    loading = false;
  } catch (e) {
    loading = false;
  } finally{
    loading = false;
  }
  }

  void mainPage() {
    Future.delayed(Duration(seconds: 5), () async {
      if (token == null) {
        Navigator.pushAndRemoveUntil(
            globalIntroPage.currentContext,
            MaterialPageRoute(builder: (_) => LoginPage()),
            (Route<dynamic> route) => false);
      } else {
         
         
        await getUserInfo();
        Navigator.pushAndRemoveUntil(
            globalIntroPage.currentContext,
            MaterialPageRoute(builder: (_) => HomePage()),
            (Route<dynamic> route) => false);
      }
    });
  }
}
