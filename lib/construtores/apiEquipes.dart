import 'dart:convert';
import 'package:http/http.dart' as http;
import 'construtores.dart';

class Apiequipes {
  static Future<List<Equipes>> getEquipes() async {
    final response = await http
        .get(Uri.parse("https://ergast.com/api/f1/current/constructors.json"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List equipesJson =
          data["MRData"]["ConstructorTable"]["Constructors"];

      if (data["MRData"] == null ||
          data["MRData"]["ConstructorTable"] == null ||
          data["MRData"]["ConstructorTable"]["Constructors"] == null) {
        throw Exception("dados invalidos retornados pela api");
      }
      return equipesJson.map((json) => Equipes.fromJson(json)).toList();
    } else {
      throw Exception("OCORREU UM ERRO AO BUSCAR DADOS DOS CONSTRUTORES");
    }
  }
}
