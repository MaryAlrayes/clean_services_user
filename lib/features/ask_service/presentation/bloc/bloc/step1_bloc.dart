
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'step1_event.dart';
part 'step1_state.dart';

class Step1Bloc extends Bloc<Step1Event, Step1State> {
  Step1Bloc() : super(Step1State.empty()) {
    on<LaundryChangedEvent>((event, emit) {
      emit(state.copyWith(
          laundryName: event.laundry, validation: Step1Validation.init));
    });

    on<CityChangedEvent>((event, emit) {
      emit(state.copyWith(city: event.city, validation: Step1Validation.init));
    });

    on<BuildingNumberChangedEvent>((event, emit) {
      emit(state.copyWith(
          buildingNumber: event.buildingNumber,
          validation: Step1Validation.init));
    });

    on<FloorNumberChangedEvent>((event, emit) {
      emit(state.copyWith(
          floorNumber: event.floorNumber, validation: Step1Validation.init));
    });

    on<CoordsChangedEvent>((event, emit) {
      emit(state.copyWith(
          lat: event.lat, lng: event.lng, validation: Step1Validation.init));
    });

    on<SumbitStep1Event>((event, emit) {
      if (state.city.isEmpty) {
        emit(state.copyWith(validation: Step1Validation.cityEmpty));
      } else if (state.buildingNumber == -1) {
        emit(state.copyWith(validation: Step1Validation.buildingNumberEmpty));
      } else if (state.floorNumber == -1) {
        emit(state.copyWith(validation: Step1Validation.floorNumberEmpty));
      } else if (state.lat == 0 || state.lng == 0) {
        emit(state.copyWith(validation: Step1Validation.coordsEmpty));
      } else if (state.buildingNumber < 0 || state.floorNumber < 0) {
        emit(state.copyWith(validation: Step1Validation.negativeNumber));
      } else {
        emit(state.copyWith(validation: Step1Validation.valid));
      }
    });
    
  }
}
