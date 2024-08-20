import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class CountPuzzleTile extends StatelessWidget {
  const CountPuzzleTile({
    super.key,
    this.onTap,
    required this.index,
    this.borderRadius,
    required this.color,
    required this.size,
    required this.shape,
  });
  final void Function()? onTap;
  final int index;
  final double? borderRadius;
  final Color color;
  final int size;
  final CountShapeType shape;

  @override
  Widget build(BuildContext context) {
    return DefaultTile(
      onTap: onTap,
      index: index,
      borderRadius: borderRadius,
      color: color,
      size: size,
      child: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: sqrt(index).ceil(),
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(4),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: List.generate(
            index,
            (index) => FittedBox(
              child: Icon(
                switch (shape) {
                  CountShapeType.circle => Icons.circle,
                  CountShapeType.tri => MdiIcons.triangle,
                  CountShapeType.rect => MdiIcons.checkboxBlank,
                  CountShapeType.star => Icons.star_rounded,
                },
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
