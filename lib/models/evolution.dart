import 'package:pokeapi/models/evolution_chain.dart';

class Evolution {
  String babyTriggerItem;
  Chain chain;
  int id;

  Evolution({
    this.babyTriggerItem,
    this.chain,
    this.id
  });

  Evolution.fromJson(Map<String, dynamic> json) {
    babyTriggerItem = json['baby_trigger_item'];
    chain = json['chain'] != null ? new Chain.fromJson(json['chain']) : null;
    id = json['id'];
  }

}