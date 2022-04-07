class SpritesHomeModel {
  final String? image;

  SpritesHomeModel({required this.image});

  static SpritesHomeModel fromJson(Map<String, dynamic> json) {
    return SpritesHomeModel(image: json['front_default']);
  }
}
