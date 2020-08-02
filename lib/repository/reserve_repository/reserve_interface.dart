import 'package:restaurante_app/models/reserve_model.dart';
import 'package:restaurante_app/models/response_post_model.dart';

abstract class IReserve {

  Future<ReserveModel> getReserve();
  Future<ResponsePostModel> reserve({Objecto modelToJson});
}