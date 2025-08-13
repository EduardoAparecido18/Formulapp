import 'package:Formulapp/colors/equipesCores.dart';
import 'package:Formulapp/pilotos/pilotos.dart';
import 'package:flutter/material.dart';
import 'tela_pilotos.dart';

class EstatisPilotos extends StatelessWidget {
  const EstatisPilotos(
      {super.key,
      required this.country_code,
      required this.descricaoPiloto,
      required this.first_name,
      required this.full_name,
      required this.imagemPiloto,
      required this.team_name,
      required this.corFundoPiloto,
      required this.last_name,
      required this.titulos,
      required this.vitorias,
      required this.poles});

  final String first_name;
  final String full_name;
  final String last_name;
  final String team_name;
  final String country_code;
  final String imagemPiloto;
  final String descricaoPiloto;
  final Color corFundoPiloto;
  final String titulos;
  final String vitorias;
  final String poles;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appBar = AppBar(backgroundColor: Colors.black);
    var tamanhoTela = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: tamanhoTela / 3,
                  width: size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [corFundoPiloto, Colors.black]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagemPiloto,
                        fit: BoxFit.contain,
                        height: tamanhoTela / 3.5,
                      ),
                      Text(
                        full_name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //segundo container
            Container(
                height: tamanhoTela / 1,
                width: size.width,
                decoration: BoxDecoration(color: corFundoPiloto),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      height: tamanhoTela / 2,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SOBRE O PILOTO:',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amberAccent),
                            ),
                            Text(
                              descricaoPiloto,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Divider(color: Colors.black),
                            Text(
                              'ESTATISTICAS:',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amberAccent),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.emoji_events,
                                    color: Colors.amberAccent),
                                Text('TITULOS MUNDIAIS: ${titulos}',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.flag, color: Colors.amberAccent),
                                Text('VITÓRIAS: ${vitorias}',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.speed, color: Colors.amberAccent),
                                Text('POLE POSITIONS: ${poles}',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.directions_car,
                                    color: Colors.amberAccent),
                                Text('EQUIPE: ${team_name}',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Divider(color: Colors.black),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
