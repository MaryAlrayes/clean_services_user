import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services/core/utils/enums/enums.dart';

part 'step4_event.dart';
part 'step4_state.dart';

class Step4Bloc extends Bloc<Step4Event, Step4State> {
  Step4Bloc()
      : super(const Step4State(validation: Step4Validation.notChoosen,isDone: false)) {
    on<PayMthodChanged>((event, emit) {
      emit(state.copyWith(
          payTypes: event.payTypes, validation: Step4Validation.choosen,isDone: false));
    });
    on<DoneEvent>((event, emit) {
      if (state.payTypes == null) {
        emit(state.copyWith(validation: Step4Validation.notChoosen,isDone: false));
      } else {
        emit(state.copyWith(
            payTypes: state.payTypes, validation: Step4Validation.choosen,isDone: true));
      }
    });
  }
}
