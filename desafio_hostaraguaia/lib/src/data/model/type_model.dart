class TypeModel {
  final String? name;
  final String? url;

  TypeModel({required this.name, required this.url});

  static TypeModel fromJson(Map<String, dynamic> json) {
    return TypeModel(name: json['name'], url: json['url']);
  }
}
