import 'package:flutter_bloc/flutter_bloc.dart';

class AdCntCubit extends Cubit<int> {
  AdCntCubit() : super(1);

  void raise() => emit(state + 1);
}
