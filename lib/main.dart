import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ).copyWith(
          textTheme: Typography().white.apply(fontFamily: Fonts.montserrat),
        ),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        ),
        home: BlocListener<SigninCubit, SigninState>(
          listener: (context, state) => state.whenOrNull(
            fail: () => Fluttertoast.showToast(msg: "Play Games is not installed"),
            error: (message) => Fluttertoast.showToast(msg: message),
          ),
          child: const PuzzleScreen(),
        ),
      ),
    );
  }
}
