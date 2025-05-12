import 'package:Formulapp/circuitos/tela_circuitos.dart';
import 'package:Formulapp/colors/themeProvider.dart';
import 'package:Formulapp/construtores/tela_equipes.dart';
import 'package:Formulapp/pilotos/tela_pilotos.dart' show telaPilotos;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/logo_app.png'),
          ),
          ListTile(
            leading: const Icon(Icons.warehouse),
            title: Text("Construtores"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => equipesTela()));
            },
          ),
          ListTile(
            leading: Icon(Icons.sports_motorsports),
            title: const Text("Pilotos"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const telaPilotos()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_score),
            title: const Text("Circuitos"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TelaCircuitos()));
            },
          ),
          const SizedBox(height: 200),
          const Text(
            "Selecionar tema",
            style: TextStyle(fontSize: 15),
          ),
          FloatingActionButton(
            onPressed: () {
              themeProvider.trocarTema();
            },
            child: Icon(themeProvider.themeData.brightness == Brightness.dark
                ? Icons.nights_stay
                : Icons.wb_sunny),
          )
        ],
      ),
    );
  }
}
