import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/controllers/pokemon_bloc.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:pokeapi/views/home_view.dart';
import 'package:pokeapi/views/pokemon_view.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final pokemonBloc = BlocProvider.getBloc<PokemonBloc>();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(deviceWidth * 0.05,
                  deviceHeight * 0.025, deviceWidth * 0.05, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        iconSize: 30.0,
                        icon: Icon(Icons.arrow_back, size: 30.0),
                        color: Colors.indigo[900],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView()));
                        },
                      ),
                      SizedBox(
                        width: deviceWidth * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: deviceHeight * 0.04,
                          ),
                          Text(
                            'Resultado da Pesquisa',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.indigo[900]),
                          ),
                          SizedBox(
                            height: deviceHeight * 0.02,
                          ),
                          StreamBuilder<Pokemon>(
                            stream: pokemonBloc.pokemonStream.stream,
                            initialData: Pokemon(name: "Aguardando"),
                            builder: (context, snapshot) {
                              return Text(
                                '${snapshot.data.name}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Colors.grey),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder<Pokemon>(
              stream: pokemonBloc.pokemonStream.stream,
              initialData: Pokemon(name: "Aguardando"),
              builder: (context, snapshot) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      width: deviceWidth * 1,
                      height: deviceHeight * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            width: 2.0,
                            color: Colors.grey[300],
                          ),
                          bottom: BorderSide(
                            width: 2.0,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            deviceWidth * 0.05,
                            deviceHeight * 0.01,
                            deviceWidth * 0.05,
                            deviceHeight * 0.01),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: deviceHeight * 0.1,
                                      height: deviceHeight * 0.1,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              '${snapshot.data.sprites.frontDefault}'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.redAccent[400],
                                          width: 3.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: deviceWidth * 0.08,
                                    ),
                                    Container(
                                      width: deviceWidth * 0.4,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${snapshot.data.name}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                color: Colors.redAccent[400]),
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
                                                fontSize: 12.0,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 40.0,
                                      icon: Icon(Icons.arrow_forward_ios_sharp,
                                          size: 40.0),
                                      color: Colors.redAccent[400],
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PokemonView()),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}







