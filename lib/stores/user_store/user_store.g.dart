// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  final _$_modelAtom = Atom(name: '_UserStoreBase._model');

  @override
  LoginModel get _model {
    _$_modelAtom.reportRead();
    return super._model;
  }

  @override
  set _model(LoginModel value) {
    _$_modelAtom.reportWrite(value, super._model, () {
      super._model = value;
    });
  }

  final _$tokenAtom = Atom(name: '_UserStoreBase.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$loadingAtom = Atom(name: '_UserStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_UserStoreBase.login');

  @override
  Future<LoginModel> login({LoginModel modelToJson}) {
    return _$loginAsyncAction.run(() => super.login(modelToJson: modelToJson));
  }

  final _$getUserInfoAsyncAction = AsyncAction('_UserStoreBase.getUserInfo');

  @override
  Future<LoginModel> getUserInfo() {
    return _$getUserInfoAsyncAction.run(() => super.getUserInfo());
  }

  @override
  String toString() {
    return '''
token: ${token},
loading: ${loading}
    ''';
  }
}
