import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/tiles/tiles.dart';

class ColorPuzzleTile extends StatelessWidget {
  const ColorPuzzleTile({
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
      color: color.withOpacity((1 / size) * (index + 1)),
      size: size,
    );
  }
}
