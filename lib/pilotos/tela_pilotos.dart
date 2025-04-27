import 'package:f1app/pilotos/detalhes_pilotos.dart';
import 'package:f1app/pilotos/imagem_pilotos.dart';
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

  @override
  void initState() {
    super.initState();
    fetchPilotos();
  }

  Future<void> fetchPilotos() async {
    try {
      List<Pilotos> pilotos = await apiService.getPilotos();
      setState(() {
        _pilotos = pilotos;
        _loading = false;
      });
    } catch (e) {
      _mensagemErro = "Erro ao carregar os pilotos";
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    void mostrarDetalhes(BuildContext context, Pilotos piloto) {
      final dadosExtras = driverImage[piloto.driverId];
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
                heightFactor: 0.8,
                child: DetalhesPilotos(
                  givenName: piloto.givenName,
                  familyName: piloto.familyName,
                  nationality: piloto.nationality,
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
                    final dadosExtras = driverImage[piloto.driverId];
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
                      title: Text("${piloto.givenName} ${piloto.familyName}"),
                      subtitle: Text("Nacionalidade: ${piloto.nationality}"),
                      onTap: () {
                        mostrarDetalhes(context, piloto);
                      },
                    );
                  },
                ),
              ));
  }
}
