// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReserveStore on _ReserveStoreBase, Store {
  final _$_modelAtom = Atom(name: '_ReserveStoreBase._model');

  @override
  ReserveModel get _model {
    _$_modelAtom.reportRead();
    return super._model;
  }

  @override
  set _model(ReserveModel value) {
    _$_modelAtom.reportWrite(value, super._model, () {
      super._model = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ReserveStoreBase.loading');

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

  final _$getReserveAsyncAction = AsyncAction('_ReserveStoreBase.getReserve');

  @override
  Future<ReserveModel> getReserve() {
    return _$getReserveAsyncAction.run(() => super.getReserve());
  }

  final _$reserveAsyncAction = AsyncAction('_ReserveStoreBase.reserve');

  @override
  Future<ResponsePostModel> reserve({Objecto modelToJson}) {
    return _$reserveAsyncAction
        .run(() => super.reserve(modelToJson: modelToJson));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
