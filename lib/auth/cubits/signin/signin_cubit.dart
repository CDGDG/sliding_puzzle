import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_services/games_services.dart';
import 'package:sliding_puzzle/auth/auth.dart';
import 'package:sliding_puzzle/commons/commons.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(const SigninState.init());

  Future<void> signIn() async {
    emit(const SigninState.loading());
    try {
      await GameAuth.signIn();
      if (!await (GameAuth.isSignedIn)) return emit(const SigninState.fail());

      try {
        await GamesServices.getPlayerScore(androidLeaderboardID: androidLeaderboardID);
      } on PlatformException catch (e) {
        if (e.code == "failed_to_get_score") await GamesServices.submitScore(score: Score(androidLeaderboardID: androidLeaderboardID, value: 0));
      }
      emit(const SigninState.signin());
    } catch (e) {
      emit(SigninState.error(e.toString()));
    }
  }
}
