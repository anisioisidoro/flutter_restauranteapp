// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
    MenuModel({
        this.exito,
        this.mensagem,
        this.objecto,
    });

    bool exito;
    String mensagem;
    List<Objecto> objecto;

    factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
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
        this.imagem,
        this.preco,
        this.restaurante,
        this.v,
    });

    String id;
    String nome;
    String imagem;
    int preco;
    String restaurante;
    int v;

    factory Objecto.fromJson(Map<String, dynamic> json) => Objecto(
        id: json["_id"] == null ? null : json["_id"],
        nome: json["nome"] == null ? null : json["nome"],
        imagem: json["imagem"] == null ? null : json["imagem"],
        preco: json["preco"] == null ? null : json["preco"],
        restaurante: json["restaurante"] == null ? null : json["restaurante"],
        
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "imagem": imagem == null ? null : imagem,
        "preco": preco == null ? null : preco,
        "restaurante": restaurante == null ? null : restaurante,
        
    };
}
