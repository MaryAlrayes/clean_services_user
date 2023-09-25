import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/widgets/deliver_check_box.dart';

import '../../../../../core/ui/widgets/custom_label.dart';
import '../../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../../core/utils/helpers/snackbar.dart';
import '../../../../laundries/data/laundry.dart';
import '../../bloc/bloc/step1_bloc.dart';
import '../../bloc/cubit/stepper_cubit.dart';
import '../../dialog/confirm_exitting.dart';
import '../next_btn.dart';
import '../previous_btn.dart';
import 'location_coords.dart';
import 'user_city_drop_down.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Step1 extends StatelessWidget {
  final Laundry laundry;
  const Step1({
    Key? key,
    required this.laundry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<Step1Bloc, Step1State>(
      listener: (context, state) {
        if (state.validation == Step1Validation.valid) {
          BlocProvider.of<StepperCubit>(context).nextStep();
        } else {
          _getSnackbar(context, state.validation);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              _buildUserCity(context),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(child: _buildBuildingNumberField(context)),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(child: _buildFloorNumberField(context)),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              _buildUserCoords(context),
              const SizedBox(
                height: 12,
              ),
              const DeliverCheckBox()
            ],
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

  Widget _buildUserCity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.choose_city),
        const SizedBox(
          height: 8,
        ),
        const UserCityDropDown(),
      ],
    );
  }

  Widget _buildBuildingNumberField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         CustomLabel(text: AppLocalizations.of(context)!.building_number),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: BlocBuilder<Step1Bloc, Step1State>(
            builder: (context, state) {
              return CustomTextField(
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                hintText: AppLocalizations.of(context)!.building_number,
                onChanged: (String value) {
                  int? n = int.tryParse(value);
                  if (n != null) {
                    BlocProvider.of<Step1Bloc>(context)
                        .add(BuildingNumberChangedEvent(buildingNumber: n));
                  }
                },
                validator: (String? value) {},
                initalValue: state.buildingNumber.toString() == '-1'
                    ? null
                    : state.buildingNumber.toString(),
                isObscure: false,
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildFloorNumberField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         CustomLabel(text: AppLocalizations.of(context)!.floor_number),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: BlocBuilder<Step1Bloc, Step1State>(
            builder: (context, state) {
              return CustomTextField(
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                hintText: AppLocalizations.of(context)!.floor_number,
                onChanged: (String value) {
                  int? n = int.tryParse(value);
                  if (n != null) {
                    BlocProvider.of<Step1Bloc>(context)
                        .add(FloorNumberChangedEvent(floorNumber: n));
                  }
                },
                initalValue: state.floorNumber.toString() == '-1'
                    ? null
                    : state.floorNumber.toString(),
                validator: (String? value) {},
                isObscure: false,
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildUserCoords(BuildContext context) {
    return const LocationCoords();
  }

  Widget _builsNextBtn(BuildContext context) {
    return NextBtn(
        text: AppLocalizations.of(context)!.continue_btn,
        handler: () {
          BlocProvider.of<Step1Bloc>(context)
              .add(LaundryChangedEvent(laundry: laundry.name));
          BlocProvider.of<Step1Bloc>(context).add(SumbitStep1Event());
        });
  }

  Widget _builsPreviousBtn(BuildContext context) {
    return PreviousBtn(handler: () {
      showDialog(
        context: context,
        builder: (context) {
          return showExitDialog(context);
        },
      );
    });
  }

  void _getSnackbar(BuildContext context, Step1Validation validation) {
    switch (validation) {
      case Step1Validation.init:
        break;
      case Step1Validation.cityEmpty:
        showSnackbar(context,AppLocalizations.of(context)!.missed_city_step1);
        break;
      case Step1Validation.buildingNumberEmpty:
        showSnackbar(context, AppLocalizations.of(context)!.missed_building_number_step1);
        break;
      case Step1Validation.floorNumberEmpty:
        showSnackbar(context, AppLocalizations.of(context)!.missed_floor_number_step1);
        break;
      case Step1Validation.coordsEmpty:
        showSnackbar(context, AppLocalizations.of(context)!.missed_coords_step1);
        break;
      case Step1Validation.negativeNumber:
        showSnackbar(context, AppLocalizations.of(context)!.negative_numbers_step1);
        break;
      case Step1Validation.valid:
        break;
    }
  }
}
