class Equipes {
  final String idEquipe;
  final String nomeEquipe;
  final String nacionalidade;
  final String urlEquipe;

  Equipes(
      {required this.idEquipe,
      required this.nomeEquipe,
      required this.nacionalidade,
      required this.urlEquipe});

  factory Equipes.fromJson(Map<String, dynamic> json) {
    return Equipes(
        idEquipe: json["constructorId"] ?? "",
        nomeEquipe: json["name"] ?? "",
        nacionalidade: json["nationality"] ?? "",
        urlEquipe: json["url"] ?? "");
  }
}
