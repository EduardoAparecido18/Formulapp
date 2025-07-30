import 'package:Formulapp/pilotos/pilotos.dart';
import 'package:flutter/material.dart';
import 'tela_pilotos.dart';

class EstatisPilotos extends StatelessWidget {
  const EstatisPilotos({
    super.key,
    required this.country_code,
    required this.descricaoPiloto,
    required this.first_name,
    required this.full_name,
    required this.imagemPiloto,
    required this.team_name,
  });

  final String first_name;
  final String full_name;
  final String team_name;
  final String country_code;
  final String imagemPiloto;
  final String descricaoPiloto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(full_name)],
      ),
    );
  }
}
