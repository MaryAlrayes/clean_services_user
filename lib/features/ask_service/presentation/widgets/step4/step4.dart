import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../../core/ui/widgets/custom_label.dart';
import '../../../../../core/utils/enums/enums.dart';
import '../../../../../core/utils/helpers/snackbar.dart';
import '../../bloc/bloc/step4_bloc.dart';
import '../../bloc/cubit/stepper_cubit.dart';
import '../../dialog/loading_dialog.dart';
import '../../dialog/sent_dialog.dart';
import '../next_btn.dart';
import '../previous_btn.dart';
import 'credit_card_info.dart';
import 'paying_list.dart';

class Step4 extends StatelessWidget {
  Step4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<Step4Bloc, Step4State>(
        listener: (context, state) {
          if (state.validation == Step4Validation.choosen) {
            if (state.payTypes == PayTypes.masterCard) {
              _showDetails(context, PayTypes.masterCard);
            } else if (state.payTypes == PayTypes.visaCard) {
              _showDetails(context, PayTypes.visaCard);
            } else if (state.isDone) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) =>
                    showLoadingDialog(context, '${AppLocalizations.of(context)!.sending_order}...'),
              );
              Future.delayed(
                const Duration(seconds: 1),
                () {
                  Navigator.pop(context);
                  Navigator.pop(context);

                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => showSentDialog(context),
                  );
                },
              );
            }
          } else if (state.validation == Step4Validation.notChoosen) {
            _getSnackbar(context, state.validation);
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomLabel(
                text: AppLocalizations.of(context)!.choose_payment_mode),
            const SizedBox(
              height: 8,
            ),
            PayingList(),
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
        ));
  }

  Widget _builsNextBtn(BuildContext context) {
    return NextBtn(
        text: AppLocalizations.of(context)!.send,
        handler: () {
          BlocProvider.of<Step4Bloc>(context).add(DoneEvent());
        });
  }

  Widget _builsPreviousBtn(BuildContext context) {
    return PreviousBtn(handler: () {
      BlocProvider.of<StepperCubit>(context).previousStep();
    });
  }

  void _getSnackbar(BuildContext context, Step4Validation validation) {
    switch (validation) {
      case Step4Validation.choosen:
        break;
      case Step4Validation.notChoosen:
        showSnackbar(
          context,
          AppLocalizations.of(context)!.you_should_choose_payment_mode,
        );
        break;
    }
  }

  Future<dynamic> _showDetails(BuildContext c, PayTypes payTypes) {
    return showSlidingBottomSheet(
      c,
      builder: (context) => SlidingSheetDialog(
        cornerRadius: 20,
        avoidStatusBar: true,
        color: Colors.white,
        snapSpec: const SnapSpec(snappings: [0.5, 1]),
        headerBuilder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
        builder: (context, state) => CreditCardInfo(
          payTypes: payTypes,
        ),
      ),
    );
  }
}
