import 'package:Formulapp/circuitos/estatisc_circuitos.dart';
import 'package:flutter/material.dart';
import 'circuitos.dart';

class TelaCircuitos extends StatelessWidget {
  const TelaCircuitos({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = AppBar(backgroundColor: Colors.black);
    final heightScreen = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: circuitos.length,
            itemBuilder: (context, index) {
              final pista = circuitos[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EstatisCircuitos(
                                estreia: pista["estreia"] ?? "",
                                evento: pista["evento"] ?? "",
                                imagem: pista["imagem"] ?? "",
                                localizacao: pista["localizacao"] ?? "",
                                maisPoles: pista["maisPoles"] ?? "",
                                maisVitorias: pista["maisVitorias"] ?? "",
                                name: pista["name"] ?? "",
                                sobre: pista["Sobre"] ?? "",
                                imagemCircuito: pista["imagemCircuito"] ?? "",
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.grey.shade800,
                              Colors.grey.shade900
                            ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(pista["imagem"]!),
                        Text(
                          pista["localizacao"]!,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
