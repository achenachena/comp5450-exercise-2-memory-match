import 'dart:math';

import 'package:flutter/material.dart';

import '../models/memory_card_data.dart';

class MemoryGame {
  MemoryGame() {
    reset();
  }

  static const int columns = 4;
  static const int rows = 5;
  static const int pairCount = 10;

  static const List<String> animalSymbols = [
    '🦘',
    '🦓',
    '🐯',
    '🦁',
    '🐻',
    '🐼',
    '🦊',
    '🐵',
    '🐨',
    '🐧',
  ];

  static const List<Color> cardBackColors = [
    Color(0xFF4ADE80), // green
    Color(0xFFA78BFA), // purple
    Color(0xFF60A5FA), // blue
    Color(0xFFFACC15), // yellow
    Color(0xFFFB923C), // orange
    Color(0xFFF472B6), // pink
  ];

  final Random _random = Random();

  List<MemoryCardData> cards = [];
  int moves = 0;
  int? firstSelectedIndex;
  bool isBusy = false;
  bool isWon = false;

  int get matchedPairs =>
      cards.where((card) => card.isMatched).length ~/ 2;

  void reset() {
    moves = 0;
    firstSelectedIndex = null;
    isBusy = false;
    isWon = false;

    final deck = <MemoryCardData>[];
    var id = 0;
    for (var pair = 0; pair < pairCount; pair++) {
      final symbol = animalSymbols[pair];
      final backColorIndex = pair % cardBackColors.length;
      deck.add(
        MemoryCardData(
          id: id++,
          symbol: symbol,
          backColorIndex: backColorIndex,
        ),
      );
      deck.add(
        MemoryCardData(
          id: id++,
          symbol: symbol,
          backColorIndex: (backColorIndex + 1) % cardBackColors.length,
        ),
      );
    }
    deck.shuffle(_random);
    cards = deck;
  }

  Future<bool> handleTap(int index) async {
    if (isBusy || isWon) return false;
    if (index < 0 || index >= cards.length) return false;

    final card = cards[index];
    if (card.isMatched || card.isFaceUp) return false;

    card.isFaceUp = true;

    if (firstSelectedIndex == null) {
      firstSelectedIndex = index;
      return false;
    }

    if (firstSelectedIndex == index) return false;

    moves += 1;
    isBusy = true;

    final first = cards[firstSelectedIndex!];
    final second = card;
    final isMatch = first.symbol == second.symbol;

    if (isMatch) {
      first.isMatched = true;
      second.isMatched = true;
      firstSelectedIndex = null;
      isBusy = false;
      isWon = cards.every((c) => c.isMatched);
      return isWon;
    }

    await Future<void>.delayed(const Duration(milliseconds: 750));
    first.isFaceUp = false;
    second.isFaceUp = false;
    firstSelectedIndex = null;
    isBusy = false;
    return false;
  }
}
