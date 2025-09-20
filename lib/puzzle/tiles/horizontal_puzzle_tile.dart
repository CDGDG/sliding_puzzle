import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class HorizontalPuzzleTile extends StatelessWidget {
  const HorizontalPuzzleTile({
    super.key,
    this.onTap,
    required this.index,
    required this.color,
    required this.size,
    this.borderRadius,
  });
  final void Function()? onTap;
  final int index;
  final Color color;
  final int size;
  final double? borderRadius;

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
        child: Column(
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
            )
          ],
        ),
      ),
    );
  }
}
