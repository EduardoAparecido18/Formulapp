import 'package:f1app/colors/equipesCores.dart';
import 'package:f1app/construtores/dadosExtrasEquipes.dart';
import 'package:f1app/construtores/detalhes_equipes.dart';
import 'package:flutter/material.dart';
import 'apiEquipes.dart';
import 'construtores.dart';

// ignore: camel_case_types
class equipesTela extends StatefulWidget {
  const equipesTela({super.key});

  @override
  State<equipesTela> createState() => _equipesTelaState();
}

// ignore: camel_case_types
class _equipesTelaState extends State<equipesTela> {
  List<Equipes> _equipes = [];

  // ignore: unused_field
  bool _loading = true;
  // ignore: unused_field
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
    // ignore: unused_element
    void mostrarDetalhesEquipes(BuildContext context, Equipes equipes) {
      final dadosExtrasEquipes = extrasEquipes[equipes.idEquipe];
      final backgroundEquipes = coresEquipes[equipes.idEquipe] ?? Colors.pink;
      showModalBottomSheet(
          backgroundColor: backgroundEquipes,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
                //tamanho do bottomsheet
                heightFactor: 0.8,
                child: detalhesEquipes(
                  nomeEquipe: equipes.nomeEquipe,
                  nacionalidade: equipes.nacionalidade,
                  logo: dadosExtrasEquipes?['logoEquipe'] ?? "",
                  carroPng: dadosExtrasEquipes?['imagemCarro'] ?? "",
                  descricaoEquipes: dadosExtrasEquipes?['textoSobre'] ??
                      "Não tem nada sobre essa equipe!",
                ));
          });
    }

    return Scaffold(
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : _equipes.isEmpty
                ? Center(
                    child: Text(_mensagemErro ?? "nenhuma equipe encontrada"),
                  )
                : Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFfcdc8c),
                    ),
                    child: ListView.builder(
                      itemCount: _equipes.length,
                      itemBuilder: (context, index) {
                        final equipes = _equipes[index];
                        final dadosExtrasEquipes =
                            extrasEquipes[equipes.idEquipe];
                        final logoEquipe =
                            dadosExtrasEquipes?['logoEquipe'] ?? "";
                        final equipesBackground =
                            coresEquipes[equipes.idEquipe] ?? Colors.amber;

                        return ListTile(
                          // ignore: prefer_const_constructors
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 14,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: equipesBackground,
                            radius: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                logoEquipe,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          title: Text(equipes.nomeEquipe),
                          onTap: () {
                            mostrarDetalhesEquipes(context, equipes);
                          },
                        );
                      },
                    ),
                  ));
  }
}
