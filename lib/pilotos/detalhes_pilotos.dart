import 'package:flutter/material.dart';

class DetalhesPilotos extends StatelessWidget {
  const DetalhesPilotos(
      {super.key,
      //required this.driverId,
      //required this.code,
      required this.givenName,
      required this.familyName,
      required this.nationality,
      //required this.dateOfBirth,
      //required this.url,
      required this.imagemPiloto,
      required this.descricaoPiloto});

  // final String driverId;
  //final String code;
  final String givenName;
  final String familyName;
  final String nationality;
  // final String dateOfBirth;
  //final String url;
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
              "$givenName " "$familyName",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Nacionalida: $nationality",
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
