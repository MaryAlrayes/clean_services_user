// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'item_cell_cubit.dart';

abstract class ItemCellState extends Equatable {
  const ItemCellState();

  @override
  List<Object> get props => [];
}

class ItemCellInitial extends ItemCellState {}

class ItemCellChanged extends ItemCellState {
  final LaundryService laundryService;
  const ItemCellChanged({
    required this.laundryService,
  });
  @override
  List<Object> get props => [laundryService];
}
