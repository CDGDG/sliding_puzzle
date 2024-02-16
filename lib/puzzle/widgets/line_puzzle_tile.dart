import 'package:flutter/material.dart';

class LinePuzzleTile extends StatelessWidget {
  const LinePuzzleTile({
    super.key,
    this.onTap,
    required this.index,
    required this.color,
    this.margin = const EdgeInsets.all(1),
    this.borderRadius,
  });
  final void Function()? onTap;
  final int index;
  final EdgeInsets margin;
  final double? borderRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: margin,
      shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
      elevation: 0.1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
    );
  }
}
