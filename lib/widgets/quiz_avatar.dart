import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuizAvatar extends StatelessWidget {
  final String imageUrl;

  const QuizAvatar({
    super.key,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    const double size = 240;

    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            offset: Offset(4, 4),
            blurRadius: 64,
          )
        ]
      ),
      child: Image.network(
        imageUrl,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return const Center(
            child: SpinKitSpinningLines(
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
