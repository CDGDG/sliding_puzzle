import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class VerticalPuzzleTile extends StatelessWidget {
  const VerticalPuzzleTile({
    super.key,
    this.onTap,
    required this.index,
    required this.color,
    required this.size,
    this.borderRadius,
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
      color: color.withOpacity(0.3),
      size: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: Row(
          children: [
            Expanded(
              flex: size - index - 1,
              child: const SizedBox.shrink(),
            ),
            Expanded(
              flex: index,
              child: Container(color: color),
            ),
            Expanded(
              flex: size - index - 1,
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
