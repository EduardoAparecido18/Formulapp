import 'package:flutter/material.dart';
import 'package:Formulapp/construtores/teamsScreen.dart';

class EstatisConstru extends StatelessWidget {
  const EstatisConstru({
    super.key,
    required this.nome,
    required this.base,
    required this.chefe,
    required this.corEquipe,
    required this.dataIniciou,
    required this.imagemCarro,
    required this.logo,
    required this.mundiaisConstr,
    required this.pilotos,
    required this.textoSobre,
    required this.unidadePotencia,
    required this.reservas,
  });

  final String nome;
  final String base;
  final String chefe;
  final String unidadePotencia;
  final String dataIniciou;
  final String pilotos;
  final String mundiaisConstr;
  final Color corEquipe;
  final String logo;
  final String imagemCarro;
  final String textoSobre;
  final String reservas;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = AppBar(backgroundColor: corEquipe);
    final heightScreen = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: heightScreen / 2,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [corEquipe, Colors.black])),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          logo,
                          height: 100,
                        ),
                        Image.asset(imagemCarro),
                        Text(
                          nome,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(pilotos,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
              Container(
                height: heightScreen / 2,
                width: size.width,
                decoration: BoxDecoration(color: Colors.black),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SOBRE A EQUIPE: ',
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      textoSobre,
                      style: TextStyle(color: Colors.white),
                    ),
                    Divider(color: Colors.white),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.amber,
                        ),
                        Text(
                          "CHEFE DE EQUIPE: ${chefe}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.emoji_events,
                          color: Colors.amber,
                        ),
                        Text(
                          "MUNDIAIS: ${mundiaisConstr}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.amber,
                        ),
                        Text(
                          "BASE: ${base}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_2,
                          color: Colors.amber,
                        ),
                        Text(
                          "RESERVAS: ${reservas}",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.amber,
                        ),
                        Text(
                          "ANO QUE ENTROU: ${dataIniciou}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.amber,
                        ),
                        Text(
                          "FABRICANTE DO MOTOR: ${unidadePotencia}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
