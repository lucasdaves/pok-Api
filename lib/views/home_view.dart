import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:pokeapi/views/search_view.dart';
import 'package:pokeapi/controllers/pokemon_bloc.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _text = TextEditingController();
  final pokemonBloc = BlocProvider.getBloc<PokemonBloc>();

  @override
  Widget build(BuildContext context) {
    _getSearchPage(String text) async {
      text = text.toLowerCase();
      pokemonBloc.searchPokemon(text);

      if (pokemonBloc.pokemonStream.length != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchView()));
      }
    }

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.redAccent[400],
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(
                  deviceWidth * 0.1,
                  deviceHeight * 0.025,
                  deviceWidth * 0.1,
                  deviceHeight * 0.025),
              height: deviceHeight * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                      fit: BoxFit.contain),
                  shape: BoxShape.rectangle),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(deviceWidth * 0.05, 0,
                  deviceWidth * 0.05, deviceHeight * 0.05),
              height: deviceHeight * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    deviceWidth * 0.05,
                    deviceHeight * 0.075,
                    deviceWidth * 0.05,
                    deviceHeight * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: deviceHeight * 0.05,
                      child: Text(
                        'Conheça a Pokédex',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            color: Colors.indigo[900]),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.15,
                      child: Text(
                        'Utilize a pokédex para encontrar mais informações sobre seus pokemons.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.indigo[900]),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.07,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.white, // set border color
                              width: 1.0), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300].withOpacity(1),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.fromLTRB(deviceWidth * 0.05, 0, 0, 0),
                          child: TextField(
                            controller: _text,
                            decoration: InputDecoration(
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              hintText: "Digite o nome do pokémon ...",
                              suffixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(child: SizedBox(height: deviceHeight * 0.25)),
                    Container(
                      child: SizedBox(
                        height: deviceHeight * 0.07,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo[900], // background
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                          ),
                          onPressed: (_text.text.isNotEmpty)
                              ? () => _getSearchPage(_text.text)
                              : null,
                          child: Text(
                            "PESQUISAR",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
