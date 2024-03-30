import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unscramble/data/data.dart';

class UnscrambleModel extends ChangeNotifier {
  final inputController = TextEditingController();
  late String currentScrambleWord;
  late int _score;
  int get score => _score;
  late int _skipWord;
  int get skipWord => _skipWord;
  late bool _isWrongWord;
  bool get isWrongWord => _isWrongWord;
  late bool _isGameOver;
  bool get isGameOver => _isGameOver;
  late int wordCounter;
  late String _currentWord;
  final List<String> _usedWords = [];

  UnscrambleModel() {
   resetGame();
  }

  void resetGame() {
    _usedWords.clear();
    currentScrambleWord = pickAndShuffleWord();
    _score = 0;
    _skipWord = 0;
    _isWrongWord = false;
    _isGameOver = false;
    wordCounter = 1;
    notifyListeners();
  }

  void checkUserWord() {
    if(inputController.text.toLowerCase() == _currentWord.toLowerCase()) {
      _updateGame(_score + 10);
    } else {
      _isWrongWord = true;
      notifyListeners();
    }
    inputController.clear();
  }

  void skipCurrentWord() {
    inputController.clear();
    _skipWord++;
    _updateGame(_score);
    notifyListeners();
  }

  void _updateGame(int score) {
    if(_usedWords.length == words.length) {
      _isWrongWord = false;
      _score = score;
      _isGameOver = true;
    } else {
      _isWrongWord = false;
      currentScrambleWord = pickAndShuffleWord();
      wordCounter++;
      _score = score;
    }
    notifyListeners();
  }

  String pickAndShuffleWord() {
    _currentWord = words[Random().nextInt(words.length)];

    if(_usedWords.isNotEmpty && _usedWords.contains(_currentWord)) {
      return pickAndShuffleWord();
    } else {
      _usedWords.add(_currentWord);
      return _shuffleLetters(_currentWord);
    }
  }

  String _shuffleLetters(String word) {
    final letters = word.split('');
    letters.shuffle();

    while(letters.join('') == word) {
      letters.shuffle();
    }

    return letters.join('');
  }
}