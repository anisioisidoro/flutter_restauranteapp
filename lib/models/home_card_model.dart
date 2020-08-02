class HomeCardModel {
  
  final String imagem;
  final String titulo;
  final String hora;
  final String mesa;
  final bool mesaDispo;
  final String imageHora;
  final int estrela;

  HomeCardModel({this.imagem, this.titulo, this.hora, this.mesa, this.imageHora, this.mesaDispo, this.estrela});
}

class MenuCardModel {
  
  final String imagem;
  final String titulo;
  final String hora;
  final String mesa;
  final bool mesaDispo;
  final String imageHora;
  final String preco;

  MenuCardModel({this.imagem, this.titulo, this.hora, this.mesa, this.imageHora, this.mesaDispo, this.preco});
}