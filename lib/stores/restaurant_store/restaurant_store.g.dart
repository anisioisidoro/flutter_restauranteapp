// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantStore on _RestaurantStoreBase, Store {
  final _$_modelAtom = Atom(name: '_RestaurantStoreBase._model');

  @override
  RestaurantModel get _model {
    _$_modelAtom.reportRead();
    return super._model;
  }

  @override
  set _model(RestaurantModel value) {
    _$_modelAtom.reportWrite(value, super._model, () {
      super._model = value;
    });
  }

  final _$_modelMapAtom = Atom(name: '_RestaurantStoreBase._modelMap');

  @override
  RestaurantModel get _modelMap {
    _$_modelMapAtom.reportRead();
    return super._modelMap;
  }

  @override
  set _modelMap(RestaurantModel value) {
    _$_modelMapAtom.reportWrite(value, super._modelMap, () {
      super._modelMap = value;
    });
  }

  final _$loadingAtom = Atom(name: '_RestaurantStoreBase.loading');

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

  final _$getRestaurantAsyncAction =
      AsyncAction('_RestaurantStoreBase.getRestaurant');

  @override
  Future<RestaurantModel> getRestaurant({String municipio}) {
    return _$getRestaurantAsyncAction
        .run(() => super.getRestaurant(municipio: municipio));
  }

  final _$getAllAsyncAction = AsyncAction('_RestaurantStoreBase.getAll');

  @override
  Future<RestaurantModel> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
