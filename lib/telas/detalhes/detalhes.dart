import 'package:flutter/material.dart';
import '../../modelos/receita.dart';

class Detalhes extends StatelessWidget {
  final Receita receita;

  Detalhes({Key key, @required this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirImageDetalhes(receita.foto),
          _construirTituloDetalhes(receita.titulo),
          _construirLinhaIconesDetalhes(
              '${receita.porcoes} porcoes', receita.tempoPreparo),
          _construirSubtituloDetalhes('Ingredientes'),
          _construirTextoDetalhes(receita.ingredientes.replaceAll('; ', '\n')),
          _construirSubtituloDetalhes('Modo de preparo'),
          _construirTextoDetalhes(receita.modoPreparo),
        ],
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirImageDetalhes(String image) {
    return Image.asset(image);
  }

  Widget _construirTituloDetalhes(String titulo) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(
          titulo,
          style: TextStyle(color: Colors.deepOrange, fontSize: 30),
        ),
      ),
    );
  }

  Widget _construirLinhaIconesDetalhes(String rendimento, String tempoPreparo) {
    return Row(
      children: <Widget>[
        _construirColunaIconeDetalhes(Icons.restaurant, rendimento),
        _construirColunaIconeDetalhes(Icons.timer, tempoPreparo),
      ],
    );
  }

  Widget _construirColunaIconeDetalhes(IconData icone, String texto) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Icon(
              icone,
              color: Colors.deepOrange,
            ),
            Text(
              texto,
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirSubtituloDetalhes(String subtitulo) {
    return Center(
      child: Text(
        subtitulo,
        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
      ),
    );
  }

  Widget _construirTextoDetalhes(String texto) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        texto,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
    );
  }

  Widget _construirAppBar() {
    return AppBar(
      title: Text('Cozinhado em casa'),
    );
  }
}
