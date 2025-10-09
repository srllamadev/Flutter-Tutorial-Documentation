import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'pokemon_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const PokemonListPage(),
    );
  }
}

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late Future<List<Pokemon>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = PokemonService().fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List'),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: '));
          } else if (snapshot.hasData) {
            final pokemonList = snapshot.data!;
            return ListView.builder(
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return ListTile(
                  leading: pokemon.imageUrl != null
                      ? Image.network(pokemon.imageUrl!, width: 50, height: 50)
                      : const Icon(Icons.catching_pokemon),
                  title: Text(pokemon.name.toUpperCase()),
                  subtitle: Text(pokemon.url),
                );
              },
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
