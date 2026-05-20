import 'package:flutter/material.dart';

import '../game/memory_game.dart';
import '../widgets/memory_card_tile.dart';

class MemoryMatchScreen extends StatefulWidget {
  const MemoryMatchScreen({super.key, MemoryGame? game})
      : _initialGame = game;

  /// Optional injected game (used by tests / screenshot generation).
  final MemoryGame? _initialGame;

  @override
  State<MemoryMatchScreen> createState() => _MemoryMatchScreenState();
}

class _MemoryMatchScreenState extends State<MemoryMatchScreen> {
  late final MemoryGame _game = widget._initialGame ?? MemoryGame();

  static const Color _purple = Color(0xFF7C3AED);
  static const Color _purpleDark = Color(0xFF5B21B6);

  Future<void> _onCardTap(int index) async {
    final won = await _game.handleTap(index);
    if (!mounted) return;
    setState(() {});
    if (won) {
      _showWinDialog();
    }
  }

  void _restart() {
    setState(_game.reset);
  }

  void _showWinDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('You did it! 🎉'),
        content: Text(
          'All pairs matched in ${_game.moves} moves.\n'
          'Tap Restart to play again.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _restart();
            },
            child: const Text('Restart'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Keep viewing'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: _purple),
          tooltip: 'Back',
          onPressed: () {
            final navigator = Navigator.of(context);
            if (navigator.canPop()) {
              navigator.pop();
              return;
            }
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You are on the main game screen.'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
        title: const Text(
          'Memory Match',
          style: TextStyle(
            color: _purpleDark,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _MovesBadge(moves: _game.moves),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth > 520 ? 480.0 : constraints.maxWidth;
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Find all matching pairs! 🐾',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF475569),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Matched: ${_game.matchedPairs} / ${MemoryGame.pairCount}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: MemoryGame.columns,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.82,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                            _game.cards.length,
                            (index) => MemoryCardTile(
                              key: ValueKey('card-$index'),
                              card: _game.cards[index],
                              enabled: !_game.isBusy && !_game.isWon,
                              onTap: () => _onCardTap(index),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        onPressed: _restart,
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Restart'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _purpleDark,
                          side: const BorderSide(color: Color(0xFFE9D5FF)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MovesBadge extends StatelessWidget {
  const _MovesBadge({required this.moves});

  final int moves;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFDDD6FE)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.adjust_rounded, size: 18, color: Colors.purple.shade700),
          const SizedBox(width: 6),
          Text(
            '$moves',
            style: const TextStyle(
              color: Color(0xFF5B21B6),
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
