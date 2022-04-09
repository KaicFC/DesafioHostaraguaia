class StatModel {
  final String? name;
  final String? url;

  StatModel({required this.name, required this.url});

  static StatModel fromJson(Map<String, dynamic> json) {
    return StatModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
