import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class NumberPuzzleTile extends StatelessWidget {
  const NumberPuzzleTile({
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
      color: color,
      size: size,
      child: Center(
        child: Text(
          "$index",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
