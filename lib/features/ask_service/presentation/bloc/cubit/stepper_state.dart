part of 'stepper_cubit.dart';

class StepperState extends Equatable {
  final int currentStep;
  final int maxStep;
  const StepperState({
    required this.currentStep,
    required this.maxStep,
  });

  @override
  List<Object> get props => [currentStep,maxStep];
}
