import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_services/games_services.dart';
import 'package:sliding_puzzle/auth/auth.dart';
import 'package:sliding_puzzle/commons/commons.dart';

class PointsCubit extends Cubit<PointsState> {
  PointsCubit() : super(const PointsState.init());

  Future<void> getPoints() async {
    emit(const PointsState.loading());
    try {
      final points = await GamesServices.getPlayerScore(androidLeaderboardID: androidLeaderboardID);
      if (points == null) return emit(const PointsState.unauthorized());

      emit(PointsState.loaded(points));
    } catch (e) {
      emit(PointsState.error(e.toString()));
    }
  }

  Future<void> increasePoints(int points, {bool isFirst = false}) async {
    try {
      emit(PointsState.loaded(points));
      await GamesServices.submitScore(score: Score(androidLeaderboardID: androidLeaderboardID, value: points));

      if (isFirst) {
        await GamesServices.increment(achievement: Achievement(androidID: androidTheFirstClearID));
      }
    } catch (e) {
      emit(PointsState.error(e.toString()));
    }
  }
}
