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
