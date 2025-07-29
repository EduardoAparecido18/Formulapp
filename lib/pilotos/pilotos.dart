class Pilotos {
  final String first_name;
  final String full_name;
  final String team_name;
  final String country_code;

  Pilotos({
    required this.first_name,
    required this.full_name,
    required this.team_name,
    required this.country_code,
  });

  // Método para converter JSON em um objeto Piloto
  factory Pilotos.fromJson(Map<String, dynamic> json) {
    return Pilotos(
      first_name: json["first_name"] ?? "",
      full_name: json["full_name"] ?? "N/A", // Pode ser nulo, então tratamos
      team_name: json["team_name"] ?? "",
      country_code: json["country_code"] ?? "",
    );
  }
}
