import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/helpers/snackbar.dart';
import '../../../../laundries/data/laundry.dart';
import '../../bloc/bloc/step2_bloc.dart';
import '../../bloc/cubit/stepper_cubit.dart';
import '../next_btn.dart';
import '../previous_btn.dart';
import 'table_form/table_form.dart';

class Step2 extends StatelessWidget {
  final Laundry laundry;
  const Step2({super.key, required this.laundry});

  @override
  Widget build(BuildContext context) {
    return BlocListener<Step2Bloc, Step2State>(
      listener: (context, state) {
     
        if (state.validation == Step2Validation.valid) {
          BlocProvider.of<StepperCubit>(context).nextStep();
        } else {
          _getSnackbar(context, state.validation);
        }
      },
      child: Column(
        children: [
          TableForm(
            services: laundry.services,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _builsNextBtn(context)),
              const SizedBox(
                width: 8,
              ),
              Expanded(child: _builsPreviousBtn(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _builsNextBtn(BuildContext context) {
    return NextBtn(
        text: AppLocalizations.of(context)!.continue_btn,
        handler: () {
          BlocProvider.of<Step2Bloc>(context).add(SumbitStep2Event());
        });
  }

  Widget _builsPreviousBtn(BuildContext context) {
    return PreviousBtn(handler: () {
      BlocProvider.of<StepperCubit>(context).previousStep();
    });
  }

  void _getSnackbar(BuildContext context, Step2Validation validation) {
    switch (validation) {
      case Step2Validation.init:
        break;
      case Step2Validation.empty:
        showSnackbar(context,
            AppLocalizations.of(context)!.you_must_order_at_least_one_service);
        break;
      case Step2Validation.missedValues:
        showSnackbar(context, AppLocalizations.of(context)!.fill_all_services);
        break;

      case Step2Validation.valid:
        break;
    }
  }
}
