import 'package:restaurante_app/interfaces/client_http_interface.dart';
import 'package:restaurante_app/models/response_post_model.dart';

import 'package:restaurante_app/models/reserve_model.dart';
import 'package:restaurante_app/services/headers_service.dart';

import 'reserve_interface.dart';

class ReserveRepository implements IReserve {
  final IClientHttp client;

  ReserveRepository({this.client});
  @override
  Future<ReserveModel> getReserve() async {
    HeaderToken _header = HeaderToken();

    var header = await _header.readerToken();
    var response =
        await client.get(header: header, router: "reserve/getByUser");

    ReserveModel model = ReserveModel.fromJson(response);

    return model;
  }

  @override
  Future<ResponsePostModel> reserve({Objecto modelToJson}) async {
    HeaderToken _header = HeaderToken();

    var header = await _header.readerToken();

    var dados = modelToJson.toJson();
    var response = await client.post(
        header: header,
        router: "reserve/addReserve",
        body: dados);

    ResponsePostModel model = ResponsePostModel.fromJson(response);

    return model;
  }
}
