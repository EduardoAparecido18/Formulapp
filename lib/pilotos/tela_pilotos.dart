import 'package:Formulapp/colors/equipesCores.dart';
import 'package:Formulapp/pilotos/detalhes_pilotos.dart';
import 'package:Formulapp/pilotos/estatis_pilotos.dart';
import 'package:Formulapp/pilotos/imagem_pilotos.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'api_requisi.dart';
import 'pilotos.dart';
import 'package:Formulapp/pilotos/filtro_pilotos.dart';
import 'package:Formulapp/colors/equipesCores.dart';

// ignore: camel_case_types
class telaPilotos extends StatefulWidget {
  const telaPilotos({super.key});

  @override
  State<telaPilotos> createState() => _telaPilotosState();
}

// ignore: camel_case_types
class _telaPilotosState extends State<telaPilotos> {
  // ignore: prefer_final_fields
  List<Pilotos> _pilotos = [];
  // ignore: unused_field
  bool _loading = true;
  // ignore: unused_field
  String? _mensagemErro;

  //funçao para retirar itens duplicadas da api
  List<Pilotos> removerDuplicados(List<Pilotos> lista) {
    final nomes = <String>{};
    final listaSemDuplicados = <Pilotos>[];
    for (var piloto in lista) {
      if (!nomes.contains(piloto.full_name)) {
        nomes.add(piloto.full_name);
        listaSemDuplicados.add(piloto);
      }
    }
    return listaSemDuplicados;
  }

  @override
  void initState() {
    super.initState();
    fetchPilotos();
  }

  Future<void> fetchPilotos() async {
    try {
      List<Pilotos> todosPilotos = await apiService.getPilotos();
      List<Pilotos> pilotosFiltrados = todosPilotos
          .where((piloto) => nomeSelecionados.contains(piloto.full_name))
          .toList();
      pilotosFiltrados = removerDuplicados(pilotosFiltrados);
      setState(() {
        _pilotos = pilotosFiltrados;
        _loading = false;
        _mensagemErro = null;
      });
    } catch (e) {
      setState(() {
        _mensagemErro = "Erro ao carregar os pilotos: $e";
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appBar = AppBar();
    var tamanhoTela = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;

    if (_loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_mensagemErro != null) {
      return Scaffold(
        body: Center(
          child: Text(_mensagemErro!),
        ),
      );
    }
    void mostrarDetalhes(BuildContext context, Pilotos piloto) {
      final dadosExtras = driverImage[piloto.full_name];
      final backgroundPilotos = coresPilotos[piloto.full_name] ?? Colors.pink;
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
                heightFactor: 0.8,
                child: DetalhesPilotos(
                  team_name: piloto.team_name,
                  first_name: piloto.first_name,
                  full_name: piloto.full_name,
                  country_code: piloto.country_code,
                  imagemPiloto: dadosExtras?['imagemDriver'] ?? "",
                  descricaoPiloto:
                      dadosExtras?['descricao'] ?? "Sem descrição disponivel",
                ));
          });
    }

    return Scaffold(
        body: _pilotos.isEmpty
            ? const Center(child: CircularProgressIndicator()) // Carregando
            : Container(
                decoration: BoxDecoration(
                  // ignore: use_full_hex_values_for_flutter_colors
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: ListView.builder(
                  itemCount: _pilotos.length,
                  itemBuilder: (context, index) {
                    final piloto = _pilotos[index];
                    final dadosExtras = driverImage[piloto.full_name];
                    final iconePiloto = dadosExtras?['imagemDriver'] ?? "";
                    final backgroundPilotos = coresPilotos[piloto.full_name];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EstatisPilotos(
                                    team_name: piloto.team_name,
                                    first_name: piloto.first_name,
                                    full_name: piloto.full_name,
                                    country_code: piloto.country_code,
                                    imagemPiloto:
                                        dadosExtras?['imagemDriver'] ?? "",
                                    descricaoPiloto:
                                        dadosExtras?['descricao'] ??
                                            "Sem descrição disponivel")));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 250,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: backgroundPilotos,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(piloto.full_name),
                              Image.asset(iconePiloto, fit: BoxFit.contain),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
