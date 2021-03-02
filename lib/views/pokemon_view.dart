import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/controllers/pokemon_bloc.dart';
import 'package:pokeapi/models/evolution.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:pokeapi/views/home_view.dart';

class PokemonView extends StatefulWidget {
  @override
  _PokemonViewState createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  final pokemonBloc = BlocProvider.getBloc<PokemonBloc>();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: StreamBuilder<Pokemon>(
          stream: pokemonBloc.pokemonStream.stream,
          builder: (context, snapshot) {
            return SingleChildScrollView(
                child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  color: Colors.redAccent[400],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.close, size: 30.0),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: deviceHeight * 0.1,
                              height: deviceHeight * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.redAccent[100],
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${snapshot.data.sprites.frontDefault}'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: deviceWidth * 0.05,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${snapshot.data.name}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26.0,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: deviceHeight * 0.01,
                                ),
                                Text(
                                  'Tipo: ${snapshot.data.types[0].type.name}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16.0,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            'CARACTERÍSTICAS',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.indigo[900]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceHeight * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            'PESO',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.indigo[900]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceHeight * 0.01,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '${snapshot.data.weight / 10} kg',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                    color: Colors.redAccent[400]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceHeight * 0.05,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'EVOLUÇÕES',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.indigo[900]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceHeight * 0.01,
                      ),
                      Row(
                        children: <Widget>[
                          StreamBuilder<Evolution>(
                            stream: pokemonBloc.evolutionStream.stream,
                            builder: (context, snapshot) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${snapshot.data.chain.evolvesTo[0].species.name}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.redAccent[400]),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceHeight * 0.05,
                      ),
                      Row(
                        children: [
                          Text(
                            'STATUS BASE',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.indigo[900]),
                          ),
                          SizedBox(
                            height: deviceHeight * 0.05,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          StreamBuilder<Pokemon>(
                            stream: pokemonBloc.pokemonStream.stream,
                            builder: (context, snapshot) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${snapshot.data.stats[0].baseStat}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26.0,
                                                color: Colors.redAccent[400]),
                                          ),
                                          Text(
                                            '${snapshot.data.stats[0].stat.name}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                                color: Colors.redAccent[400]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: deviceWidth * 0.1,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${snapshot.data.stats[1].baseStat}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26.0,
                                                color: Colors.redAccent[400]),
                                          ),
                                          Text(
                                            '${snapshot.data.stats[1].stat.name}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                                color: Colors.redAccent[400]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: deviceWidth * 0.1,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${snapshot.data.stats[2].baseStat}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26.0,
                                                color: Colors.redAccent[400]),
                                          ),
                                          Text(
                                            '${snapshot.data.stats[2].stat.name}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                                color: Colors.redAccent[400]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: deviceWidth * 0.1,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${snapshot.data.stats[5].baseStat}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26.0,
                                                color: Colors.redAccent[400]),
                                          ),
                                          Text(
                                            '${snapshot.data.stats[5].stat.name}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                                color: Colors.redAccent[400]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceHeight * 0.05,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'HABILIDADES',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.indigo[900]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceHeight * 0.01,
                      ),
                      Row(
                        children: <Widget>[
                          StreamBuilder<Pokemon>(
                            stream: pokemonBloc.pokemonStream.stream,
                            builder: (context, snapshot) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${snapshot.data.abilities[0].ability.name}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.redAccent[400]),
                                  ),
                                  SizedBox(
                                    height: deviceHeight * 0.005,
                                  ),
                                  Text(
                                    '${snapshot.data.abilities[1].ability.name}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.redAccent[400]),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            );
          },
        ),
      ),
    );
  }
}
