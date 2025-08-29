import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class StairPuzzleTile extends StatelessWidget {
  const StairPuzzleTile({
    super.key,
    this.onTap,
    required this.index,
    this.borderRadius,
    required this.color,
    required this.size,
  });
  final void Function()? onTap;
  final int index;
  final double? borderRadius;
  final Color color;
  final int size;

  @override
  Widget build(BuildContext context) {
    return DefaultTile(
      onTap: onTap,
      index: index,
      borderRadius: borderRadius,
      color: color.withOpacity(0.6),
      size: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: Column(
          children: [
            Expanded(
              flex: size - 1 - index,
              child: const SizedBox.shrink(),
            ),
            Expanded(
              flex: index,
              child: Container(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
