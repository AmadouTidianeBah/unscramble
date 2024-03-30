import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final bool isFilled;
  final String text;
  void Function()? onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isFilled
  });

  @override
  Widget build(BuildContext context) {
    if(isFilled) {
      return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.teal.shade400),
          ),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(color: Colors.white),)
      );
    } else {
      return OutlinedButton(
          onPressed: onPressed,
          child: Text(text,)
      );
    }
  }
}
