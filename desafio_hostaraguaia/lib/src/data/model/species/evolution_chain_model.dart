class EvolutionChainModel {
  final String? url;

  EvolutionChainModel({required this.url});

  static EvolutionChainModel fromJson(Map<String, dynamic> json) {
    return EvolutionChainModel(url: json['url'] as String);
  }
}
