import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sliding_puzzle/ad/ad.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class ShuffleScreen extends StatelessWidget {
  const ShuffleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) => BlocBuilder<AdLoadCubit, AdLoadState>(
        builder: (context, adState) => BlocListener<AdCntCubit, int>(
          listener: (context, adCnt) {
            if (adCnt % 7 == 0) {
              adState.whenOrNull(
                loaded: context.read<AdLoadCubit>().showAd,
                error: (message) => Fluttertoast.showToast(msg: message),
              );
            }
          },
          child: Card(
            color: state.color,
            margin: EdgeInsets.zero,
            child: InkWell(
              onTap: () {
                context.read<PuzzleCubit>().shuffle();
                context.read<AdCntCubit>().raise();
              },
              borderRadius: BorderRadius.circular(10),
              child: Icon(
                Icons.shuffle,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
