import 'package:flutter/material.dart';

class detalhesEquipes extends StatelessWidget {
  const detalhesEquipes({
    super.key,
    required this.nomeEquipe,
    required this.nacionalidade,
    required this.logo,
    required this.carroPng,
    required this.descricaoEquipes,
  });

  final String nomeEquipe;
  final String nacionalidade;
  final String logo;
  final String carroPng;
  final String descricaoEquipes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "",
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(nomeEquipe,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
