import 'package:flutter/material.dart';

class ColorPuzzleTile extends StatelessWidget {
  const ColorPuzzleTile({
    super.key,
    this.onTap,
    required this.color,
    this.margin = const EdgeInsets.all(1),
    this.borderRadius,
  });
  final void Function()? onTap;
  final Color? color;
  final EdgeInsets margin;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
    );
  }
}
