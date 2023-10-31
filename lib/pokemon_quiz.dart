import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokemon_quiz_flutter/widgets/quiz_avatar.dart';
import 'package:pokemon_quiz_flutter/widgets/quiz_button.dart';
import 'package:pokemon_quiz_flutter/widgets/quiz_title.dart';

class PokemonQuiz extends StatefulWidget {
  const PokemonQuiz({super.key});

  @override
  State<PokemonQuiz> createState() => _PokemonQuizState();
}

class _PokemonQuizState extends State<PokemonQuiz> {
  @override
  Widget build(BuildContext context) {
    Color themeColor = Colors.red;
    String url = 'https://avatars.githubusercontent.com/u/48127848';

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
            Expanded(
              child: Center(
                child: QuizAvatar(
                  imageUrl: url,
                )
              ),
            ),
            Row(
              children: [
                QuizButton(
                  label: 'Pokemon 1',
                  onAction: () {
                    log('show');
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
