import 'package:f1app/construtores/tela_equipes.dart';
import 'package:f1app/pilotos/tela_pilotos.dart';
import 'package:flutter/material.dart';
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
    const TelaCircuitos(),

    const telaPilotos(),

    const equipesTela(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: use_full_hex_values_for_flutter_colors
      backgroundColor: const Color(0xfffcdc8cd),
      appBar: AppBar(
        // ignore: use_full_hex_values_for_flutter_colors
        backgroundColor: const Color(0xfffcdc8cd),
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
            backgroundColor: const Color.fromARGB(255, 59, 58, 59),
            selectedItemColor: const Color.fromARGB(255, 148, 148, 148),
            unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            elevation: 10,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.track_changes), label: 'Circuitos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Pilotos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.flag_circle), label: 'Equipes')
            ]),
      ),
    );
  }
}
