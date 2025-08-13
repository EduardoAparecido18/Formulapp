import 'package:Formulapp/colors/equipesCores.dart';
import 'package:Formulapp/pilotos/estatis_pilotos.dart';
import 'package:Formulapp/pilotos/sobre/DriversData.dart';
import 'package:Formulapp/pilotos/sobre/imagem_pilotos.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'api_requisi.dart';
import 'pilotos.dart';
import 'package:Formulapp/pilotos/sobre/filtro_pilotos.dart';

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
    // ignore: unused_local_variable
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

    return Scaffold(
        body: _pilotos.isEmpty
            ? const Center(child: CircularProgressIndicator()) // Carregando
            : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: ListView.builder(
                      itemCount: _pilotos.length,
                      itemBuilder: (context, index) {
                        final piloto = _pilotos[index];
                        final dadosExtras = driverImage[piloto.full_name];
                        final driverStatics = dadosPilotos[piloto.full_name];
                        final iconePiloto = dadosExtras?['imagemDriver'] ?? "";
                        final backgroundPilotos =
                            coresPilotos[piloto.full_name] ?? Colors.grey;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EstatisPilotos(
                                          last_name: piloto.last_name,
                                          corFundoPiloto: backgroundPilotos,
                                          team_name: piloto.team_name,
                                          first_name: piloto.first_name,
                                          full_name: piloto.full_name,
                                          country_code: piloto.country_code,
                                          imagemPiloto:
                                              dadosExtras?['imagemDriver'] ??
                                                  "",
                                          descricaoPiloto:
                                              dadosExtras?['descricao'] ??
                                                  "Sem descrição disponivel",
                                          titulos:
                                              driverStatics?['titulos'] ?? "",
                                          vitorias:
                                              driverStatics?['vitorias'] ?? "",
                                          poles: driverStatics?['pole'] ?? "",
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 250,
                              width: size.width,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                    colors: [backgroundPilotos, Colors.black],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    piloto.full_name,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Image.asset(iconePiloto, fit: BoxFit.contain),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}
