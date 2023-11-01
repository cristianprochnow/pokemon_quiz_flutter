import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuizButton extends StatelessWidget {
  final String label;
  final VoidCallback onAction;

  const QuizButton({
    super.key,
    required this.label,
    required this.onAction
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            minimumSize: const Size.fromHeight(64), // NEW
          ),
          onPressed: onAction,
          child: (label.isEmpty)
            ? const SpinKitSpinningLines(
                color: Colors.white,
                size: 32,
              )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
        ),
      ),
    );
  }
}
