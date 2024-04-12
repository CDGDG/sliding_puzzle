import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/ad/ad.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sliding_puzzle/ad_helper.dart';

class AdLoadCubit extends Cubit<AdLoadState> {
  AdLoadCubit() : super(const AdLoadState.init());

  Future<void> init() async {
    emit(const AdLoadState.loading());
    try {
      await MobileAds.instance.initialize();
    } catch (e) {
      emit(const AdLoadState.error("Failed to initialize AD"));
    }
    await loadAd();
  }

  Future<void> loadAd() async {
    emit(const AdLoadState.loading());
    try {
      await InterstitialAd.load(
        adUnitId: AdHelper.shuffleAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = const FullScreenContentCallback();
            emit(AdLoadState.loaded(ad));
          },
          onAdFailedToLoad: (error) => throw Exception(),
        ),
      );
    } catch (e) {
      emit(const AdLoadState.error("Failed to load AD"));
    }
  }

  Future<void> showAd(InterstitialAd ad) async {
    emit(const AdLoadState.loading());
    try {
      await ad.show();
    } catch (e) {
      emit(const AdLoadState.error("Failed to show AD"));
    }
    loadAd();
  }
}
