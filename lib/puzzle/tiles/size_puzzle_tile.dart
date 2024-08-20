import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class SizePuzzleTile extends StatelessWidget {
  const SizePuzzleTile({
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
      child: Transform.scale(
        scale: 1 / size * (index + 1),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
      ),
    );
  }
}
