// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.token,
        this.exito,
        this.mensagem,
        this.objecto,
        this.telemovel,
        this.senha
    });

    String token;
    bool exito;
    String mensagem;
    Objecto objecto;
    String telemovel;
    String senha;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"] == null ? null : json["token"],
        exito: json["exito"] == null ? null : json["exito"],
        mensagem: json["mensagem"] == null ? null : json["mensagem"],
        objecto: json["objecto"] == null ? null : Objecto.fromJson(json["objecto"]),
    );

    Map<String, dynamic> toJson() => {
        "telemovel": telemovel == null ? null : telemovel,
        "senha": senha == null ? null : senha,
    };
}

class Objecto {
    Objecto({
        this.nome,
        this.id,
    });

    String nome;
    String id;

    factory Objecto.fromJson(Map<String, dynamic> json) => Objecto(
        nome: json["nome"] == null ? null : json["nome"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome == null ? null : nome,
        "id": id == null ? null : id,
    };
}
