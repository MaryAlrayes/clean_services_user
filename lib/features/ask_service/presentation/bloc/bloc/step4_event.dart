// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'step4_bloc.dart';

abstract class Step4Event extends Equatable {
  const Step4Event();

  @override
  List<Object> get props => [];
}
class PayMthodChanged extends Step4Event {
   final PayTypes payTypes;
  const PayMthodChanged({
    required this.payTypes,
  });
}

class DoneEvent extends Step4Event{}
