import 'package:flutter/material.dart';

class DefaultTile extends StatelessWidget {
  const DefaultTile({
    super.key,
    required this.onTap,
    required this.index,
    required this.borderRadius,
    required this.color,
    required this.size,
    this.child,
  });
  final void Function()? onTap;
  final int index;
  final double? borderRadius;
  final Color color;
  final int size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 10)),
      color: color,
      elevation: 0.1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: child,
      ),
    );
  }
}
