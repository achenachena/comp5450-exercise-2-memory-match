import 'package:flutter_test/flutter_test.dart';
import 'package:memory_match/game/memory_game.dart';

void main() {
  group('MemoryGame', () {
    test('reset builds 20 cards with 10 pairs', () {
      final game = MemoryGame();
      expect(game.cards.length, 20);
      expect(MemoryGame.columns * MemoryGame.rows, 20);
      expect(game.moves, 0);
      expect(game.isWon, isFalse);

      final symbols = game.cards.map((c) => c.symbol).toList()..sort();
      final expected = [...MemoryGame.animalSymbols, ...MemoryGame.animalSymbols]
        ..sort();
      expect(symbols, expected);
    });

    test('first flip does not count as a move', () async {
      final game = MemoryGame();
      await game.handleTap(0);
      expect(game.moves, 0);
      expect(game.cards[0].isFaceUp, isTrue);
    });

    test('matching pair marks cards and counts one move', () async {
      final game = MemoryGame();
      final indices = _pairIndices(game);
      await game.handleTap(indices.$1);
      await game.handleTap(indices.$2);

      expect(game.moves, 1);
      expect(game.cards[indices.$1].isMatched, isTrue);
      expect(game.cards[indices.$2].isMatched, isTrue);
    });

    test('mismatch flips cards back after delay', () async {
      final game = MemoryGame();
      final mismatch = _mismatchIndices(game);
      await game.handleTap(mismatch.$1);
      await game.handleTap(mismatch.$2);

      expect(game.moves, 1);
      expect(game.cards[mismatch.$1].isFaceUp, isFalse);
      expect(game.cards[mismatch.$2].isFaceUp, isFalse);
    });

    test('reset clears progress', () async {
      final game = MemoryGame();
      await game.handleTap(0);
      game.reset();
      expect(game.moves, 0);
      expect(game.cards.every((c) => !c.isFaceUp && !c.isMatched), isTrue);
    });
  });
}

(int, int) _pairIndices(MemoryGame game) {
  for (var i = 0; i < game.cards.length; i++) {
    for (var j = i + 1; j < game.cards.length; j++) {
      if (game.cards[i].symbol == game.cards[j].symbol) {
        return (i, j);
      }
    }
  }
  throw StateError('No pair found');
}

(int, int) _mismatchIndices(MemoryGame game) {
  for (var i = 0; i < game.cards.length; i++) {
    for (var j = i + 1; j < game.cards.length; j++) {
      if (game.cards[i].symbol != game.cards[j].symbol) {
        return (i, j);
      }
    }
  }
  throw StateError('No mismatch found');
}
