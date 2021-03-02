import 'package:pokeapi/models/pokemon_sprites.dart';
import 'package:pokeapi/models/pokemon_types.dart';
import 'package:pokeapi/models/pokemon_stats.dart';
import 'package:pokeapi/models/pokemon_abilities.dart';
import 'package:pokeapi/models/pokemon_ability.dart';

class Pokemon {
  String name;
  List<Types> types;
  List<Stats> stats;
  List<Abilities> abilities;
  Ability species;
  Sprites sprites;
  int weight;
  int id;

  Pokemon({
    this.name,
    this.types,
    this.stats,
    this.abilities,
    this.species,
    this.sprites,
    this.weight,
    this.id,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {

    name = json['name'];

    weight = json['weight'];

    id = json['id'];

    sprites = json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;

    species = json['species'] != null ? new Ability.fromJson(json['species']) : null;

    if (json['abilities'] != null) {
      abilities = new List<Abilities>();
      json['abilities'].forEach((v) {
        abilities.add(new Abilities.fromJson(v));
      });
    }

    if (json['types'] != null) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }

    if (json['stats'] != null) {
      stats = new List<Stats>();
      json['stats'].forEach((v) {
        stats.add(new Stats.fromJson(v));
      });
    }
  }
}
