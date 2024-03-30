import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unscramble/data/data.dart';
import 'package:unscramble/my_button.dart';
import 'package:unscramble/my_dialog.dart';
import 'package:unscramble/unscramble_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UnscrambleModel>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Unscramble",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12,),
            Consumer<UnscrambleModel>(builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade100,
                        blurRadius: 4,
                      )
                    ]
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.teal.shade400,
                              borderRadius: const BorderRadius.all(Radius.circular(4))
                          ),
                          child: Text(
                            "${value.wordCounter}/${words.length}",
                            style: const TextStyle(
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      value.currentScrambleWord,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Text(
                      "Unscramble the word using all letters.",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      controller: value.inputController,
                      decoration: InputDecoration(
                          errorText: value.isWrongWord ? "Wrong answers" : null,
                          contentPadding: const EdgeInsets.all(12),
                          label: const Text("Enter your word"),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Colors.teal.shade400
                              )
                          )
                      ),
                    ),
                  ],
                ),
              );
            },),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    text: "Submit",
                    isFilled: true,
                    onPressed: () {
                      provider.checkUserWord();
                      if(provider.isGameOver) {
                        showDialog(
                          context: context,
                          builder: (context) => MyDialog(
                            score: provider.score,
                            onPlayAgainPressed: () {
                              Navigator.pop(context);
                              provider.resetGame();
                            },
                            onExitPressed: () {
                              exit(0);
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    text: "Skip",
                    isFilled: false,
                    onPressed: () {
                      provider.skipCurrentWord();
                      if(provider.isGameOver) {
                        showDialog(
                          context: context,
                          builder: (context) => MyDialog(
                            score: provider.score,
                            onPlayAgainPressed: () {
                              Navigator.pop(context);
                              provider.resetGame();
                            },
                            onExitPressed: () {
                              exit(0);
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24,),
            Consumer<UnscrambleModel>(builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(4))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Score: ${value.score}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24
                      ),
                    ),
                    Text(
                      "Skip: ${value.skipWord}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24
                      ),
                    ),
                  ],
                )
              );
            },),
          ],
        ),
      ),
    );
  }
}
