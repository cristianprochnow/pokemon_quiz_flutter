import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon_quiz_flutter/api/pokeapi.dart';
import 'package:pokemon_quiz_flutter/models/pokemon.dart';
import 'package:pokemon_quiz_flutter/widgets/quiz_avatar.dart';
import 'package:pokemon_quiz_flutter/widgets/quiz_button.dart';
import 'package:pokemon_quiz_flutter/widgets/quiz_title.dart';

class PokemonQuiz extends StatefulWidget {
  const PokemonQuiz({super.key});

  @override
  State<PokemonQuiz> createState() => _PokemonQuizState();
}

class _PokemonQuizState extends State<PokemonQuiz> {
  List<Pokemon> pokemons = [];
  List<Pokemon> chosenPokemons = [];
  int correctPokemonIndex = 0;

  @override
  void initState() {
    super.initState();

    getPokemonData();
  }

  void getPokemonData() async {
    if (pokemons.isEmpty) {
      List<Pokemon> pokemonList = await PokeApi.getPokemonList();

      setState(() {
        pokemons = pokemonList;
      });
    }

    choosePokemon();
  }

  void choosePokemon() {
    setState(() {
      chosenPokemons = [];

      correctPokemonIndex = getRandomPokemonIndex();
      chosenPokemons.add(pokemons[correctPokemonIndex]);

      chosenPokemons.add(pokemons[getRandomPokemonIndex()]);
      chosenPokemons.add(pokemons[getRandomPokemonIndex()]);
      chosenPokemons.add(pokemons[getRandomPokemonIndex()]);

      chosenPokemons.shuffle();
    });

    print(chosenPokemons.toString());
  }

  int getRandomPokemonIndex() {
    return Random().nextInt(pokemons.length);
  }

  @override
  Widget build(BuildContext context) {
    const Color themeColor = Colors.red;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: const Text('Pokémon Quiz'),
        ),
        body: Column(
          children: [
            const QuizTitle(
              title: 'Qual é esse Pokemon?',
            ),
            const Expanded(
              child: Center(
                child: QuizAvatar(
                  imageUrl: '',
                )
              ),
            ),
            Row(
              children: [
                QuizButton(
                  label: 'Pokemon 1',
                  onAction: () {
                    print('show');
                  },
                ),
                QuizButton(
                  label: 'Pokemon 2',
                  onAction: () {
                    print('show');
                  },
                )
              ],
            ),
            Row(
              children: [
                QuizButton(
                  label: 'Pokemon 3',
                  onAction: () {
                    print('show');
                  },
                ),
                QuizButton(
                  label: 'Pokemon 4',
                  onAction: () {
                    print('show');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
