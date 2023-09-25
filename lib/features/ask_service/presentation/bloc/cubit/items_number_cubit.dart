
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'items_number_state.dart';

class ItemsNumberCubit extends Cubit<ItemsNumberState> {
  ItemsNumberCubit() : super(const ItemsNumberState(number: 0));
  void numberChanged (int number){
    emit(ItemsNumberState(number: number));
  }
}
