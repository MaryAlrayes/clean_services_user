// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'step2_bloc.dart';

abstract class Step2Event extends Equatable {
  const Step2Event();

  @override
  List<Object> get props => [];
}

class AddNewRowEvent extends Step2Event {}

class RemoveRowEvent extends Step2Event {
  final int index;
  const RemoveRowEvent({
    required this.index,
  });
  @override
  List<Object> get props => [index];
}

class ItemChangedEvent extends Step2Event {
  final String item;
  final int index;
  const ItemChangedEvent({
    required this.item,
    required this.index,
  });
  @override
  List<Object> get props => [item, index];
}

class ServicesChangedEvent extends Step2Event {
  final List<BasicService> services;
  final int index;
  const ServicesChangedEvent({
    required this.services,
    required this.index,
  });
  @override
  List<Object> get props => [services, index];
}

class CountChangedEvent extends Step2Event {
  final int count;
  final int index;
  const CountChangedEvent({
    required this.count,
    required this.index,
  });
  @override
  List<Object> get props => [count, index];
}

class PriceChangedEvent extends Step2Event {
  final double price;
  final int index;
  const PriceChangedEvent({
    required this.price,
    required this.index,
  });
  @override
  List<Object> get props => [price, index];
}
class SumbitStep2Event extends Step2Event{}
