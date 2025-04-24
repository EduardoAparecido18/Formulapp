import 'package:flutter/material.dart';

// ignore: camel_case_types
class detalhesDaPista extends StatelessWidget {
  const detalhesDaPista({
    super.key,
    required this.name,
    required this.localizacao,
    // ignore: non_constant_identifier_names
    required this.Sobre,
    required this.imagem,
  });

  final String name;
  final String localizacao;
  // ignore: non_constant_identifier_names
  final String Sobre;
  final String imagem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Localização: $localizacao',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 15,
          ),
          Image.network(
            imagem,
            height: 200,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Sobre o Circuito: $Sobre',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
