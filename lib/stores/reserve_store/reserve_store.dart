import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurante_app/models/reserve_model.dart';
import 'package:restaurante_app/models/response_post_model.dart';
import 'package:restaurante_app/repository/reserve_repository/reserve_interface.dart';
import 'package:restaurante_app/utils/global_const.dart';
part 'reserve_store.g.dart';

class ReserveStore = _ReserveStoreBase with _$ReserveStore;
ReserveModel temporaryDataReserve;

abstract class _ReserveStoreBase with Store {
  final IReserve repository;
  _ReserveStoreBase({this.repository});

  @observable
  ReserveModel _model;

  @observable
  bool loading = false;

  ReserveModel get model => _model;

  @action
  Future<ReserveModel> getReserve() async {
    loading = true;
    _model = await repository.getReserve();

    temporaryDataReserve = _model;

    loading = false;
  }

  @action
  Future<ResponsePostModel> reserve({Objecto modelToJson}) async {
    loading = true;
    ResponsePostModel responsePostModel =
        await repository.reserve(modelToJson: modelToJson);

    loading = false; 
    globalDialogWidget.currentState.showSnackBar(SnackBar(content: Text(responsePostModel?.mensagem??""), ),);
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pop(globalDialogWidget.currentContext);
    });
    return responsePostModel;
  }
}