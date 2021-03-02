import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pokeapi/services/api.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:pokeapi/models/evolution.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc extends BlocBase {
  Api api = Api();
  Pokemon pokemon = Pokemon();
  Evolution evolution = Evolution();

  final pokemonStream = BehaviorSubject<Pokemon>();
  final evolutionStream = BehaviorSubject<Evolution>();

  Future<Pokemon> searchPokemon(String text) async {
    pokemon = await api.pokemon(text);
    searchEvolution(pokemon.species.url);
    pokemonStream.sink.add(pokemon);
  }

  Future<Evolution> searchEvolution(String text) async {
    evolution = await api.evolution(pokemon.species.url);
    evolutionStream.sink.add(evolution);
  }

  void dispose() {
    pokemonStream.close();
    evolutionStream.close();
  }
}
