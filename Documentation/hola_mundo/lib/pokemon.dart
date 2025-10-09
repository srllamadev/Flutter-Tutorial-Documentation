class Pokemon {
  final int id;
  final String name;
  final String url;
  final String? imageUrl;
  final List<String> types;
  final int height;
  final int weight;
  final List<Stat> stats;
  final List<String> abilities;

  Pokemon({
    required this.id,
    required this.name,
    required this.url,
    this.imageUrl,
    required this.types,
    required this.height,
    required this.weight,
    required this.stats,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['sprites']?['front_default'],
      types: (json['types'] as List<dynamic>?)
          ?.map((type) => type['type']['name'] as String)
          .toList() ?? [],
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      stats: (json['stats'] as List<dynamic>?)
          ?.map((stat) => Stat.fromJson(stat))
          .toList() ?? [],
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((ability) => ability['ability']['name'] as String)
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'sprites': {'front_default': imageUrl},
      'types': types.map((type) => {'type': {'name': type}}).toList(),
      'height': height,
      'weight': weight,
      'stats': stats.map((stat) => stat.toJson()).toList(),
      'abilities': abilities.map((ability) => {'ability': {'name': ability}}).toList(),
    };
  }

  // Calcular puntos totales basados en estadísticas
  int get totalPoints {
    return stats.fold(0, (sum, stat) => sum + stat.baseStat);
  }

  // Obtener el tipo principal
  String get primaryType => types.isNotEmpty ? types[0] : 'unknown';
}

class Stat {
  final String name;
  final int baseStat;

  Stat({
    required this.name,
    required this.baseStat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      name: json['stat']['name'] ?? '',
      baseStat: json['base_stat'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stat': {'name': name},
      'base_stat': baseStat,
    };
  }
}