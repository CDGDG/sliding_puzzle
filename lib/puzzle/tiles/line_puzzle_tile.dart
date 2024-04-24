import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class LinePuzzleTile extends StatelessWidget {
  const LinePuzzleTile({
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
      color: color.withOpacity(0.1),
      size: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: index - 1,
              child: const SizedBox.shrink(),
            ),
            Expanded(
              flex: sqrt(size).ceil() - 2,
              child: Transform(
                transform: Matrix4.skewY(0.12 / pow(2, sqrt(size) - 3)), // 3 -> 0.12 | 4 -> 0.06 | 5 -> 0.03 | 6 -> 0.015
                child: Container(
                  color: color,
                ),
              ),
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
