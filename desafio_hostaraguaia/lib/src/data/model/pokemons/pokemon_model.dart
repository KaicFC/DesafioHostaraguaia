class PokemonModel{
  final String? name;
  final String? url;

  PokemonModel({required this.name, required this.url});

  static PokemonModel fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: json['name'], url: json['url']);
  }
}
