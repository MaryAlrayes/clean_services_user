import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saudi_clean_services/features/laundries/data/laundry_service.dart';

part 'item_cell_state.dart';

class ItemCellCubit extends Cubit<ItemCellState> {
  ItemCellCubit() : super(ItemCellInitial());

  void changeItem(LaundryService laundryService){
    emit(ItemCellChanged(laundryService: laundryService));

  }
}
