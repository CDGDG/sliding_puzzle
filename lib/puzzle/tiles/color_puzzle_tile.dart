import 'package:flutter/material.dart';

class ColorPuzzleTile extends StatelessWidget {
  const ColorPuzzleTile({
    super.key,
    this.onTap,
    required this.color,
    this.borderRadius,
  });
  final void Function()? onTap;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
      color: color,
      elevation: 0.1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
    );
  }
}
