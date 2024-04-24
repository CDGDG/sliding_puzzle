import 'dart:io';

class AdHelper {
  static String get shuffleAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1621368328779321/9332914517";
    } else if (Platform.isIOS) {
      return "ca-app-pub-1621368328779321/4678960429";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
