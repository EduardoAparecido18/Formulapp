import 'package:flutter/material.dart';

class EstatisCircuitos extends StatelessWidget {
  const EstatisCircuitos({
    super.key,
    required this.maisVitorias,
    required this.estreia,
    required this.evento,
    required this.imagem,
    required this.localizacao,
    required this.maisPoles,
    required this.name,
    required this.sobre,
    required this.imagemCircuito,
  });

  final String maisVitorias;
  final String maisPoles;
  final String estreia;
  final String evento;
  final String imagem;
  final String name;
  final String localizacao;
  final String sobre;
  final String imagemCircuito;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = AppBar(backgroundColor: Colors.black);
    final tamanhoScreen = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: tamanhoScreen,
                width: size.width,
                decoration: BoxDecoration(color: Colors.black),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      localizacao,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Image.network(
                      imagem,
                      height: 200,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "SOBRE O CIRCUITO:",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(sobre,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Divider(color: Colors.white),
                    SizedBox(height: 13),
                    Row(
                      children: [
                        Icon(Icons.emoji_events, color: Colors.amber),
                        Text(
                          "MAIS VITÓRIAS: ${maisVitorias}",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.leaderboard, color: Colors.amber),
                        Text(
                          "MAIS POLES: ${maisPoles}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.sports_score, color: Colors.amber),
                        Text(
                          "ESTREIA NA F1: ${estreia}",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text(
                          "EVENTOS HISTÓRICOS:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Text(
                      evento,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
