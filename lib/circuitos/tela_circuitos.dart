import 'package:flutter/material.dart';
import 'circuitos.dart';
import 'detalhes_circuito.dart';

class TelaCircuitos extends StatelessWidget {
  const TelaCircuitos({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
          ),
          itemCount: circuitos.length,
          itemBuilder: (context, index) {
            final pista = circuitos[index];
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // backgroundColor: Theme.of(context).colorScheme.onSurface,
                    textStyle: const TextStyle(fontSize: 15),
                    elevation: 9,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(50, 50)))),
                onPressed: () {
                  showModalBottomSheet(
                      // backgroundColor: Theme.of(context).colorScheme.primary,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor: 0.8,
                          child: detalhesDaPista(
                            name: pista['name']!,
                            localizacao: pista['localizacao']!,
                            Sobre: pista['Sobre'],
                            imagem: pista['imagem'],
                          ),
                        );
                      });
                },
                child: Text(
                  pista['localizacao']!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ));
          }),
    );
  }
}
