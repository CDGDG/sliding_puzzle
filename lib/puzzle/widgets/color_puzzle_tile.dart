import 'package:flutter/material.dart';

class ColorPuzzleTile extends StatelessWidget {
  const ColorPuzzleTile({
    super.key,
    this.onTap,
    required this.color,
  });
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(1),
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
