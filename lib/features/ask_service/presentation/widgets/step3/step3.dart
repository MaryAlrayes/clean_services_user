import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/managers/font_manager.dart';
import '../../../../../core/managers/styles_manager.dart';
import '../../../../../core/ui/widgets/custom_card.dart';
import '../../../../../core/ui/widgets/custom_label.dart';
import '../../../../../core/ui/widgets/order_details_table.dart';
import '../../../../orders/data/order_services.dart';
import '../../bloc/bloc/step1_bloc.dart';
import '../../bloc/bloc/step2_bloc.dart';
import '../../bloc/cubit/stepper_cubit.dart';
import '../next_btn.dart';
import '../previous_btn.dart';

class Step3 extends StatelessWidget {
  Step3({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildConfirmLabel(context),
        const SizedBox(
          height: 16,
        ),
        CustomCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLaundryName(),
              const SizedBox(
                height: 16,
              ),
              _buildCity(),
              const SizedBox(
                height: 16,
              ),
              _buildFloorBuildingNumber(),
              const SizedBox(
                height: 16,
              ),
              _buildOrderedServices()
            ],
          ),
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
    );
  }

  Text _buildConfirmLabel(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.check_order_befor_pay,
      textAlign: TextAlign.center,
      style: getSemiBoldStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
    );
  }

  Widget _buildOrderedServices() {
    return BlocBuilder<Step2Bloc, Step2State>(
      builder: (context, state) {
        if (state.validation == Step2Validation.valid) {
          List<Step2Data> data = state.data;
          List<OrderService> order = [];
          double total = 0.0;

          for (int i = 0; i < data.length; i++) {
            total += data[i].price;
            order.add(
              OrderService(
                serviceId: (i + 1).toString(),
                item: data[i].item,
                serviceType: data[i].services.map((e) => e.service).toList(),
                count: data[i].count,
                price: data[i].price,
              ),
            );
          }

          return OrderDetailsTable(
            services: order,
            price: total,
            commission: 5,
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildFloorBuildingNumber() {
    return BlocBuilder<Step1Bloc, Step1State>(
      builder: (context, state) {
        return Column(
          children: [
            _buildRow(
                    '${AppLocalizations.of(context)!.building_number}: ',

                    state.buildingNumber.toString(),
                  )
            // Expanded(
            //   child: Column(
            //     children: [
            //       _buildLabel(
            //         '${AppLocalizations.of(context)!.building_number}: ',
            //       ),
            //       const SizedBox(
            //         width: 12,
            //       ),
            //       _buildValue(
            //         state.buildingNumber.toString(),
            //       )
            //     ],
            //   ),
            // ),
            , _buildRow(
                    '${AppLocalizations.of(context)!.floor_number}: ',

                    state.floorNumber.toString(),
                  )
            // Expanded(
            //   child: Column(
            //     children: [
            //       _buildLabel(
            //         '${AppLocalizations.of(context)!.floor_number}: ',
            //       ),
            //       const SizedBox(
            //         width: 12,
            //       ),
            //       _buildValue(
            //         state.floorNumber.toString(),
            //       )
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }

  Widget _buildCity() {
    return BlocBuilder<Step1Bloc, Step1State>(
      builder: (context, state) {
        return _buildRow('${AppLocalizations.of(context)!.city}: ', state.city);
      },
    );
  }

  Widget _buildLaundryName() {
    return BlocBuilder<Step1Bloc, Step1State>(
      builder: (context, state) {
        return _buildRow('${AppLocalizations.of(context)!.laundry_name}: ',
            state.laundryName);
      },
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(
          label,
        ),
        const SizedBox(width: 8,),
        Expanded(

          child: _buildValue(
            value,
          ),
        )
      ],
    );
  }

  Widget _buildLabel(String label) {
    return CustomLabel(
      text: label,
    );
  }

  Widget _buildValue(String value) {
    return Text(
      value,
      style: getRegularStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
    );
  }

  Widget _builsNextBtn(BuildContext context) {
    return NextBtn(
        text: AppLocalizations.of(context)!.continue_btn,
        handler: () {
          BlocProvider.of<StepperCubit>(context).nextStep();
        });
  }

  Widget _builsPreviousBtn(BuildContext context) {
    return PreviousBtn(handler: () {
      BlocProvider.of<StepperCubit>(context).previousStep();
    });
  }
}
