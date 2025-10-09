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
        // Fetch detailed data for each Pokemon
        final detailResponse = await http.get(Uri.parse(pokemon.url));
        if (detailResponse.statusCode == 200) {
          final detailData = json.decode(detailResponse.body);
          pokemonList.add(Pokemon.fromJson(detailData));
        } else {
          pokemonList.add(pokemon);
        }
      }
      return pokemonList;
    } else {
      throw Exception('Failed to load Pokemon list');
    }
  }

  Future<Pokemon> fetchPokemonDetails(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Pokemon.fromJson(data);
    } else {
      throw Exception('Failed to load Pokemon details');
    }
  }

  Future<Pokemon> fetchPokemonDetailsByUrl(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Pokemon.fromJson(data);
    } else {
      throw Exception('Failed to load Pokemon details');
    }
  }
}