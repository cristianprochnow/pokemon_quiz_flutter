import 'package:flutter/material.dart';

class QuizTitle extends StatelessWidget {
  final String title;

  const QuizTitle({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            decoration: TextDecoration.underline,
            decorationColor: Colors.redAccent,
            decorationStyle: TextDecorationStyle.dotted
          ),
        ),
      ),
    );
  }
}
