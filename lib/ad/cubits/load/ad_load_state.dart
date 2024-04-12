import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ad_load_state.freezed.dart';

@freezed
class AdLoadState with _$AdLoadState {
  const factory AdLoadState.init() = _Init;
  const factory AdLoadState.loading() = _Loading;
  const factory AdLoadState.loaded(InterstitialAd ad) = _Loaded;
  const factory AdLoadState.error(String message) = _Error;
}