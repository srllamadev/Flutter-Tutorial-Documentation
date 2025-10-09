class Pokemon {
  final String name;
  final String url;
  final String? imageUrl;

  Pokemon({
    required this.name,
    required this.url,
    this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
      imageUrl: json['sprites']?['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'sprites': {'front_default': imageUrl},
    };
  }
}