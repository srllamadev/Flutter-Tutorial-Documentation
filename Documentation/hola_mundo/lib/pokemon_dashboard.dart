import 'package:flutter/material.dart';
import 'pokemon.dart';

class PokemonDashboard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDashboard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
        backgroundColor: _getTypeColor(pokemon.primaryType),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header con imagen y info básica
            _buildHeaderCard(),

            const SizedBox(height: 20),

            // Estadísticas principales
            _buildStatsCard(),

            const SizedBox(height: 20),

            // Tipos
            _buildTypesCard(),

            const SizedBox(height: 20),

            // Habilidades
            _buildAbilitiesCard(),

            const SizedBox(height: 20),

            // Información física
            _buildPhysicalInfoCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Imagen del Pokémon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: _getTypeColor(pokemon.primaryType).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: pokemon.imageUrl != null
                  ? Image.network(
                      pokemon.imageUrl!,
                      fit: BoxFit.contain,
                    )
                  : const Icon(
                      Icons.catching_pokemon,
                      size: 60,
                      color: Colors.grey,
                    ),
            ),

            const SizedBox(width: 20),

            // Información básica
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    pokemon.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getTypeColor(pokemon.primaryType),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      pokemon.primaryType.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ESTADÍSTICAS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            ...pokemon.stats.map((stat) => _buildStatBar(stat)),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'PUNTOS TOTALES',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${pokemon.totalPoints}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBar(Stat stat) {
    double percentage = stat.baseStat / 255.0; // Max stat is typically 255
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stat.name.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                '${stat.baseStat}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(_getStatColor(stat.baseStat)),
          ),
        ],
      ),
    );
  }

  Widget _buildTypesCard() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TIPOS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: pokemon.types.map((type) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: _getTypeColor(type),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  type.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbilitiesCard() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HABILIDADES',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 12),
            ...pokemon.abilities.map((ability) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    ability.replaceAll('-', ' ').toUpperCase(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildPhysicalInfoCard() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'INFORMACIÓN FÍSICA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPhysicalStat('ALTURA', '${pokemon.height / 10} m'),
                _buildPhysicalStat('PESO', '${pokemon.weight / 10} kg'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhysicalStat(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire': return Colors.red;
      case 'water': return Colors.blue;
      case 'grass': return Colors.green;
      case 'electric': return Colors.yellow;
      case 'psychic': return Colors.purple;
      case 'ice': return Colors.cyan;
      case 'dragon': return Colors.indigo;
      case 'dark': return Colors.grey;
      case 'fairy': return Colors.pink;
      case 'fighting': return Colors.orange;
      case 'poison': return Colors.deepPurple;
      case 'ground': return Colors.brown;
      case 'flying': return Colors.lightBlue;
      case 'bug': return Colors.lightGreen;
      case 'rock': return Colors.grey;
      case 'ghost': return Colors.deepPurple;
      case 'steel': return Colors.blueGrey;
      default: return Colors.grey;
    }
  }

  Color _getStatColor(int value) {
    if (value >= 150) return Colors.green;
    if (value >= 100) return Colors.yellow;
    if (value >= 50) return Colors.orange;
    return Colors.red;
  }
}