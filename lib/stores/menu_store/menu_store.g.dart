// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuStore on _MenuStoreBase, Store {
  final _$_modelAtom = Atom(name: '_MenuStoreBase._model');

  @override
  MenuModel get _model {
    _$_modelAtom.reportRead();
    return super._model;
  }

  @override
  set _model(MenuModel value) {
    _$_modelAtom.reportWrite(value, super._model, () {
      super._model = value;
    });
  }

  final _$loadingAtom = Atom(name: '_MenuStoreBase.loading');

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

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
