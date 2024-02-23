import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/auth/auth.dart';
import 'package:sliding_puzzle/commons/utils/fonts.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SlidingPuzzle());
}

class SlidingPuzzle extends StatelessWidget {
  const SlidingPuzzle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit()..signIn(),
      child: MaterialApp(
        title: 'Sliding Puzzle',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: Fonts.montserrat,
        ),
        home: BlocListener<SigninCubit, SigninState>(
          listener: (context, state) => state.whenOrNull(
            fail: () => print("Play Game is not installed"),
            error: (message) => print("fail to signin"),
          ),
          child: const PuzzleScreen(),
        ),
      ),
    );
  }
}
