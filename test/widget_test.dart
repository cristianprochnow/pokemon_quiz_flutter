import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_quiz_flutter/screens/pokemon_quiz.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PokemonQuiz());
  });
}
