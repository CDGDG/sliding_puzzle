import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class ShuffleScreen extends StatelessWidget {
  const ShuffleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) => Card(
        color: state.color,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: context.read<PuzzleCubit>().shuffle,
          borderRadius: BorderRadius.circular(10),
          child: const Icon(
            Icons.shuffle,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
