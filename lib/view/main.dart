import 'package:flutter/material.dart';
import 'package:pokedex_app/model/repositories/repository.dart';
import 'package:pokedex_app/presenter/pokemon_presenter.dart';
import 'package:pokedex_app/view/home_page.dart';
import 'package:pokedex_app/view/detalhes_poke.dart';
import 'package:provider/provider.dart';

void main() {
  final repository = Repository();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PokemonPresenter(repository),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(),
        '/descricao': (context) => const DetalhesPokemons(),
      },
      initialRoute: '/home',
    );
  }
}
