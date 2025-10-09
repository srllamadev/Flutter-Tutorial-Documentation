import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

class PokemonService {
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  Future<List<Pokemon>> fetchPokemonList({int limit = 20, int offset = 0}) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      List<Pokemon> pokemonList = [];
      for (var item in results) {
        final pokemon = Pokemon.fromJson(item);
        // Fetch details to get image
        final detailResponse = await http.get(Uri.parse(pokemon.url));
        if (detailResponse.statusCode == 200) {
          final detailData = json.decode(detailResponse.body);
          pokemonList.add(Pokemon(
            name: pokemon.name,
            url: pokemon.url,
            imageUrl: detailData['sprites']['front_default'],
          ));
        } else {
          pokemonList.add(pokemon);
        }
      }
      return pokemonList;
    } else {
      throw Exception('Failed to load Pokemon list');
    }
  }
}