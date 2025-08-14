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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: circuitos.length,
            itemBuilder: (context, index) {
              final pista = circuitos[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.grey.shade700, Colors.white])),
                  child: Column(
                    children: [
                      Image.network(pista["imagem"]!),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
