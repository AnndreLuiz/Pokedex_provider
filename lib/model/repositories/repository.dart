import 'dart:convert';
import '../PokemonJson.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<PokemonJson>> getPokemons() async{
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    List<PokemonJson> pokemonsList = [];

    final resultado = await http.get(url);
    
     if (resultado.statusCode == 200) {
        Map json = const JsonDecoder().convert(resultado.body);

        for (var element in (json['data'] as List)) {
          pokemonsList.add(PokemonJson.fromJson(element));
        }

        return pokemonsList;
      }

    return pokemonsList;
  }
}
