import 'package:flutter/cupertino.dart';
import 'package:pokedex_app/model/PokemonJson.dart';
import 'package:pokedex_app/model/repositories/repository.dart';


class PokemonPresenter with ChangeNotifier {
  final Repository repository;


  PokemonPresenter(this.repository);

  List<PokemonJson> pokemonsList = [];
 
 void getPokemons() async {
   pokemonsList = await repository.getPokemons();
   notifyListeners();
 }
}