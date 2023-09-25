import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services/features/laundries/data/basic_service.dart';

part 'services_cell_state.dart';

class ServicesCellCubit extends Cubit<ServicesCellListState> {
  ServicesCellCubit()
      : super(const ServicesCellListState(basicServicesList: []));

  void serviceChanged(BasicService service) {
    List<BasicService> newList = [];
    newList.addAll(state.basicServicesList);

    if (state.basicServicesList.contains(service)) {
      newList.remove(service);
    } else {
      newList.add(service);
    }

    emit(ServicesCellListState(basicServicesList: newList));
  }
}
