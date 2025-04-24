class Pilotos {
  final String driverId;
  final String code;
  final String givenName;
  final String familyName;
  final String nationality;
  final String dateOfBirth;
  final String url;

  Pilotos({
    required this.driverId,
    required this.code,
    required this.givenName,
    required this.familyName,
    required this.nationality,
    required this.dateOfBirth,
    required this.url,
  });

  // Método para converter JSON em um objeto Piloto
  factory Pilotos.fromJson(Map<String, dynamic> json) {
    return Pilotos(
      driverId: json["driverId"] ?? "",
      code: json["code"] ?? "N/A", // Pode ser nulo, então tratamos
      givenName: json["givenName"] ?? "",
      familyName: json["familyName"] ?? "",
      nationality: json["nationality"] ?? "",
      dateOfBirth: json["dateOfBirth"] ?? "",
      url: json["url"] ?? "",
    );
  }
}
