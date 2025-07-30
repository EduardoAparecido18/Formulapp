import 'package:flutter/material.dart';

class DetalhesPilotos extends StatelessWidget {
  const DetalhesPilotos(
      {super.key,
      //required this.driverId,
      //required this.code,
      required this.first_name,
      required this.full_name,
      required this.team_name,
      required this.country_code,
      //required this.url,
      required this.imagemPiloto,
      required this.descricaoPiloto});

  // final String driverId;
  //final String code;
  final String first_name;
  final String full_name;
  final String team_name;
  final String country_code;
  final String imagemPiloto;
  final String descricaoPiloto;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imagemPiloto,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$full_name",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Nacionalida: $country_code",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              descricaoPiloto,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )
          ],
        ));
  }
}
