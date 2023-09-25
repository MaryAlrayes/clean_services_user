
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../laundries/data/laundry.dart';
import '../bloc/cubit/stepper_cubit.dart';
import '../widgets/step1/step1.dart';
import '../widgets/step2/step2.dart';
import '../widgets/step3/step3.dart';
import '../widgets/step4/step4.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AskServiceStepper extends StatelessWidget {
  final Laundry laundry;
  const AskServiceStepper({super.key, required this.laundry});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepperCubit, StepperState>(
      builder: (context, state) {
        return Stepper(
          currentStep: state.currentStep,
          onStepTapped: null,
          controlsBuilder: (context, details) {
            return Container();
          },
          steps: [
            _buildStep1(state,context),
            _buildStep2(state,context),
            _buildStep3(state,context),
            _buildStep4(state,context),
          ],
        );
      },
    );
  }

  Step _buildStep4(StepperState state,BuildContext context) {
    return Step(
        state: state.currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: state.currentStep >= 3,
        title: Text(AppLocalizations.of(context)!.step4_payment),
        content: Step4());
  }

  Step _buildStep3(StepperState state,BuildContext context) {
    return Step(
        state: state.currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: state.currentStep >= 2,
        title: Text(AppLocalizations.of(context)!.step3_confirm,),
        content: Center(
          child: Step3(),
        ));
  }

  Step _buildStep2(StepperState state,BuildContext context) {
    return Step(
      state: state.currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: state.currentStep >= 1,
      title: Text(AppLocalizations.of(context)!.step2_services),
      content: Step2(
        laundry: laundry,
      ),
    );
  }

  Step _buildStep1(StepperState state,BuildContext context) {
    return Step(
        state: state.currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: state.currentStep >= 0,
        title: Text(AppLocalizations.of(context)!.step1_location),
        content: Center(
          child: Step1(laundry: laundry),
        ));
  }
}
