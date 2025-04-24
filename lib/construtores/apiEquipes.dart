import 'dart:convert';
import 'package:http/http.dart' as http;
import 'construtores.dart';

class Apiequipes {
  static Future<List<Equipes>> getEquipes() async {
    final response = await http
        .get(Uri.parse("https://ergast.com/api/f1/current/constructors.json"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List equipesJson = data["MRData"]["EquipestTable"]["equipes"];

      if (data["MRData"] == null ||
          data["MRData"]["EquipesTable"] == null ||
          data["MRData"]["EquipesTable"]["equipes"]) {}
      return equipesJson.map((json) => Equipes.fromjson((json))).toList();
    } else {
      throw Exception("OCORREU UM ERRO AO BUSCAR DADOS DOS CONSTRUTORES");
    }
  }
}
