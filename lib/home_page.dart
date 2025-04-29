import 'package:f1app/colors/temas.dart';
import 'package:f1app/colors/themeProvider.dart';
import 'package:f1app/construtores/tela_equipes.dart';
import 'package:f1app/pilotos/tela_pilotos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'circuitos/tela_circuitos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _paginasNave = [
    //telas do bottomsheet
    const equipesTela(),

    const telaPilotos(),

    const TelaCircuitos(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          FloatingActionButton(
            onPressed: () {
              themeProvider.trocarTema();
            },
            child: Icon(themeProvider.themeData.brightness == Brightness.dark
                ? Icons.nights_stay
                : Icons.wb_sunny),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.network(
            'https://companieslogo.com/img/orig/FWONK-85baed59.png?t=1720244491',
            height: 10.0,
          ),
        ),
      ),
      body: _paginasNave[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30), bottom: Radius.circular(30)),
        child: BottomNavigationBar(
            elevation: 10,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.warehouse), label: 'Construtores'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_motorsports), label: 'Pilotos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_score), label: 'Circuitos')
            ]),
      ),
    );
  }
}
