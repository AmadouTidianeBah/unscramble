import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final int score;
  void Function()? onExitPressed;
  void Function()? onPlayAgainPressed;

  MyDialog({
    super.key,
    required this.score,
    required this.onPlayAgainPressed,
    required this.onExitPressed
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Congratulations!"),
      content: Text("Your score is: $score"),
      actions: [
        TextButton(
          onPressed: onExitPressed,
          child: const Text("Exit"),
        ),
        TextButton(
          onPressed: onPlayAgainPressed,
          child: const Text("Play again"),
        ),
      ],
    );
  }
}
