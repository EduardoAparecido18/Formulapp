import 'package:Formulapp/colors/equipesCores.dart';
import 'package:Formulapp/construtores/dadosExtrasEquipes.dart';
import 'package:Formulapp/construtores/estatis_constru.dart';
import 'package:flutter/material.dart';

class Teamsscreen extends StatelessWidget {
  const Teamsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = AppBar(backgroundColor: Colors.black);
    final heightScreen = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: ListView.builder(
        itemCount: extrasEquipes.length,
        itemBuilder: (context, index) {
          final equipes = extrasEquipes[index];
          final backgroundEquipes = coresEquipes[equipes["id"]] ?? Colors.pink;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EstatisConstru(
                            nome: equipes["nome"]!,
                            base: equipes["base"]!,
                            chefe: equipes["chefe"]!,
                            corEquipe:
                                coresEquipes[equipes["id"]] ?? Colors.pink,
                            dataIniciou: equipes["dataIniciou"]!,
                            imagemCarro: equipes["imagemCarro"]!,
                            logo: equipes["logoEquipe"]!,
                            mundiaisConstr: equipes["mudiaisConstr"]!,
                            pilotos: equipes["pilotos"]!,
                            textoSobre: equipes["textoSobre"]!,
                            unidadePotencia: equipes["unidadePotencia"]!,
                            reservas: equipes["reservas"]!,
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [backgroundEquipes, Colors.grey])),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        equipes["nome"]!,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Image.asset(equipes["imagemCarro"]!)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
