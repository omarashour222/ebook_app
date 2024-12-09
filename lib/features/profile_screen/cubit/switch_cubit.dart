import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  bool switchValue = true;
  bool faceId = true;
  bool passCode = false;
  SwitchCubit() : super(SwitchInitial());

  void authSwitch(value) {
    switchValue = value;
    emit(AuthSwitch());
  }

  void faceIdSwitch(value) {
    faceId = value;
    emit(FaceIdSwitch());
  }

  void passCodeswitch(value) {
    passCode = value;
    emit(PassCodeLockSwitch());
  }
}
