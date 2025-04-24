import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'pilotos.dart';

// ignore: camel_case_types
//classe usada para fazer a requisicão da api, passando a url da api
class apiService {
  static Future<List<Pilotos>> getPilotos() async {
    //a requisição da api pode trazer um valor de 200 ou 404, se trazer 200 está tudo ok
    //essa variavel (response) ira verificar qual foi o valor
    final response = await http
        .get(Uri.parse("http://ergast.com/api/f1/current/drivers.json"));

    //condição usada para ver o que retornado
    //se o status do response for 200 irá exuctar isso
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List pilotosJson = data["MRData"]["DriverTable"]["Drivers"];

      if (data["MRData"] == null ||
          data["MRData"]["DriverTable"] == null ||
          data["MRData"]["DriverTable"]["Drivers"] == null) {}
      return pilotosJson.map((json) => Pilotos.fromJson((json))).toList();
    } else {
      //se não retornar o valor desejado que é 200, ira executar o throw exeption,
      //que é para o aplicativo não crachár e conseguir dar uma resposta ao usuario
      throw Exception(
          "Erro ao buscar os pilotos - Status Code: ${response.statusCode}");
    }
  }
}
