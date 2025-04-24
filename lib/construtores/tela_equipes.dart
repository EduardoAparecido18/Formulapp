import 'package:f1app/construtores/detalhes_equipes.dart';
import 'package:flutter/material.dart';
import 'apiEquipes.dart';
import 'construtores.dart';

class equipesTela extends StatefulWidget {
  const equipesTela({super.key});

  @override
  State<equipesTela> createState() => _equipesTelaState();
}

class _equipesTelaState extends State<equipesTela> {
  List<Equipes> _equipes = [];
  bool _loading = true;
  String? _mensagemErro;
  @override
  void initState() {
    super.initState();
    fetchEquipes();
  }

  Future<void> fetchEquipes() async {
    try {
      List<Equipes> equipes = await Apiequipes.getEquipes();
      setState(() {
        _equipes = equipes;
        _loading = false;
      });
    } catch (e) {
      _mensagemErro = "ERRO AO CARREGAR OS CONSTRUTORES";
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    void mostrarDetalhesEquipes(BuildContext context, Equipes equipes) {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              //tamanho do bottomsheet
              heightFactor: 0.8,
              child: detalhesEquipes(
                  nomeEquipe: equipes.nomeEquipe,
                  nacionalidade: equipes.nacionalidade),
            );
          });
    }

    return Scaffold(
        body: _equipes.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Container(
                decoration: const BoxDecoration(
                  color: Color(0xfffcdc8cd),
                ),
              ));
  }
}
