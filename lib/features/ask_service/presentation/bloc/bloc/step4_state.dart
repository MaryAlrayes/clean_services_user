// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'step4_bloc.dart';
enum Step4Validation{
  choosen,
  notChoosen
}
class Step4State extends Equatable {
  final PayTypes? payTypes;
  final Step4Validation validation;
  final bool isDone;
  const Step4State({
    this.payTypes,
    required this.validation,
    required this.isDone
});

  @override
  List<Object> get props => [payTypes.toString(),validation,isDone, identityHashCode(this)];



  Step4State copyWith({
    PayTypes? payTypes,
    Step4Validation? validation,
    bool? isDone,
  }) {
    return Step4State(
      payTypes: payTypes ?? this.payTypes,
      validation: validation ?? this.validation,
      isDone: isDone ?? this.isDone,
    );
  }
}


