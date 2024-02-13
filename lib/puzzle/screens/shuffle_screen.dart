import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class ShuffleScreen extends StatelessWidget {
  const ShuffleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: context.read<PuzzleCubit>().shuffle,
        borderRadius: BorderRadius.circular(10),
        child: Icon(
          Icons.shuffle,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
