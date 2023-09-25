// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:saudi_clean_services/features/ask_service/data/user_coords.dart';

part 'coords_state.dart';

class CoordsCubit extends Cubit<CoordsState> {
  final UserCoords userCoords;
  CoordsCubit({
   required this.userCoords,
  }
  ) : super(CoordsInitial());

  void fetchLocation() async {
    emit(CoordsLoading());
    try{
    Coords coords = await userCoords.getCoords();
    emit(CoordsFetched(coords: coords));
    }on Exception {
      emit(CoordsError());
    }
    }
}
