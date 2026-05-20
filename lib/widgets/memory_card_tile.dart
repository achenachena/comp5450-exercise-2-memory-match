import 'package:flutter/material.dart';

import '../game/memory_game.dart';
import '../models/memory_card_data.dart';

class MemoryCardTile extends StatelessWidget {
  const MemoryCardTile({
    super.key,
    required this.card,
    required this.onTap,
    required this.enabled,
  });

  final MemoryCardData card;
  final VoidCallback onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final showFace = card.isFaceUp || card.isMatched;
    final backColor = MemoryGame.cardBackColors[card.backColorIndex];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: showFace ? Colors.white : backColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: showFace
                  ? const Color(0xFFE9D5FF)
                  : backColor.withValues(alpha: 0.85),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: showFace
                  ? Text(
                      card.symbol,
                      key: ValueKey('face-${card.id}'),
                      style: const TextStyle(fontSize: 34),
                    )
                  : Text(
                      '?',
                      key: ValueKey('back-${card.id}'),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.red.shade600,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
