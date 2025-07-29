import 'package:Formulapp/pilotos/detalhes_pilotos.dart';
import 'package:Formulapp/pilotos/imagem_pilotos.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'api_requisi.dart';
import 'pilotos.dart';

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
      List<Pilotos> pilotos = await apiService.getPilotos();
      pilotos = removerDuplicados(pilotos);
      setState(() {
        _pilotos = pilotos;
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
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
                heightFactor: 0.8,
                child: DetalhesPilotos(
                  givenName: piloto.first_name,
                  familyName: piloto.full_name,
                  nationality: piloto.country_code,
                  //url: piloto.url,
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
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      leading: CircleAvatar(
                        radius: 30,
                        child: Image.network(
                          iconePiloto,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Text("${piloto.full_name}"),
                      subtitle: Text("Nacionalidade: ${piloto.country_code}"),
                      onTap: () {
                        mostrarDetalhes(context, piloto);
                      },
                    );
                  },
                ),
              ));
  }
}
