import 'dart:math';

import 'package:flutter/material.dart';

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
    final angle = (pi / 4) / size + (0.3 / size);
    return Card(
      margin: EdgeInsets.zero,
      color: color.withOpacity(0.1),
      shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
      elevation: 0.1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
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
                child: Transform.rotate(
                  angle: angle,
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
      ),
    );
  }
}
