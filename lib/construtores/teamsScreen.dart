import 'package:Formulapp/colors/equipesCores.dart';
import 'package:Formulapp/construtores/dadosExtrasEquipes.dart';
import 'package:flutter/material.dart';

class Teamsscreen extends StatelessWidget {
  const Teamsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBar = AppBar();
    final heightScreen = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      body: ListView.builder(
        itemCount: extrasEquipes.length,
        itemBuilder: (context, index) {
          final equipes = extrasEquipes[index];
          final backgroundEquipes = extrasEquipes[coresEquipes];
          return Container(
            height: 250,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blueAccent, Colors.amber])),
          );
        },
      ),
    );
  }
}
