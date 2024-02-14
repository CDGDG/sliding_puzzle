import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          backgroundColor: Theme.of(context).colorScheme.primary,
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
                    },
                    color: state.color,
                  ),
                ),
                const VerticalDivider(width: 32),
                Expanded(
                  child: _Info(
                    label: "Move",
                    content: Center(
                      child: AnimatedFlipCounter(
                        value: state.move,
                        textStyle: TextStyle(
                          color: state.color ?? Theme.of(context).colorScheme.primary,
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
                    label: "Clear",
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
