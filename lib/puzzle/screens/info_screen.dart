import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _Info(
                    label: "Type",
                    content: switch (state.type) {
                      PuzzleType.number => CircleAvatar(
                          backgroundColor: state.color,
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      PuzzleType.color => CircleAvatar(
                          backgroundColor: state.color,
                        ),
                      PuzzleType.line => CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: ClipOval(
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(color: state.color),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(color: state.color),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      PuzzleType.stair => CircleAvatar(
                          backgroundColor: state.color,
                          child: Icon(
                            MdiIcons.stairs,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      PuzzleType.size => CircleAvatar(
                          backgroundColor: state.color.withOpacity(0.4),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: state.color.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: state.color.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: state.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      // PuzzleType.count => CircleAvatar(
                      //     backgroundColor: state.color,
                      //     child: Builder(builder: (context) {
                      //       final icon = Icon(
                      //         switch (state.countShape!) {
                      //           CountShapeType.circle => Icons.circle,
                      //           CountShapeType.tri => MdiIcons.triangle,
                      //           CountShapeType.rect => MdiIcons.checkboxBlank,
                      //           CountShapeType.star => Icons.star_rounded,
                      //         },
                      //         color: Theme.of(context).colorScheme.onPrimary,
                      //         size: 10,
                      //       );
                      //       return Padding(
                      //         padding: const EdgeInsets.all(8),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Expanded(
                      //               child: icon,
                      //             ),
                      //             Expanded(
                      //               child: Row(
                      //                 children: [
                      //                   Expanded(
                      //                     child: Container(
                      //                       alignment: Alignment.topRight,
                      //                       child: icon,
                      //                     ),
                      //                   ),
                      //                   const SizedBox(width: 4),
                      //                   Expanded(
                      //                     child: Container(
                      //                       alignment: Alignment.topLeft,
                      //                       child: icon,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     }),
                      //   ),
                    },
                    color: state.color,
                  ),
                ),
                const VerticalDivider(width: 32),
                Expanded(
                  child: _Info(
                    label: "Moves",
                    content: Center(
                      child: AnimatedFlipCounter(
                        value: state.move,
                        textStyle: TextStyle(
                          color: state.color,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    color: state.color,
                  ),
                ),
                const VerticalDivider(width: 32),
                Expanded(
                  child: _Info(
                    label: "Size",
                    content: Center(
                      child: Text(
                        "${state.size}",
                        style: TextStyle(
                          color: state.color,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    color: state.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.label,
    this.content,
    this.color,
  });
  final String label;
  final Widget? content;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            color: color ?? Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
        if (content != null) const SizedBox(height: 8),
        Expanded(
          child: content ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
