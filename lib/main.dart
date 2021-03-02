import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/controllers/pokemon_bloc.dart';

import 'package:pokeapi/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      home: HomeView(),
      theme: ThemeData(hintColor: Colors.white),
    );

    return BlocProvider(
      child: app,
      blocs: [
        Bloc((i) => PokemonBloc())
      ],
    );
  }
}
