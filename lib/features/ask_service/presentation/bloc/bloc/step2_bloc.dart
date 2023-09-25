import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/bloc/cubit/item_cell_cubit.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/bloc/cubit/items_number_cubit.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/bloc/cubit/services_cell_cubit.dart';
import 'package:saudi_clean_services/features/laundries/data/basic_service.dart';

part 'step2_event.dart';
part 'step2_state.dart';

class Step2Bloc extends Bloc<Step2Event, Step2State> {
  Step2Bloc() : super(Step2State.empty()) {

    on<AddNewRowEvent>((event, emit) {
      Step2Data newRow = Step2Data.empty();
      List<Step2Data> data = state.data;
      List<Step2Data> newData = [];
      newData.addAll(data);
      newData.add(newRow);
      emit(state.copyWith(data: newData, validation: Step2Validation.init));
    });

    on<RemoveRowEvent>((event, emit) {
      List<Step2Data> data = [];
      data.addAll(state.data);
      if (event.index <= data.length - 1) {
        Step2Data ignoredData = Step2Data.ignore();
        data[event.index] = ignoredData;
      } else {}
      emit(state.copyWith(data: data, validation: Step2Validation.init));
    });

    on<ItemChangedEvent>((event, emit) {
      print('index ${event.index}');
      List<Step2Data> data = [];
      data.addAll(state.data);
      if (event.index <= data.length - 1) {
        Step2Data currentData = state.data[event.index];
        Step2Data newDate = Step2Data(
            item: event.item,
            services: currentData.services,
            count: currentData.count,
            price: currentData.price,
          );
        data[event.index] = newDate;
      }
      emit(state.copyWith(data: data, validation: Step2Validation.init));
    });

    on<ServicesChangedEvent>((event, emit) {
      print('index ${event.index}');
      List<Step2Data> data = [];
      data.addAll(state.data);
      if (event.index <= data.length - 1) {
        Step2Data currentData = state.data[event.index];
        Step2Data newDate = Step2Data(
            item: currentData.item,
            services: event.services,
            count: currentData.count,
            price: currentData.price,
      );
        data[event.index] = newDate;
      }
      emit(state.copyWith(data: data, validation: Step2Validation.init));
    });

    on<CountChangedEvent>((event, emit) {
      print('index ${event.index}');
      List<Step2Data> data = [];
      data.addAll(state.data);
      if (event.index <= data.length - 1) {
        Step2Data currentData = state.data[event.index];
        Step2Data newDate = Step2Data(
            item: currentData.item,
            services: currentData.services,
            count: event.count,
            price: currentData.price,
          );
        data[event.index] = newDate;
      }
      emit(state.copyWith(data: data, validation: Step2Validation.init));
    });

    on<PriceChangedEvent>((event, emit) {
      print('index ${event.index}');
      List<Step2Data> data = [];
      data.addAll(state.data);
      if (event.index <= data.length - 1) {
        Step2Data currentData = state.data[event.index];
        Step2Data newDate = Step2Data(
            item: currentData.item,
            services: currentData.services,
            count: currentData.count,
            price: event.price,
           );
        data[event.index] = newDate;
      }
      emit(state.copyWith(data: data, validation: Step2Validation.init));
    });

    on<SumbitStep2Event>((event, emit) {
      print('in state ${state.toString()}');
      List<Step2Data> data = state.data;
      List<Step2Data> validData = [];
      bool isValid = true;
      int ignoredRowsCount = 0;
      for (int i = 0; i < data.length; i++) {
        Step2Data row = data[i];

        if (row.item == 'null') {
          ignoredRowsCount++;
        } else if (row.item == '' || row.services.isEmpty || row.count == 0) {
          isValid = false;
          emit(state.copyWith(validation: Step2Validation.missedValues));
          return;
        } else {
          validData.add(row);
        }
      }
      if (ignoredRowsCount == data.length) {
        emit(state.copyWith(validation: Step2Validation.empty));
      } else if (isValid) {
        emit(
            state.copyWith(validation: Step2Validation.valid, data: validData));
      }
    });
  }
}
