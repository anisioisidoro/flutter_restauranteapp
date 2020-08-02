// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

RestaurantModel restaurantModelFromJson(String str) => RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) => json.encode(data.toJson());

class RestaurantModel {
    RestaurantModel({
        this.exito,
        this.mensagem,
        this.objecto,
    });

    bool exito;
    String mensagem;
    List<Objecto> objecto;

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
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
        this.nome,
        this.municipio,
        this.website,
        this.imagem,
        this.telemovel,
        this.latitude,
        this.v,
        this.longitude,
    });

    String id;
    String nome;
    String municipio;
    String website;
    String imagem;
    int telemovel;
    String latitude;
    String longitude;
    int v;

    factory Objecto.fromJson(Map<String, dynamic> json) => Objecto(
        id: json["_id"] == null ? null : json["_id"],
        nome: json["nome"] == null ? null : json["nome"],
        municipio: json["municipio"] == null ? null : json["municipio"],
        website: json["website"] == null ? null : json["website"],
        imagem: json["imagem"] == null ? null : json["imagem"],
        telemovel: json["telemovel"] == null ? null : json["telemovel"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["latitude"] == null ? null : json["longitude"],
       
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "municipio": municipio == null ? null : municipio,
        "website": website == null ? null : website,
        "imagem": imagem == null ? null : imagem,
        "telemovel": telemovel == null ? null : telemovel,
        "latitude": latitude == null ? null : latitude,
        
    };
}
