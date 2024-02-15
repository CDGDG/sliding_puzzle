import 'package:flutter/material.dart';

class NumberPuzzleTile extends StatelessWidget {
  const NumberPuzzleTile({
    super.key,
    this.onTap,
    required this.number,
    this.margin = const EdgeInsets.all(1),
    this.borderRadius,
  });
  final void Function()? onTap;
  final int number;
  final EdgeInsets margin;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      margin: margin,
      shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
      elevation: 0.1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: Center(
          child: Text(
            "$number",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
