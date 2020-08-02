// To parse this JSON data, do
//
//     final responsePostModel = responsePostModelFromJson(jsonString);

import 'dart:convert';

ResponsePostModel responsePostModelFromJson(String str) => ResponsePostModel.fromJson(json.decode(str));

String responsePostModelToJson(ResponsePostModel data) => json.encode(data.toJson());

class ResponsePostModel {
    ResponsePostModel({
        this.exito,
        this.mensagem,
        this.objecto,
    });

    bool exito;
    String mensagem;
    dynamic objecto;

    factory ResponsePostModel.fromJson(Map<String, dynamic> json) => ResponsePostModel(
        exito: json["exito"] == null ? null : json["exito"],
        mensagem: json["mensagem"] == null ? null : json["mensagem"],
        objecto: json["objecto"],
    );

    Map<String, dynamic> toJson() => {
        "exito": exito == null ? null : exito,
        "mensagem": mensagem == null ? null : mensagem,
        "objecto": objecto,
    };
}
