import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../game/memory_game.dart';
import '../models/memory_card_data.dart';

class MemoryCardTile extends StatefulWidget {
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
  State<MemoryCardTile> createState() => _MemoryCardTileState();
}

class _MemoryCardTileState extends State<MemoryCardTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _flipController;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _syncFlip(widget.card);
  }

  @override
  void didUpdateWidget(MemoryCardTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncFlip(widget.card);
  }

  void _syncFlip(MemoryCardData card) {
    final showFace = card.isFaceUp || card.isMatched;
    if (showFace) {
      _flipController.forward();
    } else {
      _flipController.reverse();
    }
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final card = widget.card;
    final backColor = MemoryGame.cardBackColors[card.backColorIndex];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.enabled ? widget.onTap : null,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedBuilder(
          animation: _flipController,
          builder: (context, child) {
            final angle = _flipController.value * math.pi;
            final showFront = angle >= math.pi / 2;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              child: showFront
                  ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(math.pi),
                      child: _CardFace(card: card),
                    )
                  : _CardBack(backColor: backColor),
            );
          },
        ),
      ),
    );
  }
}

class _CardBack extends StatelessWidget {
  const _CardBack({required this.backColor});

  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: backColor.withValues(alpha: 0.85), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '?',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.red.shade600,
          ),
        ),
      ),
    );
  }
}

class _CardFace extends StatelessWidget {
  const _CardFace({required this.card});

  final MemoryCardData card;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE9D5FF), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          card.symbol,
          style: const TextStyle(fontSize: 34),
        ),
      ),
    );
  }
}
