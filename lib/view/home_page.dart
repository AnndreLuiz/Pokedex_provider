import 'package:flutter/material.dart';
import 'package:pokedex_app/presenter/pokemon_presenter.dart';
import '../model/PokemonJson.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool carregando = true;

  late PokemonPresenter presenter;

  @override
  void initState() {

    presenter = context.read<PokemonPresenter>();
    presenter.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Text('Pokedex'),
            SizedBox(
              width: 35,
              child: Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
              ),
            ),
          ],
        ),
      ),
      body: Consumer<PokemonPresenter>(
        builder: (_, pokemons , widget) {
          return ListView.builder(
            itemCount: pokemons.pokemonsList.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/descricao',arguments: pokemons.pokemonsList[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          '${pokemons.pokemonsList[index].thumbnailImage}',
                          width: 95,
                          height: 95,
                        ),
                        Column(
                          children: [
                            Text(
                              pokemons.pokemonsList[index].name ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 125,
                        ),
                        Text(
                          '#${pokemons.pokemonsList[index].number ?? ''}',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
