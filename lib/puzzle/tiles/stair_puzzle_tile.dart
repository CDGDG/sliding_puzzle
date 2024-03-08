import 'package:flutter/material.dart';

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
      ),
    );
  }
}
