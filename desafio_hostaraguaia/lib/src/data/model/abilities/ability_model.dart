class AbilityModel {
  final String? name;
  final String? url;

  AbilityModel({required this.name, required this.url});

  static AbilityModel fromJson(Map<String, dynamic> json) {
    return AbilityModel(name: json['name'], url: json['url']);
  }
}
