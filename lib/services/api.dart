import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokeapi/models/evolution.dart';
import 'package:pokeapi/models/pokemon.dart';


class Api {
  Future<Pokemon> pokemon (String search) async {
    var response = await http.get("https://pokeapi.co/api/v2/pokemon/$search");
    if (response.statusCode == 200) {

      Pokemon pokemon = Pokemon.fromJson(json.decode(response.body));

      return pokemon;
    }
    else{
      throw Exception("Erro ao carregar pokémons");
    }
  }

  Future<Evolution> evolution (String search) async {
    var response = await http.get("$search");

    String urlEvolutionChain = json.decode(response.body)["evolution_chain"]["url"];

    print(search);
    print(urlEvolutionChain);

    if (response.statusCode == 200) {
      response = await http.get(urlEvolutionChain);

      Evolution evolution = Evolution.fromJson(json.decode(response.body));

      for(var item1 in evolution.chain.evolvesTo){
        if(item1 != null){
          for(var item2 in item1.evolvesTo){
            print(item2.species.name);
          }
        }
        print(item1.species.name);
      }

      return evolution;
    }
    else{
      throw Exception("Erro ao carregar evolução");
    }
  }
}