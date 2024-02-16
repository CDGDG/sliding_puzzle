import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_services/games_services.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class ShuffleScreen extends StatelessWidget {
  const ShuffleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              color: state.color.withOpacity(0.5),
              margin: EdgeInsets.zero,
              child: InkWell(
                onTap: () => Leaderboards.showLeaderboards(androidLeaderboardID: "CgkI6vLrr-kdEAIQAQ"),
                borderRadius: BorderRadius.circular(10),
                child: const Icon(
                  Icons.leaderboard_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Card(
              color: state.color,
              margin: EdgeInsets.zero,
              child: InkWell(
                onTap: context.read<PuzzleCubit>().shuffle,
                borderRadius: BorderRadius.circular(10),
                child: const Icon(
                  Icons.shuffle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
