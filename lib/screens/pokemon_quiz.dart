import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokemon_quiz_flutter/api/pokeapi.dart';
import 'package:pokemon_quiz_flutter/models/pokemon.dart';
import 'package:pokemon_quiz_flutter/widgets/quiz_avatar.dart';
import 'package:pokemon_quiz_flutter/widgets/quiz_button.dart';
import 'package:pokemon_quiz_flutter/widgets/quiz_title.dart';
import 'package:pokemon_quiz_flutter/widgets/score_chip.dart';

class PokemonQuiz extends StatefulWidget {
  const PokemonQuiz({super.key});

  @override
  State<PokemonQuiz> createState() => _PokemonQuizState();
}

class _PokemonQuizState extends State<PokemonQuiz> {
  List<Pokemon> pokemons = [];
  List<Pokemon> chosenPokemons = [];
  int correctPokemonIndex = 0;

  int correctAnswers = 0;
  int wrongAnswers = 0;

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
  }

  int getRandomPokemonIndex() {
    return Random().nextInt(pokemons.length);
  }

  Pokemon getCorrectPokemon() {
    return pokemons[correctPokemonIndex];
  }

  String getChosenPokemonName(int index) {
    if (chosenPokemons.isEmpty) {
      return '';
    }

    return chosenPokemons[index].name;
  }

  void selectPokemonOption(int index, BuildContext context) {
    if (pokemons.isEmpty) {
      return;
    }

    setState(() {
      if (chosenPokemons[index].id == getCorrectPokemon().id) {
        correctAnswers++;
      } else {
        wrongAnswers++;
      }
    });

    choosePokemon();

    if (correctAnswers + wrongAnswers == 10) {
      showEndScoreMessage(context);
    }
  }

  void resetGame() {
    setState(() {
      correctAnswers = 0;
      wrongAnswers = 0;
    });
  }

  void showEndScoreMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Jogo Terminado!'),
          content: Text(
              "De 10 questões, você acertou $correctAnswers e errou $wrongAnswers."),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.pop(context, 'OK'); // Close the dialog
              },
              child: const Text(
                'Legal!',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color themeColor = Colors.red;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text('Pokémon Quiz'),
      ),
      body: Column(
        children: [
          const QuizTitle(
            title: 'Qual é esse Pokémon?',
          ),
          Expanded(
            child: Center(
              child: (pokemons.isNotEmpty)
                  ? QuizAvatar(
                      imageUrl: getCorrectPokemon().avatarUrl,
                    )
                  : const SpinKitSpinningLines(
                      color: Colors.red,
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScoreChip(
                score: correctAnswers,
                label: 'Acertos',
                theme: Colors.green,
              ),
              const SizedBox(
                width: 8,
              ),
              ScoreChip(
                score: wrongAnswers,
                label: 'Erros',
                theme: Colors.red,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'de 10',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Row(
            children: [
              QuizButton(
                label: getChosenPokemonName(0),
                onAction: () {
                  selectPokemonOption(0, context);
                },
              ),
              QuizButton(
                label: getChosenPokemonName(1),
                onAction: () {
                  selectPokemonOption(1, context);
                },
              )
            ],
          ),
          Row(
            children: [
              QuizButton(
                label: getChosenPokemonName(2),
                onAction: () {
                  selectPokemonOption(2, context);
                },
              ),
              QuizButton(
                label: getChosenPokemonName(3),
                onAction: () {
                  selectPokemonOption(3, context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
