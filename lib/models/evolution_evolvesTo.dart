import 'package:pokeapi/models/evolution_evolutionDetails.dart';
import 'package:pokeapi/models/evolution_trigger.dart';

class EvolvesTo {
  List<EvolutionDetails> evolutionDetails;
  List<EvolvesTo> evolvesTo;
  bool isBaby;
  Trigger species;

  EvolvesTo({this.evolutionDetails, this.evolvesTo, this.isBaby, this.species});

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails = new List<EvolutionDetails>();
      json['evolution_details'].forEach((v) {
        evolutionDetails.add(new EvolutionDetails.fromJson(v));
      });
    }
    if (json['evolves_to'] != null) {
      evolvesTo = new List<EvolvesTo>();
      json['evolves_to'].forEach((v) {
        evolvesTo.add(new EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species =
    json['species'] != null ? new Trigger.fromJson(json['species']) : null;
  }

}