// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'services_cell_cubit.dart';



class ServicesCellListState extends Equatable {
  final List<BasicService> basicServicesList;
  const ServicesCellListState({
    required this.basicServicesList,
  });
  @override
  List<Object> get props => [basicServicesList];
}
