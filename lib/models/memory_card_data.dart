/// One card on the memory board (face-down until flipped).
class MemoryCardData {
  MemoryCardData({
    required this.id,
    required this.symbol,
    required this.backColorIndex,
    this.isFaceUp = false,
    this.isMatched = false,
  });

  final int id;
  final String symbol;
  final int backColorIndex;
  bool isFaceUp;
  bool isMatched;
}
