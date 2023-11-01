import 'package:flutter/material.dart';

class ScoreChip extends StatelessWidget {
  final String label;
  final Color theme;
  final int score;

  const ScoreChip({
    super.key,
    required this.label,
    required this.theme,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: theme,
      avatar: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Text(
          score.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      label: Text(
        label.toString(),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
