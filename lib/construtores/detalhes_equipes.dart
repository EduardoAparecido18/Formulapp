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
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                logo,
                height: 130,
                width: 130,
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
          Text(
            nacionalidade,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
          ClipRRect(
            child: Image.network(carroPng),
          ),
          const SizedBox(height: 50),
          Text(
            descricaoEquipes,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
