// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'step2_bloc.dart';

enum Step2Validation { init, missedValues, empty, valid }

class Step2Data extends Equatable {
  final String item;
  final List<BasicService> services;
  final int count;
  final double price;

  Step2Data(
      {required this.item,
      required this.services,
      required this.count,
      required this.price,
 });

  factory Step2Data.empty() {
    return Step2Data(
        item: '',
        services: const [],
        count: 0,
        price: 0.0,
       );
  }
  factory Step2Data.ignore() {
    return Step2Data(
      item: 'null',
      services: const [],
      count: -1,
      price: -1,
    );
  }

  @override
  List<Object?> get props => [
        item,
        services,
        count,
        price,


      ];

  @override
  bool get stringify => true;
}

class Step2State extends Equatable {
  final List<Step2Data> data;
  final Step2Validation validation;

  const Step2State({required this.data, required this.validation});
  factory Step2State.empty() {
    return Step2State(
        data: [Step2Data.empty()], validation: Step2Validation.init);
  }
  @override
  List<Object> get props => [data, validation, identityHashCode(this)];

  Step2State copyWith({
    List<Step2Data>? data,
    Step2Validation? validation,
  }) {
    return Step2State(
      data: data ?? this.data,
      validation: validation ?? this.validation,
    );
  }

  @override
  bool get stringify => true;
}
