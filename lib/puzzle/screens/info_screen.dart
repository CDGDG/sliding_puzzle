import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) => Card(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _Info(
                    label: "Type",
                    content: state.type == PuzzleType.number ?,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  child: Column(
                    children: [
                      Text("Type"),
                    ],
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  child: Column(
                    children: [
                      Text("Type"),
                    ],
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
  });
  final String label;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content ?? const SizedBox.shrink(),
      ],
    );
  }
}
