// To parse this JSON data, do
//
//     final reserveModel = reserveModelFromJson(jsonString);

import 'dart:convert';

ReserveModel reserveModelFromJson(String str) => ReserveModel.fromJson(json.decode(str));

String reserveModelToJson(ReserveModel data) => json.encode(data.toJson());

class ReserveModel {
    ReserveModel({
        this.exito,
        this.mensagem,
        this.objecto,
    });

    bool exito;
    String mensagem;
    List<Objecto> objecto;

    factory ReserveModel.fromJson(Map<String, dynamic> json) => ReserveModel(
        exito: json["exito"] == null ? null : json["exito"],
        mensagem: json["mensagem"] == null ? null : json["mensagem"],
        objecto: json["objecto"] == null ? null : List<Objecto>.from(json["objecto"].map((x) => Objecto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "exito": exito == null ? null : exito,
        "mensagem": mensagem == null ? null : mensagem,
        "objecto": objecto == null ? null : List<dynamic>.from(objecto.map((x) => x.toJson())),
    };
}

class Objecto {
    Objecto({
        this.id,
        this.usuario,
        this.restaurante,
        this.estado,
        this.dataReserva,
        this.horaReserva,
        this.v,
        this.idRestaurante
    });

    String id;
    String usuario;
    Restaurante restaurante;
    String idRestaurante;
    String estado;
    String dataReserva;
    String horaReserva;
    int v;

    factory Objecto.fromJson(Map<String, dynamic> json) => Objecto(
        id: json["_id"] == null ? null : json["_id"],
        usuario: json["usuario"] == null ? null : json["usuario"],
        restaurante: json["restaurante"] == null ? null : Restaurante.fromJson(json["restaurante"]),
        estado: json["estado"] == null ? null : json["estado"].toString(),
        dataReserva: json["dataReserva"] == null ? null : json["dataReserva"],
        horaReserva: json["horaReserva"] == null ? null : json["horaReserva"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
      
        "restaurante": idRestaurante == null ? null : idRestaurante,
        "estado": estado == null ? null : estado,
        "dataReserva": dataReserva == null ? null : dataReserva,
        "horaReserva": horaReserva == null ? null : horaReserva
       
    };
}

class Restaurante {
    Restaurante({
        this.id,
        this.nome,
        this.municipio,
        this.website,
        this.imagem,
        this.telemovel,
        this.latitude,
        this.v,
    });

    String id;
    String nome;
    String municipio;
    String website;
    String imagem;
    int telemovel;
    String latitude;
    int v;

    factory Restaurante.fromJson(Map<String, dynamic> json) => Restaurante(
        id: json["_id"] == null ? null : json["_id"],
        nome: json["nome"] == null ? null : json["nome"],
        municipio: json["municipio"] == null ? null : json["municipio"],
        website: json["website"] == null ? null : json["website"],
        imagem: json["imagem"] == null ? null : json["imagem"],
        telemovel: json["telemovel"] == null ? null : json["telemovel"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "municipio": municipio == null ? null : municipio,
        "website": website == null ? null : website,
        "imagem": imagem == null ? null : imagem,
        "telemovel": telemovel == null ? null : telemovel,
        "latitude": latitude == null ? null : latitude,
        "__v": v == null ? null : v,
    };
}
